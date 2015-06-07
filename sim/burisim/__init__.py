"""
Simulate the buri microcomputer.

Usage:
    burisim (-h | --help)
    burisim [options] [--serial URL] [--load FILE] <rom>

Options:
    -h, --help          Show a brief usage summary.
    -q, --quiet         Decrease verbosity.

    --trace             Trace CPU execution.

Hardware options:
    --serial URL        Connect ACIA1 to this serial port. [default: loop://]
    --load FILE         Pre-load FILE at location 0x5000 in RAM.

    See http://pyserial.sourceforge.net/pyserial_api.html#urls for a discussion
    of possible serial connection URLs.

"""
# Make py2 like py3
from __future__ import (absolute_import, division, print_function, unicode_literals)
from builtins import (  # pylint: disable=redefined-builtin, unused-import
    bytes, dict, int, list, object, range, str,
    ascii, chr, hex, input, next, oct, open,
    pow, round, super,
    filter, map, zip
)

from past.builtins import basestring # pylint: disable=redefined-builtin

from collections import deque
from contextlib import contextmanager
from itertools import cycle
import logging
import struct
import sys

from docopt import docopt
from py65.devices.mpu65c02 import MPU
from py65.memory import ObservableMemory
import serial

from .crt import ScreenMemory

_LOGGER = logging.getLogger(__name__)

class MachineError(Exception):
    pass

class ReadOnlyMemoryError(MachineError):
    """Raised when code had attempter to write to read-only memory."""
    def __init__(self, address, value):
        self.address = address
        self.value = value
        super(ReadOnlyMemoryError, self).__init__(
            'Illegal attempt to write ${0.value:02X} to ${0.address:04X}'.format(self)
        )

class BuriSim(object):
    ROM_SIZE = 0x2000 # 8K
    ROM_RANGE = 0x10000 - ROM_SIZE, 0x10000
    ACIA1_RANGE = 0xDFFC, 0xDFFF

    # Screen memory is at top of RAM from 0x7B00
    SCREEN_RANGE = 0x7B00, 0x7B00 + ScreenMemory.SCREEN_SIZE_BYTES

    def __init__(self):
        self.tracing = False

        # Behaviour flags
        self._raise_on_rom_write = True

        # Create CRT
        self.screen = ScreenMemory()

        # Create memory space
        self.mem = ObservableMemory(addrWidth=MPU.ADDR_WIDTH)

        # Create microprocessor
        self.mpu = MPU(memory=self.mem)

        # Create I/O devices
        self.acia1 = ACIA()

        # Setup memory observers
        self._add_mem_observers()

        # Reset the computer
        self.reset()

    def load_rom(self, fobj_or_string):
        """Load a ROM image from the passed file object or filename-string. The
        ROM is truncated or repeated as necessary to fill the buri ROM region.

        """
        if isinstance(fobj_or_string, basestring):
            with open(fobj_or_string, 'rb') as fobj:
                self.load_rom_bytes(fobj.read())
        else:
            self.load_rom_bytes(fobj_or_string.read())

    def load_ram(self, fobj_or_string, addr):
        """Load a RAM image from the passed file object or filename-string.

        """
        if isinstance(fobj_or_string, basestring):
            with open(fobj_or_string, 'rb') as fobj:
                self.load_ram_bytes(fobj.read(), addr)
        else:
            self.load_ram_bytes(fobj_or_string.read(), addr)

    def load_rom_bytes(self, rom_bytes):
        """Load a ROM image from the passed bytes object. The ROM is truncated
        or repeated as necessary to fill the buri ROM region.

        """
        _LOGGER.info(
            'loading %s bytes from ROM image of %s bytes',
            BuriSim.ROM_RANGE[1] - BuriSim.ROM_RANGE[0], len(rom_bytes)
        )

        # Copy ROM from 0xC000 to 0xFFFF. Loop if necessary.
        with self.writable_rom():
            for addr, val in zip(range(*BuriSim.ROM_RANGE), cycle(rom_bytes)):
                self.mem[addr] = val

    def load_ram_bytes(self, ram_bytes, addr):
        """Load a RAM image from the passed bytes object.

        """
        _LOGGER.info('loading RAM image of %s bytes', len(ram_bytes))

        for off, val in enumerate(ram_bytes):
            self.mem[addr + off] = val

    def reset(self):
        """Perform a hardware reset."""
        # Reset hardware
        self.acia1.hw_reset()

        # Reset MPU
        self.mpu.reset()

        # Read reset-vector
        self.mpu.pc = self.mpu.WordAt(MPU.RESET)

    def step(self):
        """Single-step the machine."""
        # Poll hardware (inefficient but simple)
        self.acia1.poll()

        # Look for IRQs
        if self.acia1.irq:
            self.trigger_irq()

        # Step CPU
        if self.tracing:
            _LOGGER.info(repr(self.mpu))
        self.mpu.step()

    def trigger_irq(self):
        """Trigger an IRQ on the machine."""
        # Do nothing if interrupts disabled
        if self.mpu.p & MPU.INTERRUPT != 0:
            return

        # Push PC and P
        self.mpu.stPushWord(self.mpu.pc)
        self.mpu.stPush(self.mpu.p)

        # Set IRQ disable
        self.mpu.opSET(MPU.INTERRUPT)

        # Vector to IRQ handler
        self.mpu.pc = self.mpu.WordAt(self.mpu.IRQ)

    @contextmanager
    def writable_rom(self):
        """Return a context manager which will temporarily enable writing to
        ROM within the context and restore the old state after. Imagine this as
        a "EEPROM programmer".

        """
        old_val = self._raise_on_rom_write
        self._raise_on_rom_write = False
        yield
        self._raise_on_rom_write = old_val

    def _add_mem_observers(self):
        """Internal method to add read/write observers to memory."""
        def raise_hell(address, value):
            if self._raise_on_rom_write:
                raise ReadOnlyMemoryError(address, value)
        self.mem.subscribe_to_write(range(*BuriSim.ROM_RANGE), raise_hell)

        # Register screen
        self.screen.observe_mem(self.mem, BuriSim.SCREEN_RANGE[0])

        # Register ACIA
        self.acia1.observe_mem(self.mem, BuriSim.ACIA1_RANGE[0])

class ACIA(object):
    """Emulation of 6551-style ACIA. Optionally pass a PySerial-compatible
    object which will be the serial port connected to the ACIA.

    """
    # Mapping from selected baud rate value to baud rate.
    # None == unimplemented.
    _SBN_TABLE = [
        None, 50, 75, 109.92, 134.58, 150, 300, 600, 1200, 1800,
        2400, 2600, 4800, 7200, 9600, 19200,
    ]

    # Mapping from word length setting to word length constants
    _WL_TABLE = [serial.EIGHTBITS, serial.SEVENBITS, serial.SIXBITS, serial.FIVEBITS]

    # Mapping from parity mode control to parity constants
    _PMC_TABLE = [serial.PARITY_ODD, serial.PARITY_EVEN, serial.PARITY_NONE, serial.PARITY_NONE]

    # Status register bits
    _ST_IRQ = 0b10000000
    _ST_TDRE = 0b00010000
    _ST_RDRF = 0b00001000

    def __init__(self, serial_port=None):
        self.serial_port = None
        if serial_port is not None:
            self.connect_to_serial(serial_port)

        # Registers
        self._recv_data = 0
        self._status_reg = 0
        self._control_reg = 0
        self._command_reg = 0

        # read buffer
        self._in_buffer = deque()

        # Hardware-reset
        self.hw_reset()

    @property
    def irq(self):
        return self._status_reg & ACIA._ST_IRQ != 0

    def poll(self):
        """Call regularly to check for incoming data."""
        # Early out if no serial port attached or no data waiting
        sp = self.serial_port
        if sp is None:
            return

        while sp.inWaiting() != 0:
            self._in_buffer.append(struct.unpack('B', sp.read(1))[0])

        # There is some data, transfer next data if receive data reg is empty
        if len(self._in_buffer) > 0 and self._status_reg & ACIA._ST_RDRF == 0:
            self._recv_data = self._in_buffer.popleft()
            self._status_reg |= ACIA._ST_RDRF
            self._trigger_irq()

    def observe_mem(self, mem, start):
        """Add appropriate read/write observers to memory starting at a given
        address.

        """
        addr_rng = range(start, start+4)
        mem.subscribe_to_write(addr_rng, lambda addr, val: self.write_reg(addr-start, val))
        mem.subscribe_to_read(addr_rng, lambda addr: self.read_reg(addr-start))

    def connect_to_serial(self, serial_port):
        """Assign a PySerial-compatible object which will be used as the serial
        port for the ACIA. The serial port object is modified to reflect the
        current ACIA settings.

        """
        self.serial_port = serial_port
        if self.serial_port is not None:
            self.serial_port.timeout = 0
        self._update_serial_port()

    def hw_reset(self):
        """Perform a hardware reset."""
        self._status_reg = 0b00010000
        self._control_reg = 0b00000000
        self._command_reg = 0b00000000
        self._update_serial_port()

    def write_reg(self, reg_idx, value):
        """Write register using RS1 and RS0 as high and low bits indexing the
        register.

        """
        if reg_idx == 0:
            # Write transmit register
            self._tx(value)
        elif reg_idx == 1:
            # Programmed reset
            self._prog_reset()
        elif reg_idx == 2:
            # Write command reg.
            self._command_reg = value
            self._update_serial_port()
        elif reg_idx == 3:
            # Write control reg
            self._control_reg = value
            self._update_serial_port()
        else:
            raise IndexError('No such register: ' + repr(reg_idx))

    def read_reg(self, reg_idx):
        """Read register using RS1 and RS0 as high and low bits indexing the
        register.

        """
        if reg_idx == 0:
            # Read receiver register
            self._status_reg &= ~(ACIA._ST_RDRF) # clear data reg full flag
            return self._recv_data
        elif reg_idx == 1:
            # Read status register clearing interrupt bit after the fact
            sr = self._status_reg
            self._status_reg &= 0b01111111
            return sr
        elif reg_idx == 2:
            # Read command reg.
            return self._command_reg
        elif reg_idx == 3:
            # Read control reg.
            return self._control_reg
        else:
            raise IndexError('No such register: ' + repr(reg_idx))

    def _trigger_irq(self):
        """Trigger an interrupt."""
        if self._control_reg & 0b1100 == 0b0100:
            self._status_reg |= 0b10010000
        # FIXME: trigger on processor?

    def _prog_reset(self):
        """Perform a programmed reset."""
        # NOTE: does not change control reg
        self._status_reg = 0b00010000
        self._command_reg = 0b00000000
        self._update_serial_port()

    def _tx(self, value):
        """Transmit byte."""
        # Ensure transmit data reg. is empty
        if self._status_reg & ACIA._ST_TDRE == 0:
            _LOGGER.warn('serial port overflow: dropping output.')
            return

        # Clear transmit data empty reg
        self._status_reg &= ~(ACIA._ST_TDRE)

        # Write output
        if self.serial_port is not None:
            self.serial_port.write(struct.pack('B', value))

        # Set transmit data empty reg
        self._status_reg |= ACIA._ST_TDRE

        # Trigger IRQ if required
        tic = (self._command_reg >> 2) & 0b11
        if tic == 1:
            self._trigger_irq()

    def _update_serial_port(self):
        """Update associated serial port with new settings from control register."""
        if self.serial_port is None:
            return
        sp = self.serial_port

        # Extract control-register parameters
        # TODO: rcs setting is ignored
        sbn = (self._control_reg >> 7) & 0b1
        wl = (self._control_reg >> 5) & 0b11
        #rcs = (self._control_reg >> 4) & 0b1
        sbr = self._control_reg & 0b1111

        # Extract command-register parameters.
        # TODO: most of these are ignored
        pmc = (self._command_reg >> 6) & 0b11
        #pme = (self._command_reg >> 5) & 0b1
        #rem = (self._command_reg >> 4) & 0b1
        #tic = (self._command_reg >> 2) & 0b11
        #ird = (self._command_reg >> 1) & 0b1
        dtr = self._command_reg & 0b1

        # Set parameters
        baudrate = ACIA._SBN_TABLE[sbr]
        if baudrate is None:
            # Use maximum baudrate
            baudrate = max(*sp.BAUDRATES)
        sp.baudrate = baudrate

        # Set word length
        sp.bytesize = ACIA._WL_TABLE[wl]

        try:
            # Data terminal ready
            sp.setDTR(dtr == 1)

            # Set parity
            sp.parity = ACIA._PMC_TABLE[pmc]
        except OSError:
            # soft fail...
            pass

        # Set stop bits
        if sbn == 0:
            sp.stopbits = serial.STOPBITS_ONE
        elif sbn == 1:
            if sp.bytesize == serial.FIVEBITS and sp.partiy == serial.PARITY_NONE:
                sp.stopbits = serial.STOPBITS_ONE_POINT_FIVE
            elif sp.bytesize == serial.EIGHTBITS and sp.partiy == serial.PARITY_NONE:
                sp.stopbits = serial.STOPBITS_ONE
            else:
                sp.stopbits = serial.STOPBITS_TWO

def main():
    opts = docopt(__doc__)
    logging.basicConfig(
        level=logging.WARN if opts['--quiet'] else logging.INFO,
        stream=sys.stderr, format='%(name)s: %(message)s'
    )

    # Create simulator
    sim = BuriSim()
    sim.tracing = opts['--trace']

    # Create serial port
    sp = serial.serial_for_url(opts['--serial'])
    sim.acia1.connect_to_serial(sp)

    # Read ROM
    sim.load_rom(opts['<rom>'])

    if opts['--load'] is not None:
        sim.load_ram(opts['--load'], 0x5000)

    # Step
    sim.reset()
    while True:
        sim.step()

if __name__ == '__main__':
    main()