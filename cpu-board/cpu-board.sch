EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:65xx
LIBS:cpu-board
LIBS:IC_raspberry
LIBS:cpu-board-cache
EELAYER 24 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title "6502 Computer - Compute Board"
Date "3 feb 2015"
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CY7C199 U5
U 1 1 5476FF3E
P 5400 2150
F 0 "U5" H 5400 2200 60  0000 C CNN
F 1 "CY7C199" V 5400 3000 60  0000 R CNN
F 2 "" H 5400 2150 60  0000 C CNN
F 3 "" H 5400 2150 60  0000 C CNN
	1    5400 2150
	1    0    0    -1  
$EndComp
$Comp
L WD65C02_ U1
U 1 1 5476FF54
P 2300 2100
F 0 "U1" H 2300 2100 60  0000 C CNN
F 1 "WD65C02" V 2300 2900 60  0000 R CNN
F 2 "~" H 1750 2300 60  0000 C CNN
F 3 "~" H 1750 2300 60  0000 C CNN
	1    2300 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 54770ACA
P 2300 3200
F 0 "#PWR01" H 2300 3200 30  0001 C CNN
F 1 "GND" H 2300 3130 30  0001 C CNN
F 2 "" H 2300 3200 60  0000 C CNN
F 3 "" H 2300 3200 60  0000 C CNN
	1    2300 3200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 54770BB7
P 2300 5650
F 0 "#PWR02" H 2300 5650 30  0001 C CNN
F 1 "GND" H 2300 5580 30  0001 C CNN
F 2 "" H 2300 5650 60  0000 C CNN
F 3 "" H 2300 5650 60  0000 C CNN
	1    2300 5650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 54770C0F
P 5400 3200
F 0 "#PWR03" H 5400 3200 30  0001 C CNN
F 1 "GND" H 5400 3130 30  0001 C CNN
F 2 "" H 5400 3200 60  0000 C CNN
F 3 "" H 5400 3200 60  0000 C CNN
	1    5400 3200
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 54770C6A
P 5400 1150
F 0 "#PWR04" H 5400 1240 20  0001 C CNN
F 1 "+5V" H 5400 1240 30  0000 C CNN
F 2 "" H 5400 1150 60  0000 C CNN
F 3 "" H 5400 1150 60  0000 C CNN
	1    5400 1150
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR05
U 1 1 54770CCB
P 2300 3600
F 0 "#PWR05" H 2300 3690 20  0001 C CNN
F 1 "+5V" H 2300 3690 30  0000 C CNN
F 2 "" H 2300 3600 60  0000 C CNN
F 3 "" H 2300 3600 60  0000 C CNN
	1    2300 3600
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR06
U 1 1 54771900
P 2300 1150
F 0 "#PWR06" H 2300 1240 20  0001 C CNN
F 1 "+5V" H 2300 1240 30  0000 C CNN
F 2 "" H 2300 1150 60  0000 C CNN
F 3 "" H 2300 1150 60  0000 C CNN
	1    2300 1150
	1    0    0    -1  
$EndComp
NoConn ~ 1650 2150
$Comp
L R R4
U 1 1 5477105F
P 8300 2450
F 0 "R4" V 8380 2450 40  0000 C CNN
F 1 "3.3K" V 8307 2451 40  0000 C CNN
F 2 "~" V 8230 2450 30  0000 C CNN
F 3 "~" H 8300 2450 30  0000 C CNN
	1    8300 2450
	0    1    1    0   
$EndComp
NoConn ~ 1650 2350
Text Label 9300 1950 0    60   ~ 0
A0
Text Label 4500 2650 0    60   ~ 0
A0
Text Label 1350 3700 0    60   ~ 0
A0
Text Label 3400 1250 2    60   ~ 0
A0
Text Label 3400 1350 2    60   ~ 0
A1
Text Label 3400 1450 2    60   ~ 0
A2
Text Label 3400 1550 2    60   ~ 0
A3
Text Label 3400 1650 2    60   ~ 0
A4
Text Label 3400 1750 2    60   ~ 0
A5
Text Label 3400 1850 2    60   ~ 0
A6
Text Label 3400 1950 2    60   ~ 0
A7
Text Label 3400 2050 2    60   ~ 0
A8
Text Label 3400 2150 2    60   ~ 0
A9
Text Label 3400 2250 2    60   ~ 0
A10
Text Label 3400 2350 2    60   ~ 0
A11
Text Label 3400 2550 2    60   ~ 0
A13
Text Label 3400 2650 2    60   ~ 0
A14
Text Label 3400 2750 2    60   ~ 0
A15
Text Label 4500 2550 0    60   ~ 0
A1
Text Label 4500 2450 0    60   ~ 0
A2
Text Label 4500 2350 0    60   ~ 0
A3
Text Label 4500 2250 0    60   ~ 0
A4
Text Label 4500 2150 0    60   ~ 0
A5
Text Label 4500 2050 0    60   ~ 0
A6
Text Label 4500 1950 0    60   ~ 0
A7
Text Label 4500 1550 0    60   ~ 0
A8
Text Label 4500 1450 0    60   ~ 0
A9
Text Label 4500 1250 0    60   ~ 0
A10
Text Label 4500 1350 0    60   ~ 0
A11
Text Label 4500 1850 0    60   ~ 0
A12
Text Label 4500 1650 0    60   ~ 0
A13
Text Label 4300 2950 0    60   ~ 0
~RAMOE
Text Label 9300 1850 0    60   ~ 0
A1
Text Label 9300 1750 0    60   ~ 0
A2
Text Label 9300 1650 0    60   ~ 0
A3
Text Label 9300 1550 0    60   ~ 0
A4
Text Label 9300 1450 0    60   ~ 0
A5
Text Label 9300 1350 0    60   ~ 0
A6
Text Label 9300 1250 0    60   ~ 0
A7
Text Label 10900 1950 2    60   ~ 0
A8
Text Label 10900 1850 2    60   ~ 0
A9
Text Label 10900 1750 2    60   ~ 0
A10
Text Label 10900 1650 2    60   ~ 0
A11
Text Label 10900 1550 2    60   ~ 0
A12
Text Label 10900 1450 2    60   ~ 0
A13
Text Label 10900 1250 2    60   ~ 0
A15
Text Label 9300 750  0    60   ~ 0
D0
Text Label 9300 850  0    60   ~ 0
D1
Text Label 9300 950  0    60   ~ 0
D2
Text Label 9300 1050 0    60   ~ 0
D3
Text Label 10900 1050 2    60   ~ 0
D4
Text Label 10900 950  2    60   ~ 0
D5
Text Label 10900 850  2    60   ~ 0
D6
Text Label 10900 750  2    60   ~ 0
D7
Text Label 6300 1250 2    60   ~ 0
D0
Text Label 6300 1350 2    60   ~ 0
D1
Text Label 6300 1450 2    60   ~ 0
D2
Text Label 6300 1550 2    60   ~ 0
D3
Text Label 6300 1650 2    60   ~ 0
D4
Text Label 6300 1750 2    60   ~ 0
D5
Text Label 6300 1850 2    60   ~ 0
D6
Text Label 6300 1950 2    60   ~ 0
D7
Text Label 3200 3700 2    60   ~ 0
D0
Text Label 3200 3800 2    60   ~ 0
D1
Text Label 3200 3900 2    60   ~ 0
D2
Text Label 3200 4000 2    60   ~ 0
D3
Text Label 3200 4100 2    60   ~ 0
D4
Text Label 3200 4200 2    60   ~ 0
D5
Text Label 3200 4300 2    60   ~ 0
D6
Text Label 3200 4400 2    60   ~ 0
D7
Text Label 1350 3800 0    60   ~ 0
A1
Text Label 1350 3900 0    60   ~ 0
A2
Text Label 1350 4000 0    60   ~ 0
A3
Text Label 1350 4100 0    60   ~ 0
A4
Text Label 1350 4200 0    60   ~ 0
A5
Text Label 1350 4300 0    60   ~ 0
A6
Text Label 1350 4400 0    60   ~ 0
A7
Text Label 1350 4500 0    60   ~ 0
A8
Text Label 1350 4600 0    60   ~ 0
A9
Text Label 1350 4700 0    60   ~ 0
A10
Text Label 1350 4800 0    60   ~ 0
A11
Text Label 1350 4900 0    60   ~ 0
A12
Text Label 1450 1250 0    60   ~ 0
D0
Text Label 1450 1350 0    60   ~ 0
D1
Text Label 1450 1450 0    60   ~ 0
D2
Text Label 1450 1550 0    60   ~ 0
D3
Text Label 1450 1650 0    60   ~ 0
D4
Text Label 1450 1750 0    60   ~ 0
D5
Text Label 1450 1850 0    60   ~ 0
D6
Text Label 1450 1950 0    60   ~ 0
D7
Text Label 3400 2450 2    60   ~ 0
A12
Text Label 10900 1350 2    60   ~ 0
A14
Text Label 1450 2650 0    60   ~ 0
~SO
Text Label 1450 2950 0    60   ~ 0
~NMI
$Comp
L +5V #PWR07
U 1 1 54776FF2
P 850 6850
F 0 "#PWR07" H 850 6940 20  0001 C CNN
F 1 "+5V" H 850 6940 30  0000 C CNN
F 2 "" H 850 6850 60  0000 C CNN
F 3 "" H 850 6850 60  0000 C CNN
	1    850  6850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 54776FF8
P 850 7350
F 0 "#PWR08" H 850 7350 30  0001 C CNN
F 1 "GND" H 850 7280 30  0001 C CNN
F 2 "" H 850 7350 60  0000 C CNN
F 3 "" H 850 7350 60  0000 C CNN
	1    850  7350
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 54777000
P 850 7100
F 0 "C1" H 850 7200 40  0000 L CNN
F 1 "10nF" H 856 7015 40  0000 L CNN
F 2 "~" H 888 6950 30  0000 C CNN
F 3 "~" H 850 7100 60  0000 C CNN
	1    850  7100
	1    0    0    -1  
$EndComp
Text Notes 750  7200 1    60   ~ 0
AT U1\n
$Comp
L +5V #PWR09
U 1 1 54777152
P 1350 6850
F 0 "#PWR09" H 1350 6940 20  0001 C CNN
F 1 "+5V" H 1350 6940 30  0000 C CNN
F 2 "" H 1350 6850 60  0000 C CNN
F 3 "" H 1350 6850 60  0000 C CNN
	1    1350 6850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 54777158
P 1350 7350
F 0 "#PWR010" H 1350 7350 30  0001 C CNN
F 1 "GND" H 1350 7280 30  0001 C CNN
F 2 "" H 1350 7350 60  0000 C CNN
F 3 "" H 1350 7350 60  0000 C CNN
	1    1350 7350
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5477715E
P 1350 7100
F 0 "C2" H 1350 7200 40  0000 L CNN
F 1 "10nF" H 1356 7015 40  0000 L CNN
F 2 "~" H 1388 6950 30  0000 C CNN
F 3 "~" H 1350 7100 60  0000 C CNN
	1    1350 7100
	1    0    0    -1  
$EndComp
Text Notes 1250 7200 1    60   ~ 0
AT U2\n
$Comp
L +5V #PWR011
U 1 1 54777165
P 1850 6850
F 0 "#PWR011" H 1850 6940 20  0001 C CNN
F 1 "+5V" H 1850 6940 30  0000 C CNN
F 2 "" H 1850 6850 60  0000 C CNN
F 3 "" H 1850 6850 60  0000 C CNN
	1    1850 6850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 5477716B
P 1850 7350
F 0 "#PWR012" H 1850 7350 30  0001 C CNN
F 1 "GND" H 1850 7280 30  0001 C CNN
F 2 "" H 1850 7350 60  0000 C CNN
F 3 "" H 1850 7350 60  0000 C CNN
	1    1850 7350
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 54777171
P 1850 7100
F 0 "C3" H 1850 7200 40  0000 L CNN
F 1 "10nF" H 1856 7015 40  0000 L CNN
F 2 "~" H 1888 6950 30  0000 C CNN
F 3 "~" H 1850 7100 60  0000 C CNN
	1    1850 7100
	1    0    0    -1  
$EndComp
Text Notes 1750 7200 1    60   ~ 0
AT U5\n
NoConn ~ 1650 2550
$Comp
L +5V #PWR013
U 1 1 547780EC
P 2700 6850
F 0 "#PWR013" H 2700 6940 20  0001 C CNN
F 1 "+5V" H 2700 6940 30  0000 C CNN
F 2 "" H 2700 6850 60  0000 C CNN
F 3 "" H 2700 6850 60  0000 C CNN
	1    2700 6850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 547780F2
P 2700 7350
F 0 "#PWR014" H 2700 7350 30  0001 C CNN
F 1 "GND" H 2700 7280 30  0001 C CNN
F 2 "" H 2700 7350 60  0000 C CNN
F 3 "" H 2700 7350 60  0000 C CNN
	1    2700 7350
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 547780F8
P 2700 7100
F 0 "C5" H 2700 7200 40  0000 L CNN
F 1 "10nF" H 2706 7015 40  0000 L CNN
F 2 "~" H 2738 6950 30  0000 C CNN
F 3 "~" H 2700 7100 60  0000 C CNN
	1    2700 7100
	1    0    0    -1  
$EndComp
Text Notes 2600 7200 1    60   ~ 0
AT U6\n
Text Label 1200 5300 0    60   ~ 0
~ROMSEL
Text Label 4300 2850 0    60   ~ 0
~RAMCE
Text Label 4500 1750 0    60   ~ 0
A14
Text Label 1200 5400 0    60   ~ 0
~ROMOE
$Comp
L MXO45HS U3
U 1 1 54778FB9
P 4100 4150
F 0 "U3" H 4000 4150 60  0000 C CNN
F 1 "MXO45HS" H 4100 3800 60  0000 C CNN
F 2 "" H 4150 4150 60  0000 C CNN
F 3 "" H 4150 4150 60  0000 C CNN
	1    4100 4150
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR015
U 1 1 54778FC6
P 4100 3950
F 0 "#PWR015" H 4100 4040 20  0001 C CNN
F 1 "+5V" H 4100 4040 30  0000 C CNN
F 2 "" H 4100 3950 60  0000 C CNN
F 3 "" H 4100 3950 60  0000 C CNN
	1    4100 3950
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 54778FCC
P 4100 4350
F 0 "#PWR016" H 4100 4350 30  0001 C CNN
F 1 "GND" H 4100 4280 30  0001 C CNN
F 2 "" H 4100 4350 60  0000 C CNN
F 3 "" H 4100 4350 60  0000 C CNN
	1    4100 4350
	1    0    0    -1  
$EndComp
Text Label 1350 5000 0    60   ~ 0
A13
$Comp
L AT28C256 U2
U 1 1 54779A61
P 2300 4500
F 0 "U2" H 2300 4450 60  0000 C CNN
F 1 "AT28C256" V 2300 5250 60  0000 R CNN
F 2 "~" H 2300 3650 60  0000 C CNN
F 3 "~" H 2300 3650 60  0000 C CNN
	1    2300 4500
	1    0    0    -1  
$EndComp
Text Label 1350 5100 0    60   ~ 0
GND
Text GLabel 4700 4150 2    60   Output ~ 0
PHI2
NoConn ~ 2950 3050
NoConn ~ 2950 2950
Text Notes 1950 950  0    60   ~ 0
Processor
Text Notes 5050 950  0    60   ~ 0
RAM
Text Notes 1950 3400 0    60   ~ 0
EEPROM
Text Notes 3900 3750 0    60   ~ 0
Clock generation
Text GLabel 1350 2850 0    60   Output ~ 0
R/~W
$Comp
L +5V #PWR017
U 1 1 54D11A96
P 9200 5850
F 0 "#PWR017" H 9200 5940 20  0001 C CNN
F 1 "+5V" H 9200 5940 30  0000 C CNN
F 2 "" H 9200 5850 60  0000 C CNN
F 3 "" H 9200 5850 60  0000 C CNN
	1    9200 5850
	1    0    0    -1  
$EndComp
Text Label 10050 5700 2    60   ~ 0
~ROMWE
Text Label 8600 900  2    60   ~ 0
VCC
Text Label 8600 1300 2    60   ~ 0
GND
$Comp
L CP1 C7
U 1 1 54D137B9
P 8200 1100
F 0 "C7" H 8250 1200 50  0000 L CNN
F 1 "100uF" H 8250 1000 50  0000 L CNN
F 2 "~" H 8200 1100 60  0000 C CNN
F 3 "~" H 8200 1100 60  0000 C CNN
	1    8200 1100
	-1   0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 54D138B4
P 7650 1100
F 0 "C6" H 7650 1200 40  0000 L CNN
F 1 "100nF" H 7656 1015 40  0000 L CNN
F 2 "~" H 7688 950 30  0000 C CNN
F 3 "~" H 7650 1100 60  0000 C CNN
	1    7650 1100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR018
U 1 1 54D141B9
P 2300 6850
F 0 "#PWR018" H 2300 6940 20  0001 C CNN
F 1 "+5V" H 2300 6940 30  0000 C CNN
F 2 "" H 2300 6850 60  0000 C CNN
F 3 "" H 2300 6850 60  0000 C CNN
	1    2300 6850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 54D141BF
P 2300 7350
F 0 "#PWR019" H 2300 7350 30  0001 C CNN
F 1 "GND" H 2300 7280 30  0001 C CNN
F 2 "" H 2300 7350 60  0000 C CNN
F 3 "" H 2300 7350 60  0000 C CNN
	1    2300 7350
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 54D141C5
P 2300 7100
F 0 "C4" H 2300 7200 40  0000 L CNN
F 1 "10nF" H 2306 7015 40  0000 L CNN
F 2 "~" H 2338 6950 30  0000 C CNN
F 3 "~" H 2300 7100 60  0000 C CNN
	1    2300 7100
	1    0    0    -1  
$EndComp
Text Notes 2200 7200 1    60   ~ 0
AT U3\n
$Comp
L GND #PWR020
U 1 1 54D14601
P 7450 1400
F 0 "#PWR020" H 7450 1400 30  0001 C CNN
F 1 "GND" H 7450 1330 30  0001 C CNN
F 2 "" H 7450 1400 60  0000 C CNN
F 3 "" H 7450 1400 60  0000 C CNN
	1    7450 1400
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR021
U 1 1 54D14607
P 7450 800
F 0 "#PWR021" H 7450 890 20  0001 C CNN
F 1 "+5V" H 7450 890 30  0000 C CNN
F 2 "" H 7450 800 60  0000 C CNN
F 3 "" H 7450 800 60  0000 C CNN
	1    7450 800 
	1    0    0    -1  
$EndComp
Text GLabel 3500 2850 2    60   Input ~ 0
PHI2
Text GLabel 4550 3050 0    60   Input ~ 0
R/~W
Text Label 8600 2650 2    60   ~ 0
RDY
Text Label 1200 5500 0    60   ~ 0
~ROMWE
Text Notes 7650 700  0    60   ~ 0
AT P3
Text GLabel 7900 2650 0    60   Input ~ 0
RDY
$Comp
L +5V #PWR022
U 1 1 54D17F48
P 8600 2350
F 0 "#PWR022" H 8600 2440 20  0001 C CNN
F 1 "+5V" H 8600 2440 30  0000 C CNN
F 2 "" H 8600 2350 60  0000 C CNN
F 3 "" H 8600 2350 60  0000 C CNN
	1    8600 2350
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 54D17F6D
P 7200 1900
F 0 "R1" V 7280 1900 40  0000 C CNN
F 1 "3.3K" V 7207 1901 40  0000 C CNN
F 2 "~" V 7130 1900 30  0000 C CNN
F 3 "~" H 7200 1900 30  0000 C CNN
	1    7200 1900
	0    1    1    0   
$EndComp
Text Label 7500 2100 2    60   ~ 0
~RST
Text GLabel 6800 2100 0    60   Input ~ 0
~RST
$Comp
L +5V #PWR023
U 1 1 54D17F7C
P 7500 1800
F 0 "#PWR023" H 7500 1890 20  0001 C CNN
F 1 "+5V" H 7500 1890 30  0000 C CNN
F 2 "" H 7500 1800 60  0000 C CNN
F 3 "" H 7500 1800 60  0000 C CNN
	1    7500 1800
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 54D17FC6
P 7200 2450
F 0 "R2" V 7280 2450 40  0000 C CNN
F 1 "3.3K" V 7207 2451 40  0000 C CNN
F 2 "~" V 7130 2450 30  0000 C CNN
F 3 "~" H 7200 2450 30  0000 C CNN
	1    7200 2450
	0    1    1    0   
$EndComp
Text Label 7500 2650 2    60   ~ 0
~IRQ
Text GLabel 6800 2650 0    60   Input ~ 0
~IRQ
$Comp
L +5V #PWR024
U 1 1 54D17FD5
P 7500 2350
F 0 "#PWR024" H 7500 2440 20  0001 C CNN
F 1 "+5V" H 7500 2440 30  0000 C CNN
F 2 "" H 7500 2350 60  0000 C CNN
F 3 "" H 7500 2350 60  0000 C CNN
	1    7500 2350
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 54D18092
P 8300 1900
F 0 "R3" V 8380 1900 40  0000 C CNN
F 1 "3.3K" V 8307 1901 40  0000 C CNN
F 2 "~" V 8230 1900 30  0000 C CNN
F 3 "~" H 8300 1900 30  0000 C CNN
	1    8300 1900
	0    1    1    0   
$EndComp
Text Label 8600 2100 2    60   ~ 0
BE
Text GLabel 7900 2100 0    60   Input ~ 0
BE
$Comp
L +5V #PWR025
U 1 1 54D180A1
P 8600 1800
F 0 "#PWR025" H 8600 1890 20  0001 C CNN
F 1 "+5V" H 8600 1890 30  0000 C CNN
F 2 "" H 8600 1800 60  0000 C CNN
F 3 "" H 8600 1800 60  0000 C CNN
	1    8600 1800
	1    0    0    -1  
$EndComp
Text GLabel 1350 2050 0    60   Output ~ 0
SYNC
Text GLabel 9300 2900 0    60   Input ~ 0
SYNC
Text GLabel 10600 3300 2    60   Input ~ 0
R/~W
Text GLabel 9600 2800 0    60   Input ~ 0
PHI2
Text Label 1000 850  2    60   ~ 0
~SO
Text Label 1000 1050 2    60   ~ 0
~NMI
$Comp
L +5V #PWR026
U 1 1 54D199C0
P 700 750
F 0 "#PWR026" H 700 840 20  0001 C CNN
F 1 "+5V" H 700 840 30  0000 C CNN
F 2 "" H 700 750 60  0000 C CNN
F 3 "" H 700 750 60  0000 C CNN
	1    700  750 
	1    0    0    -1  
$EndComp
Text Label 1450 2250 0    60   ~ 0
RDY
Text Label 1450 2450 0    60   ~ 0
BE
Text Label 1450 2750 0    60   ~ 0
~IRQ
Text Label 1450 3050 0    60   ~ 0
~RST
Text GLabel 9600 3000 0    60   Input ~ 0
~RST
Text GLabel 10800 3100 2    60   Output ~ 0
~IRQ
Text GLabel 10600 2800 2    60   Output ~ 0
RDY
Text GLabel 10600 3000 2    60   Output ~ 0
BE
$Sheet
S 9950 5000 600  300 
U 54D63A81
F0 "Reset" 50
F1 "reset.sch" 50
F2 "RESET" O L 9950 5150 60 
$EndSheet
$Comp
L CONN_13X2 P1
U 1 1 54D63EF4
P 10100 1350
F 0 "P1" H 10100 2050 60  0000 C CNN
F 1 "BUS" V 10100 1350 50  0000 C CNN
F 2 "" H 10100 1350 60  0000 C CNN
F 3 "" H 10100 1350 60  0000 C CNN
	1    10100 1350
	1    0    0    -1  
$EndComp
NoConn ~ 10500 1150
NoConn ~ 9700 1150
$Comp
L RASPBERRY_IO P2
U 1 1 54D64276
P 10100 2900
F 0 "P2" H 10100 3600 60  0000 C CNN
F 1 "CTRL (RPi)" V 10100 2900 50  0000 C CNN
F 2 "" H 10100 2900 60  0000 C CNN
F 3 "" H 10100 2900 60  0000 C CNN
	1    10100 2900
	1    0    0    -1  
$EndComp
NoConn ~ 9700 2300
Text Label 10900 2500 2    60   ~ 0
GND
Text Label 10900 2300 2    60   ~ 0
VCC
NoConn ~ 10500 2600
NoConn ~ 10500 2700
NoConn ~ 9700 2400
NoConn ~ 9700 2500
NoConn ~ 9700 3200
NoConn ~ 9700 3300
NoConn ~ 9700 3400
NoConn ~ 10500 3500
NoConn ~ 10500 3400
Text GLabel 9900 5850 2    60   Input ~ 0
R/~W
NoConn ~ 9700 2600
$Comp
L JUMPER3 JP1
U 1 1 54DFDF35
P 9550 5850
F 0 "JP1" H 9600 5750 40  0000 L CNN
F 1 "ROM PROGRAMMABLE" H 9550 5950 40  0000 C CNN
F 2 "" H 9550 5850 60  0000 C CNN
F 3 "" H 9550 5850 60  0000 C CNN
	1    9550 5850
	-1   0    0    1   
$EndComp
Wire Wire Line
	3400 2750 2950 2750
Wire Wire Line
	2950 2650 3400 2650
Wire Wire Line
	3400 2550 2950 2550
Wire Wire Line
	2950 2450 3400 2450
Wire Wire Line
	3400 2350 2950 2350
Wire Wire Line
	2950 2250 3400 2250
Wire Wire Line
	3400 2150 2950 2150
Wire Wire Line
	2950 2050 3400 2050
Wire Wire Line
	3400 1950 2950 1950
Wire Wire Line
	2950 1850 3400 1850
Wire Wire Line
	3400 1750 2950 1750
Wire Wire Line
	3400 1650 2950 1650
Wire Wire Line
	2950 1550 3400 1550
Wire Wire Line
	3400 1450 2950 1450
Wire Wire Line
	2950 1350 3400 1350
Wire Wire Line
	3400 1250 2950 1250
Wire Wire Line
	4500 1250 4750 1250
Wire Wire Line
	4750 1350 4500 1350
Wire Wire Line
	4500 1450 4750 1450
Wire Wire Line
	4750 1550 4500 1550
Wire Wire Line
	4500 1650 4750 1650
Wire Wire Line
	4750 1750 4500 1750
Wire Wire Line
	4500 1850 4750 1850
Wire Wire Line
	4750 1950 4500 1950
Wire Wire Line
	4500 2050 4750 2050
Wire Wire Line
	4750 2150 4500 2150
Wire Wire Line
	4500 2250 4750 2250
Wire Wire Line
	4750 2350 4500 2350
Wire Wire Line
	4500 2450 4750 2450
Wire Wire Line
	4750 2550 4500 2550
Wire Wire Line
	4300 2950 4750 2950
Wire Wire Line
	1350 3700 1650 3700
Wire Wire Line
	1650 3800 1350 3800
Wire Wire Line
	1350 3900 1650 3900
Wire Wire Line
	1650 4000 1350 4000
Wire Wire Line
	1350 4100 1650 4100
Wire Wire Line
	1650 4200 1350 4200
Wire Wire Line
	1350 4300 1650 4300
Wire Wire Line
	1650 4400 1350 4400
Wire Wire Line
	1350 4500 1650 4500
Wire Wire Line
	1650 4600 1350 4600
Wire Wire Line
	1350 4700 1650 4700
Wire Wire Line
	1650 4800 1350 4800
Wire Wire Line
	1350 4900 1650 4900
Wire Wire Line
	2950 3700 3200 3700
Wire Wire Line
	3200 3800 2950 3800
Wire Wire Line
	2950 3900 3200 3900
Wire Wire Line
	3200 4000 2950 4000
Wire Wire Line
	2950 4100 3200 4100
Wire Wire Line
	3200 4200 2950 4200
Wire Wire Line
	2950 4300 3200 4300
Wire Wire Line
	3200 4400 2950 4400
Wire Wire Line
	6050 1250 6300 1250
Wire Wire Line
	6300 1350 6050 1350
Wire Wire Line
	6050 1450 6300 1450
Wire Wire Line
	6300 1550 6050 1550
Wire Wire Line
	6050 1650 6300 1650
Wire Wire Line
	6300 1750 6050 1750
Wire Wire Line
	6050 1850 6300 1850
Wire Wire Line
	6300 1950 6050 1950
Wire Wire Line
	1650 1250 1450 1250
Wire Wire Line
	1450 1350 1650 1350
Wire Wire Line
	1650 1450 1450 1450
Wire Wire Line
	1450 1550 1650 1550
Wire Wire Line
	1650 1650 1450 1650
Wire Wire Line
	1450 1750 1650 1750
Wire Wire Line
	1650 1850 1450 1850
Wire Wire Line
	1450 1950 1650 1950
Wire Wire Line
	5400 3100 5400 3200
Wire Wire Line
	5400 1150 5400 1200
Wire Wire Line
	2300 3600 2300 3650
Wire Wire Line
	2300 3100 2300 3200
Wire Wire Line
	9700 750  9300 750 
Wire Wire Line
	9300 850  9700 850 
Wire Wire Line
	9700 950  9300 950 
Wire Wire Line
	9300 1050 9700 1050
Wire Wire Line
	10500 1050 10900 1050
Wire Wire Line
	10900 950  10500 950 
Wire Wire Line
	10500 850  10900 850 
Wire Wire Line
	10900 750  10500 750 
Wire Wire Line
	2300 1150 2300 1200
Wire Wire Line
	9300 1950 9700 1950
Wire Wire Line
	9700 1850 9300 1850
Wire Wire Line
	9300 1750 9700 1750
Wire Wire Line
	9700 1650 9300 1650
Wire Wire Line
	9300 1550 9700 1550
Wire Wire Line
	9700 1450 9300 1450
Wire Wire Line
	9300 1350 9700 1350
Wire Wire Line
	9700 1250 9300 1250
Wire Wire Line
	10500 1850 10900 1850
Wire Wire Line
	10900 1450 10500 1450
Wire Wire Line
	10500 1950 10900 1950
Wire Wire Line
	10900 1550 10500 1550
Wire Wire Line
	4750 3050 4550 3050
Wire Wire Line
	1850 6850 1850 6900
Wire Wire Line
	1850 7300 1850 7350
Wire Wire Line
	1350 7300 1350 7350
Wire Wire Line
	1350 6850 1350 6900
Wire Wire Line
	850  6850 850  6900
Wire Wire Line
	850  7300 850  7350
Wire Wire Line
	2700 6850 2700 6900
Wire Wire Line
	2700 7300 2700 7350
Wire Wire Line
	1650 5300 1200 5300
Wire Wire Line
	1200 5500 1650 5500
Wire Wire Line
	4750 2650 4500 2650
Wire Wire Line
	1200 5400 1650 5400
Wire Wire Line
	4100 3950 4100 4000
Wire Wire Line
	4100 4300 4100 4350
Wire Wire Line
	1650 5000 1350 5000
Wire Wire Line
	2300 5550 2300 5650
Wire Wire Line
	4750 2850 4300 2850
Wire Wire Line
	10900 1750 10500 1750
Wire Wire Line
	10500 1650 10900 1650
Wire Wire Line
	10900 1350 10500 1350
Wire Wire Line
	10500 1250 10900 1250
Wire Wire Line
	4700 4150 4600 4150
Wire Wire Line
	1650 5100 1350 5100
Wire Wire Line
	1650 2050 1350 2050
Wire Wire Line
	2950 2850 3500 2850
Wire Wire Line
	1350 2850 1650 2850
Wire Wire Line
	9700 3000 9600 3000
Wire Wire Line
	10500 2800 10600 2800
Wire Wire Line
	7450 900  8600 900 
Wire Wire Line
	7450 1300 8600 1300
Connection ~ 8200 900 
Connection ~ 8200 1300
Wire Wire Line
	2300 6850 2300 6900
Wire Wire Line
	2300 7300 2300 7350
Wire Wire Line
	7450 1300 7450 1400
Connection ~ 7650 1300
Wire Wire Line
	7450 900  7450 800 
Connection ~ 7650 900 
Wire Wire Line
	7900 2650 8600 2650
Wire Wire Line
	9200 5850 9300 5850
Wire Wire Line
	1650 2450 1450 2450
Wire Wire Line
	8050 2450 8000 2450
Wire Wire Line
	8000 2450 8000 2650
Connection ~ 8000 2650
Wire Wire Line
	8550 2450 8600 2450
Wire Wire Line
	8600 2450 8600 2350
Wire Wire Line
	6800 2100 7500 2100
Wire Wire Line
	6950 1900 6900 1900
Wire Wire Line
	6900 1900 6900 2100
Connection ~ 6900 2100
Wire Wire Line
	7450 1900 7500 1900
Wire Wire Line
	7500 1900 7500 1800
Wire Wire Line
	6800 2650 7500 2650
Wire Wire Line
	6950 2450 6900 2450
Wire Wire Line
	6900 2450 6900 2650
Connection ~ 6900 2650
Wire Wire Line
	7450 2450 7500 2450
Wire Wire Line
	7500 2450 7500 2350
Wire Wire Line
	7900 2100 8600 2100
Wire Wire Line
	8050 1900 8000 1900
Wire Wire Line
	8000 1900 8000 2100
Connection ~ 8000 2100
Wire Wire Line
	8550 1900 8600 1900
Wire Wire Line
	8600 1900 8600 1800
Wire Wire Line
	1650 3050 1450 3050
Wire Wire Line
	1650 2950 1450 2950
Wire Wire Line
	1450 2650 1650 2650
Wire Wire Line
	1450 2250 1650 2250
Wire Wire Line
	1450 2750 1650 2750
Wire Wire Line
	700  750  700  1050
Wire Wire Line
	700  1050 1000 1050
Wire Wire Line
	700  850  1000 850 
Connection ~ 700  850 
Wire Wire Line
	9600 2800 9700 2800
Wire Wire Line
	9300 2900 9700 2900
Wire Wire Line
	10900 2300 10500 2300
Wire Wire Line
	10500 2500 10900 2500
Wire Wire Line
	10500 3000 10600 3000
Wire Wire Line
	10600 3300 10500 3300
Wire Wire Line
	10500 3100 10800 3100
Wire Wire Line
	9800 5850 9900 5850
Text GLabel 9750 5150 0    60   Output ~ 0
~RST
Wire Wire Line
	9950 5150 9750 5150
Text Label 8900 3350 2    60   ~ 0
A0
Text Label 8900 3450 2    60   ~ 0
A1
Text Label 8900 3550 2    60   ~ 0
A2
Text Label 8900 3650 2    60   ~ 0
A3
Text Label 8900 3750 2    60   ~ 0
A4
Text Label 8900 3850 2    60   ~ 0
A5
Text Label 8900 3950 2    60   ~ 0
A6
Text Label 8900 4050 2    60   ~ 0
A7
Text Label 8900 4150 2    60   ~ 0
A8
Text Label 8900 4250 2    60   ~ 0
A9
Text Label 8900 4350 2    60   ~ 0
A10
Text Label 8900 4450 2    60   ~ 0
A11
Text Label 8900 4650 2    60   ~ 0
A13
Text Label 8900 4750 2    60   ~ 0
A14
Text Label 8900 4850 2    60   ~ 0
A15
Text Label 8900 4550 2    60   ~ 0
A12
Wire Wire Line
	8900 4850 8600 4850
Wire Wire Line
	8350 4750 8900 4750
Wire Wire Line
	8900 4650 8600 4650
Wire Wire Line
	8350 4550 8900 4550
Wire Wire Line
	8900 4450 8600 4450
Wire Wire Line
	8350 4350 8900 4350
Wire Wire Line
	8900 4250 8600 4250
Wire Wire Line
	8350 4150 8900 4150
Wire Wire Line
	8900 4050 8600 4050
Wire Wire Line
	8350 3950 8900 3950
Wire Wire Line
	8900 3850 8600 3850
Wire Wire Line
	8900 3750 8350 3750
Wire Wire Line
	8600 3650 8900 3650
Wire Wire Line
	8900 3550 8350 3550
Wire Wire Line
	8600 3450 8900 3450
Wire Wire Line
	8900 3350 8350 3350
Text GLabel 8350 3350 0    60   BiDi ~ 0
A0
Text GLabel 8600 3450 0    60   BiDi ~ 0
A1
Text GLabel 8350 3550 0    60   BiDi ~ 0
A2
Text GLabel 8600 3650 0    60   BiDi ~ 0
A3
Text GLabel 8350 3750 0    60   BiDi ~ 0
A4
Text GLabel 8600 3850 0    60   BiDi ~ 0
A5
Text GLabel 8350 3950 0    60   BiDi ~ 0
A6
Text GLabel 8600 4050 0    60   BiDi ~ 0
A7
Text GLabel 8350 4150 0    60   BiDi ~ 0
A8
Text GLabel 8600 4250 0    60   BiDi ~ 0
A9
Text GLabel 8350 4350 0    60   BiDi ~ 0
A10
Text GLabel 8600 4450 0    60   BiDi ~ 0
A11
Text GLabel 8350 4550 0    60   BiDi ~ 0
A12
Text GLabel 8600 4650 0    60   BiDi ~ 0
A13
Text GLabel 8350 4750 0    60   BiDi ~ 0
A14
Text GLabel 8600 4850 0    60   BiDi ~ 0
A15
$Sheet
S 4550 6400 1050 1000
U 54E60914
F0 "Address Decode" 50
F1 "addr-decode.sch" 50
F2 "~IO0" O R 5600 6550 60 
F3 "~IO1" O R 5600 6650 60 
F4 "~IO2" O R 5600 6750 60 
F5 "~IO3" O R 5600 6850 60 
F6 "~IO4" O R 5600 6950 60 
F7 "~IO5" O R 5600 7050 60 
F8 "~IO6" O R 5600 7150 60 
F9 "~IO7" O R 5600 7250 60 
F10 "~ROMSEL" O L 4550 6550 60 
F11 "~RAMSEL" O L 4550 6750 60 
$EndSheet
Text Label 3950 6750 0    60   ~ 0
~RAMSEL
Wire Wire Line
	3950 6750 4550 6750
Text Label 3950 6550 0    60   ~ 0
~ROMSEL
Wire Wire Line
	3950 6550 4550 6550
$Comp
L 74LS132 U6
U 2 1 54E639E9
P 5150 5500
F 0 "U6" H 5150 5600 60  0000 C CNN
F 1 "74HC132" H 5150 5400 60  0000 C CNN
F 2 "" H 5150 5500 60  0000 C CNN
F 3 "" H 5150 5500 60  0000 C CNN
	2    5150 5500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR027
U 1 1 54E63A7F
P 4950 5150
F 0 "#PWR027" H 4950 5240 20  0001 C CNN
F 1 "+5V" H 4950 5240 30  0000 C CNN
F 2 "" H 4950 5150 60  0000 C CNN
F 3 "" H 4950 5150 60  0000 C CNN
	1    4950 5150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4950 5150 4950 5300
$Comp
L GND #PWR028
U 1 1 54E63B0A
P 4950 5750
F 0 "#PWR028" H 4950 5750 30  0001 C CNN
F 1 "GND" H 4950 5680 30  0001 C CNN
F 2 "" H 4950 5750 60  0000 C CNN
F 3 "" H 4950 5750 60  0000 C CNN
	1    4950 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 5700 4950 5750
Text Label 3950 5600 0    60   ~ 0
~RAMSEL
Wire Wire Line
	3950 5600 4550 5600
Wire Wire Line
	4950 5200 4450 5200
Wire Wire Line
	4450 5200 4450 5400
Wire Wire Line
	4450 5400 4550 5400
Connection ~ 4950 5200
$Comp
L 74LS132 U6
U 3 1 54E63D3E
P 6550 5600
F 0 "U6" H 6550 5700 60  0000 C CNN
F 1 "74HC132" H 6550 5500 60  0000 C CNN
F 2 "" H 6550 5600 60  0000 C CNN
F 3 "" H 6550 5600 60  0000 C CNN
	3    6550 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 5500 5950 5500
Text GLabel 5750 5700 0    60   Input ~ 0
PHI2
Wire Wire Line
	5750 5700 5950 5700
Text Label 7750 5600 2    60   ~ 0
~RAMCE
Wire Wire Line
	7750 5600 7150 5600
Text Label 9350 6250 0    60   ~ 0
~ROMOE
Wire Wire Line
	9350 6250 10200 6250
Text Label 10200 6250 2    60   ~ 0
~ROMSEL
Wire Wire Line
	10050 5700 9550 5700
Wire Wire Line
	9550 5700 9550 5750
Text Notes 9350 6400 0    60   ~ 0
Take ~ROMOE~ high to program
Text Label 7750 5300 2    60   ~ 0
~RAMOE
Wire Wire Line
	7750 5300 7150 5300
Wire Wire Line
	7150 5300 7150 5250
$Comp
L +5V #PWR029
U 1 1 54E69967
P 7150 5250
F 0 "#PWR029" H 7150 5340 20  0001 C CNN
F 1 "+5V" H 7150 5340 30  0000 C CNN
F 2 "" H 7150 5250 60  0000 C CNN
F 3 "" H 7150 5250 60  0000 C CNN
	1    7150 5250
	-1   0    0    -1  
$EndComp
$Comp
L +5V #PWR030
U 1 1 54E69993
P 6350 5300
F 0 "#PWR030" H 6350 5390 20  0001 C CNN
F 1 "+5V" H 6350 5390 30  0000 C CNN
F 2 "" H 6350 5300 60  0000 C CNN
F 3 "" H 6350 5300 60  0000 C CNN
	1    6350 5300
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR031
U 1 1 54E699BF
P 6350 5900
F 0 "#PWR031" H 6350 5900 30  0001 C CNN
F 1 "GND" H 6350 5830 30  0001 C CNN
F 2 "" H 6350 5900 60  0000 C CNN
F 3 "" H 6350 5900 60  0000 C CNN
	1    6350 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 5800 6350 5900
Wire Wire Line
	6350 5300 6350 5400
Wire Wire Line
	10400 4300 9900 4300
Wire Wire Line
	10400 4500 9900 4500
Wire Wire Line
	9900 4500 9900 4600
Wire Wire Line
	9900 4300 9900 4200
Text Label 10000 4500 0    60   ~ 0
GND
Text Label 10000 4300 0    60   ~ 0
VCC
$Comp
L CONN_2 P3
U 1 1 54D1B354
P 10750 4400
F 0 "P3" V 10700 4400 40  0000 C CNN
F 1 "PWR" V 10800 4400 40  0000 C CNN
F 2 "" H 10750 4400 60  0000 C CNN
F 3 "" H 10750 4400 60  0000 C CNN
	1    10750 4400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR032
U 1 1 54D1B644
P 9900 4600
F 0 "#PWR032" H 9900 4600 30  0001 C CNN
F 1 "GND" H 9900 4530 30  0001 C CNN
F 2 "" H 9900 4600 60  0000 C CNN
F 3 "" H 9900 4600 60  0000 C CNN
	1    9900 4600
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR033
U 1 1 54D1B984
P 9900 4200
F 0 "#PWR033" H 9900 4290 20  0001 C CNN
F 1 "+5V" H 9900 4290 30  0000 C CNN
F 2 "" H 9900 4200 60  0000 C CNN
F 3 "" H 9900 4200 60  0000 C CNN
	1    9900 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 6550 5750 6550
Wire Wire Line
	5600 6650 5750 6650
Wire Wire Line
	5600 6750 5750 6750
Wire Wire Line
	5600 6850 5750 6850
Wire Wire Line
	5600 6950 5750 6950
Wire Wire Line
	5600 7050 5750 7050
Wire Wire Line
	5600 7150 5750 7150
Wire Wire Line
	5600 7250 5750 7250
NoConn ~ 5750 7250
NoConn ~ 5750 7150
NoConn ~ 5750 7050
NoConn ~ 5750 6950
NoConn ~ 5750 6850
NoConn ~ 5750 6750
NoConn ~ 5750 6650
NoConn ~ 5750 6550
$EndSCHEMATC
