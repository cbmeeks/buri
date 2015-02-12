// Firmware for monitor board

#include "debounced_switch.h"
#include "edge_trigger.h"
#include "mx7219.h"
#include "pins.h"

// 16-bit address bus value
unsigned int address_bus;

// 8-bit data bus value
byte data_bus;

// Status bits
byte status_bits;

enum StatusBitMask {
    SB_RWBAR        = 0x01,
    SB_IRQBAR       = 0x02,
    SB_BE           = 0x04,
    SB_SYNC         = 0x08,
    SB_RSTBAR       = 0x10,
    SB_RDY          = 0x20,
};

// How long to show display test for
const int DPY_TST_DURATION = 500; // milliseconds

// Are we wanting the processor to be halted?
bool halt_request;

enum Words {
    WORD_RUN, WORD_START, WORD_HALT, WORD_STOP, WORD_STEP,
    WORD_CYCLE, WORD_INST, WORD_BURN, WORD_READ,
};

// Display strings
byte DISPLAY_WORDS[][6] = {
    { 0x15, 0x18, 0x12, 0x1A, 0x1A, 0x1A }, // "run   "
    { 0x16, 0x17, 0x0A, 0x15, 0x17, 0x1A }, // "StArt "
    { 0x10, 0x0A, 0x11, 0x17, 0x1A, 0x1A }, // "HALt  "
    { 0x16, 0x17, 0x13, 0x14, 0x1A, 0x1A }, // "StoP  "
    { 0x16, 0x17, 0x0E, 0x14, 0x1A, 0x1A }, // "StEP  "
    { 0x0C, 0x19, 0x0C, 0x11, 0x0E, 0x1A }, // "CYCLE "
    { 0x01, 0x12, 0x16, 0x17, 0x1A, 0x1A }, // "1nSt  "
    { 0x0B, 0x18, 0x15, 0x12, 0x1A, 0x1A }, // "burn  "
    { 0x15, 0x0E, 0x0A, 0x0D, 0x1A, 0x1A }, // "rEAd  "
};
const int DISPLAY_WORD_COUNT = sizeof(DISPLAY_WORDS) / sizeof(DISPLAY_WORDS[0]);

void showWord(int wordIdx) {
    byte* wordData = DISPLAY_WORDS[wordIdx];
    for(int digit=0; digit<6; ++digit) {
        setMX7219Reg(MX7219_DIGIT_0 + (5-digit), MX7219_FONT[wordData[digit]]);
    }
}

DebouncedSwitch mode_switch(BTN_MODE);
DebouncedSwitch select_switch(BTN_SELECT);

EdgeTrigger mode_trigger;
EdgeTrigger select_trigger;

void setup() {
    // Setup all pin modes
    pinMode(MOSI, OUTPUT);
    pinMode(MISO, INPUT);
    pinMode(SCLK, OUTPUT);
    pinMode(DLOAD, OUTPUT);
    pinMode(BTN_MODE, INPUT_PULLUP);
    pinMode(BTN_SELECT, INPUT_PULLUP);

    pinMode(STEP, OUTPUT);
    pinMode(HALT, OUTPUT);

    pinMode(BUS_PLBAR, OUTPUT);

    // Set up MX7219 with display test on
    setupMX7219();
    setMX7219Reg(MX7219_SCN_LIMIT, 0x06);   // Scan digits 0-6
    setMX7219Reg(MX7219_DPLY_TEST, 0x01);   // Enable display test
    unsigned long dt_shown_at = millis();   // Record display test time

    // Set bus shift registers to load
    digitalWrite(BUS_PLBAR, LOW);

    // Initial address/data bus values
    address_bus = data_bus = 0;

    // Initially all status bits are off
    status_bits = 0;

    // Processor is in running state
    halt_request = false;

    // OK, all done, just wait for display test to time out
    while(millis() - dt_shown_at < DPY_TST_DURATION) {
        // NOP
    }
    setMX7219Reg(MX7219_DPLY_TEST, 0x00);
}

void loop() {
    // Poll switches
    mode_switch.poll();
    select_switch.poll();

    // Update triggers
    mode_trigger.update(mode_switch.state() == HIGH);
    select_trigger.update(select_switch.state() == HIGH);

    if(mode_trigger.triggered()) {
        halt_request = !halt_request;
    }

    // Stop loading bus reg. and prepare for shifting
    digitalWrite(SCLK, HIGH);
    digitalWrite(BUS_PLBAR, HIGH);

    // Read from bus shift reg
    status_bits = shiftIn(MISO, SCLK, MSBFIRST);
    data_bus = shiftIn(MISO, SCLK, MSBFIRST);
    address_bus =
        (static_cast<unsigned int>(shiftIn(MISO, SCLK, MSBFIRST)) << 8) |
        static_cast<unsigned int>(shiftIn(MISO, SCLK, MSBFIRST));

    // Back to loading stata
    digitalWrite(BUS_PLBAR, LOW);

    // Update control lines
    digitalWrite(HALT, halt_request ? HIGH : LOW);

    // Update status bits
    setMX7219Reg(MX7219_DIGIT_0 + 6, status_bits);

    // Check halt state by directly observing RDY
    if(status_bits & SB_RDY) {
        // Processor running, show running dots
        int point = (millis() >> 7) % 6;
        for(int digit=0; digit<6; ++digit) {
            setMX7219Reg(MX7219_DIGIT_0 + digit, (point == (5-digit)) ? 0x80 : 0x00);
        }
    } else {
        // step only makes sense if processor halted
        if(select_trigger.triggered()) {
            // Pulse step pin
            digitalWrite(STEP, HIGH);
            digitalWrite(STEP, LOW);
        }

        // Update address bus
        setMX7219Reg(MX7219_DIGIT_0 + 0, MX7219_FONT[address_bus & 0xF]);
        setMX7219Reg(MX7219_DIGIT_0 + 1, MX7219_FONT[(address_bus>>4) & 0xF]);
        setMX7219Reg(MX7219_DIGIT_0 + 2, MX7219_FONT[(address_bus>>8) & 0xF]);
        setMX7219Reg(MX7219_DIGIT_0 + 3, MX7219_FONT[(address_bus>>12) & 0xF]);

        // Update data bus
        setMX7219Reg(MX7219_DIGIT_0 + 4, MX7219_FONT[data_bus & 0xF]);
        setMX7219Reg(MX7219_DIGIT_0 + 5, MX7219_FONT[(data_bus>>4) & 0xF]);
    }

    // Clear mode/select trigger
    mode_trigger.clear();
    select_trigger.clear();
}
