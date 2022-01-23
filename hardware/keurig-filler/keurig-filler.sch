EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L github-RP-Pico:Pico U1
U 1 1 61E36563
P 4610 2940
F 0 "U1" H 4610 4155 50  0000 C CNN
F 1 "Pico" H 4610 4064 50  0000 C CNN
F 2 "github-RP-Pico:RPi_Pico_SMD_TH" V 4610 2940 50  0001 C CNN
F 3 "" H 4610 2940 50  0001 C CNN
	1    4610 2940
	1    0    0    -1  
$EndComp
$Comp
L KF0602D:KF0602D K1
U 1 1 61E36BE9
P 8440 4430
F 0 "K1" H 8440 4797 50  0000 C CNN
F 1 "KF0602D" H 8440 4706 50  0000 C CNN
F 2 "SnapEDA Library:RELAY_KF0602D" H 8440 4430 50  0001 L BNN
F 3 "" H 8440 4430 50  0001 L BNN
F 4 "26.0mm" H 8440 4430 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 5 "N/A" H 8440 4430 50  0001 L BNN "PARTREV"
F 6 "Kyotto" H 8440 4430 50  0001 L BNN "MANUFACTURER"
F 7 "Manufacturer Recommendations" H 8440 4430 50  0001 L BNN "STANDARD"
	1    8440 4430
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J5
U 1 1 61E3B520
P 8190 5200
F 0 "J5" H 8218 5176 50  0000 L CNN
F 1 "Voltage Regulator Board" H 8218 5085 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 8190 5200 50  0001 C CNN
F 3 "~" H 8190 5200 50  0001 C CNN
	1    8190 5200
	-1   0    0    -1  
$EndComp
$Comp
L power:+12V #PWR09
U 1 1 61E400F4
P 9350 4100
F 0 "#PWR09" H 9350 3950 50  0001 C CNN
F 1 "+12V" H 9365 4273 50  0000 C CNN
F 2 "" H 9350 4100 50  0001 C CNN
F 3 "" H 9350 4100 50  0001 C CNN
	1    9350 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J6
U 1 1 61E39606
P 9740 5300
F 0 "J6" H 9820 5292 50  0000 L CNN
F 1 "To Power Adapter Jack" H 9820 5201 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-2_P5.00mm" H 9740 5300 50  0001 C CNN
F 3 "~" H 9740 5300 50  0001 C CNN
	1    9740 5300
	1    0    0    -1  
$EndComp
Connection ~ 9350 5300
Wire Wire Line
	9350 5300 9540 5300
Wire Wire Line
	8390 5300 9350 5300
$Comp
L power:+5V #PWR013
U 1 1 61E4A2AC
P 9250 4770
F 0 "#PWR013" H 9250 4620 50  0001 C CNN
F 1 "+5V" H 9265 4943 50  0000 C CNN
F 2 "" H 9250 4770 50  0001 C CNN
F 3 "" H 9250 4770 50  0001 C CNN
	1    9250 4770
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 61E4AD2C
P 8530 5510
F 0 "#PWR015" H 8530 5260 50  0001 C CNN
F 1 "GND" H 8535 5337 50  0000 C CNN
F 2 "" H 8530 5510 50  0001 C CNN
F 3 "" H 8530 5510 50  0001 C CNN
	1    8530 5510
	1    0    0    -1  
$EndComp
Wire Wire Line
	8530 5510 8530 5200
Wire Wire Line
	8530 5200 8390 5200
NoConn ~ 8390 5400
$Comp
L power:GND #PWR014
U 1 1 61E4B5B1
P 9410 5490
F 0 "#PWR014" H 9410 5240 50  0001 C CNN
F 1 "GND" H 9415 5317 50  0000 C CNN
F 2 "" H 9410 5490 50  0001 C CNN
F 3 "" H 9410 5490 50  0001 C CNN
	1    9410 5490
	1    0    0    -1  
$EndComp
Wire Wire Line
	9410 5490 9410 5400
Wire Wire Line
	9410 5400 9540 5400
$Comp
L power:GND #PWR012
U 1 1 61E4D338
P 9570 4740
F 0 "#PWR012" H 9570 4490 50  0001 C CNN
F 1 "GND" H 9575 4567 50  0000 C CNN
F 2 "" H 9570 4740 50  0001 C CNN
F 3 "" H 9570 4740 50  0001 C CNN
	1    9570 4740
	1    0    0    -1  
$EndComp
Wire Wire Line
	9570 4740 9570 4630
Wire Wire Line
	9570 4630 9630 4630
Wire Wire Line
	9350 4100 9350 4330
Wire Wire Line
	9040 4330 9350 4330
Connection ~ 9350 4330
Wire Wire Line
	9350 4330 9350 5300
Wire Wire Line
	9040 4530 9630 4530
$Comp
L power:GND #PWR011
U 1 1 61E51501
P 7740 4640
F 0 "#PWR011" H 7740 4390 50  0001 C CNN
F 1 "GND" H 7745 4467 50  0000 C CNN
F 2 "" H 7740 4640 50  0001 C CNN
F 3 "" H 7740 4640 50  0001 C CNN
	1    7740 4640
	1    0    0    -1  
$EndComp
Wire Wire Line
	7740 4640 7740 4530
Wire Wire Line
	7740 4530 7840 4530
$Comp
L power:GND #PWR08
U 1 1 61E51B1A
P 5440 4030
F 0 "#PWR08" H 5440 3780 50  0001 C CNN
F 1 "GND" H 5445 3857 50  0000 C CNN
F 2 "" H 5440 4030 50  0001 C CNN
F 3 "" H 5440 4030 50  0001 C CNN
	1    5440 4030
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 61E51D50
P 3760 4020
F 0 "#PWR07" H 3760 3770 50  0001 C CNN
F 1 "GND" H 3765 3847 50  0000 C CNN
F 2 "" H 3760 4020 50  0001 C CNN
F 3 "" H 3760 4020 50  0001 C CNN
	1    3760 4020
	1    0    0    -1  
$EndComp
Wire Wire Line
	3760 4020 3760 3690
Wire Wire Line
	3760 3690 3910 3690
Wire Wire Line
	3760 3690 3760 3190
Wire Wire Line
	3760 3190 3910 3190
Connection ~ 3760 3690
Wire Wire Line
	3760 3190 3760 2690
Wire Wire Line
	3760 2690 3910 2690
Connection ~ 3760 3190
Wire Wire Line
	3760 2690 3760 2190
Wire Wire Line
	3760 2190 3910 2190
Connection ~ 3760 2690
Wire Wire Line
	5440 4030 5440 3690
Wire Wire Line
	5310 3690 5440 3690
Wire Wire Line
	5440 3690 5440 3190
Wire Wire Line
	5440 3190 5310 3190
Connection ~ 5440 3690
Wire Wire Line
	5440 3190 5440 2690
Wire Wire Line
	5440 2190 5310 2190
Connection ~ 5440 3190
$Comp
L power:GND #PWR010
U 1 1 61E59153
P 4610 4260
F 0 "#PWR010" H 4610 4010 50  0001 C CNN
F 1 "GND" H 4615 4087 50  0000 C CNN
F 2 "" H 4610 4260 50  0001 C CNN
F 3 "" H 4610 4260 50  0001 C CNN
	1    4610 4260
	1    0    0    -1  
$EndComp
Wire Wire Line
	4610 4260 4610 4090
Text GLabel 5810 3890 2    50   Input ~ 0
MISO0
Wire Wire Line
	5310 3890 5810 3890
Text GLabel 5830 3790 2    50   Output ~ 0
SPI_CS0
Wire Wire Line
	5830 3790 5310 3790
Text GLabel 5840 3590 2    50   Output ~ 0
SCK0
Wire Wire Line
	5840 3590 5310 3590
Text GLabel 5840 3490 2    50   Output ~ 0
MOSI0
Wire Wire Line
	5840 3490 5310 3490
Text GLabel 3530 2790 0    50   3State ~ 0
SDA0
Text GLabel 3520 2890 0    50   3State ~ 0
SCL0
Wire Wire Line
	5310 3390 5840 3390
Text GLabel 5830 2890 2    50   Input ~ 0
ADC0
Text GLabel 5830 2790 2    50   Input ~ 0
ADC1
Wire Wire Line
	5830 2790 5310 2790
Wire Wire Line
	5830 2890 5310 2890
$Comp
L power:+5V #PWR02
U 1 1 61E6E237
P 5420 1850
F 0 "#PWR02" H 5420 1700 50  0001 C CNN
F 1 "+5V" H 5435 2023 50  0000 C CNN
F 2 "" H 5420 1850 50  0001 C CNN
F 3 "" H 5420 1850 50  0001 C CNN
	1    5420 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5420 1850 5420 2090
Wire Wire Line
	5420 2090 5310 2090
$Comp
L power:+3V3 #PWR03
U 1 1 61E6F422
P 5610 1850
F 0 "#PWR03" H 5610 1700 50  0001 C CNN
F 1 "+3V3" H 5625 2023 50  0000 C CNN
F 2 "" H 5610 1850 50  0001 C CNN
F 3 "" H 5610 1850 50  0001 C CNN
	1    5610 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5610 2390 5310 2390
Connection ~ 5440 2690
Wire Wire Line
	5310 2690 5440 2690
Wire Wire Line
	5310 2490 5610 2490
Wire Wire Line
	5610 2490 5610 2390
Connection ~ 5610 2390
NoConn ~ 5310 2290
Text GLabel 5820 2990 2    39   Input ~ 0
~RESET
Wire Wire Line
	5820 2990 5310 2990
Text GLabel 5820 3090 2    50   Output ~ 0
PUMP_EN
Wire Wire Line
	5310 3090 5820 3090
Text GLabel 7650 4330 0    50   Input ~ 0
PUMP_EN
Wire Wire Line
	7650 4330 7840 4330
Text GLabel 3560 3590 0    50   Input ~ 0
UART_RX0
Text GLabel 3550 3490 0    50   Output ~ 0
UART_TX0
Wire Wire Line
	3520 2890 3910 2890
Wire Wire Line
	3530 2790 3910 2790
Wire Wire Line
	8390 5100 8570 5100
Wire Wire Line
	9100 4910 9250 4910
Wire Wire Line
	9250 4910 9250 4770
$Comp
L DMG2305UX-7:DMG2305UX-7 Q1
U 1 1 61E3A2CB
P 8900 5010
F 0 "Q1" V 9235 5010 50  0000 C CNN
F 1 "‎SSM3J371R,LF‎" V 9144 5010 50  0000 C CNN
F 2 "SnapEDA Library:SOT91P240X110-3N_DMG2305UX-7" H 8900 5010 50  0001 L BNN
F 3 "" H 8900 5010 50  0001 L BNN
F 4 "09/2018" H 8900 5010 50  0001 L BNN "PARTREV"
F 5 "IPC-7351B" H 8900 5010 50  0001 L BNN "STANDARD"
F 6 "Diodes Inc." H 8900 5010 50  0001 L BNN "MANUFACTURER"
F 7 "1.1mm" H 8900 5010 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
	1    8900 5010
	0    -1   -1   0   
$EndComp
Text GLabel 8920 5120 0    50   Input ~ 0
VBUS
Wire Wire Line
	8920 5120 9000 5120
Wire Wire Line
	9000 5120 9000 5110
Wire Wire Line
	8570 5100 8570 4910
Wire Wire Line
	8570 4910 8700 4910
Wire Wire Line
	5610 1850 5610 2390
Text GLabel 5810 1990 2    50   Output ~ 0
VBUS
Wire Wire Line
	5310 1990 5810 1990
Text GLabel 5840 3390 2    50   Input ~ 0
FLOW_PULSE
$Comp
L Connector:Conn_01x03_Female J2
U 1 1 61E4D469
P 9910 2220
F 0 "J2" H 9938 2246 50  0000 L CNN
F 1 "To Level Sensor in Keurig" H 9938 2155 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9910 2220 50  0001 C CNN
F 3 "~" H 9910 2220 50  0001 C CNN
	1    9910 2220
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 61E4D896
P 9910 1600
F 0 "J1" H 9938 1626 50  0000 L CNN
F 1 "To Level Sensor in Source" H 9938 1535 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9910 1600 50  0001 C CNN
F 3 "~" H 9910 1600 50  0001 C CNN
	1    9910 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 61E4DFA0
P 9500 3230
F 0 "#PWR05" H 9500 2980 50  0001 C CNN
F 1 "GND" H 9505 3057 50  0000 C CNN
F 2 "" H 9500 3230 50  0001 C CNN
F 3 "" H 9500 3230 50  0001 C CNN
	1    9500 3230
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 3230 9500 2800
Wire Wire Line
	9500 2120 9710 2120
Wire Wire Line
	9500 2120 9500 1500
Wire Wire Line
	9500 1500 9710 1500
Connection ~ 9500 2120
Wire Wire Line
	9710 2800 9500 2800
Connection ~ 9500 2800
Wire Wire Line
	9500 2800 9500 2120
$Comp
L power:+12V #PWR04
U 1 1 61E5314D
P 9230 2560
F 0 "#PWR04" H 9230 2410 50  0001 C CNN
F 1 "+12V" H 9245 2733 50  0000 C CNN
F 2 "" H 9230 2560 50  0001 C CNN
F 3 "" H 9230 2560 50  0001 C CNN
	1    9230 2560
	1    0    0    -1  
$EndComp
Wire Wire Line
	9230 2900 9710 2900
$Comp
L power:+3V3 #PWR01
U 1 1 61E5A111
P 9270 1400
F 0 "#PWR01" H 9270 1250 50  0001 C CNN
F 1 "+3V3" H 9285 1573 50  0000 C CNN
F 2 "" H 9270 1400 50  0001 C CNN
F 3 "" H 9270 1400 50  0001 C CNN
	1    9270 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9710 1600 9270 1600
Wire Wire Line
	9270 1600 9270 1400
Wire Wire Line
	9710 2220 9270 2220
Wire Wire Line
	9270 2220 9270 1600
Connection ~ 9270 1600
Text GLabel 8930 2320 0    50   Output ~ 0
ADC0
Text GLabel 8900 1700 0    50   Output ~ 0
ADC1
Wire Wire Line
	9710 2320 9020 2320
Wire Wire Line
	9710 1700 9030 1700
$Comp
L Device:R R1
U 1 1 61E50B55
P 8350 3270
F 0 "R1" H 8420 3316 50  0000 L CNN
F 1 "10k" H 8420 3225 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8280 3270 50  0001 C CNN
F 3 "~" H 8350 3270 50  0001 C CNN
	1    8350 3270
	1    0    0    -1  
$EndComp
Wire Wire Line
	8630 3000 8350 3000
Text GLabel 7950 3000 0    50   Output ~ 0
FLOW_PULSE
Connection ~ 8350 3000
Wire Wire Line
	9230 2560 9230 2900
$Comp
L Diode:BZX84Cxx D1
U 1 1 61EB4AC7
P 8780 3000
F 0 "D1" H 8780 3217 50  0000 C CNN
F 1 "BZX84C3V3LT1G" H 8940 3120 50  0000 C CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 8780 2825 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzx84c2v4.pdf" H 8780 3000 50  0001 C CNN
	1    8780 3000
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 61EC76E1
P 8350 3500
F 0 "#PWR06" H 8350 3250 50  0001 C CNN
F 1 "GND" H 8355 3327 50  0000 C CNN
F 2 "" H 8350 3500 50  0001 C CNN
F 3 "" H 8350 3500 50  0001 C CNN
	1    8350 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 3500 8350 3420
Wire Wire Line
	8350 3120 8350 3000
Wire Wire Line
	7950 3000 8350 3000
Wire Wire Line
	8930 3000 9710 3000
NoConn ~ 3910 3890
NoConn ~ 3910 2090
NoConn ~ 3910 1990
NoConn ~ 3910 3390
NoConn ~ 3910 3290
NoConn ~ 3910 3090
NoConn ~ 3910 2990
NoConn ~ 3910 2590
NoConn ~ 3910 2490
NoConn ~ 3910 2390
NoConn ~ 3910 2290
NoConn ~ 4510 4090
NoConn ~ 4710 4090
$Comp
L Connector:Screw_Terminal_01x03 J3
U 1 1 61EF40C6
P 9910 2900
F 0 "J3" H 9990 2942 50  0000 L CNN
F 1 "To Flow Sensor" H 9990 2851 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-3_P5.00mm" H 9910 2900 50  0001 C CNN
F 3 "~" H 9910 2900 50  0001 C CNN
	1    9910 2900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 61EF5DE5
P 9830 4530
F 0 "J4" H 9910 4522 50  0000 L CNN
F 1 "To Water Pump" H 9910 4431 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-2_P5.00mm" H 9830 4530 50  0001 C CNN
F 3 "~" H 9830 4530 50  0001 C CNN
	1    9830 4530
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 61EBEC5E
P 9030 1900
F 0 "R6" H 9100 1946 50  0000 L CNN
F 1 "1k" H 9100 1855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8960 1900 50  0001 C CNN
F 3 "~" H 9030 1900 50  0001 C CNN
	1    9030 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 61EBF2C8
P 9020 2540
F 0 "R7" H 9090 2586 50  0000 L CNN
F 1 "1k" H 9090 2495 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8950 2540 50  0001 C CNN
F 3 "~" H 9020 2540 50  0001 C CNN
	1    9020 2540
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 61EBF87E
P 9020 2740
F 0 "#PWR0101" H 9020 2490 50  0001 C CNN
F 1 "GND" H 9020 2600 50  0000 C CNN
F 2 "" H 9020 2740 50  0001 C CNN
F 3 "" H 9020 2740 50  0001 C CNN
	1    9020 2740
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 61EBFEF7
P 9030 2100
F 0 "#PWR0102" H 9030 1850 50  0001 C CNN
F 1 "GND" H 9030 1960 50  0000 C CNN
F 2 "" H 9030 2100 50  0001 C CNN
F 3 "" H 9030 2100 50  0001 C CNN
	1    9030 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9030 2100 9030 2050
Wire Wire Line
	9020 2690 9020 2740
Wire Wire Line
	9020 2390 9020 2320
Connection ~ 9020 2320
Wire Wire Line
	9020 2320 8930 2320
Wire Wire Line
	9030 1750 9030 1700
Connection ~ 9030 1700
Wire Wire Line
	9030 1700 8900 1700
$Comp
L MB85RS64V:MB85RS64V U2
U 1 1 61EBF6B7
P 4630 5480
F 0 "U2" H 4630 5947 50  0000 C CNN
F 1 "MB85RS64V" H 4630 5856 50  0000 C CNN
F 2 "SnapEDA Library:SOIC127P600X155-8_R159_68_374R15" H 4630 5480 50  0001 L BNN
F 3 "" H 4630 5480 50  0001 L BNN
	1    4630 5480
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0103
U 1 1 61EBFC38
P 5290 5210
F 0 "#PWR0103" H 5290 5060 50  0001 C CNN
F 1 "+3V3" H 5305 5383 50  0000 C CNN
F 2 "" H 5290 5210 50  0001 C CNN
F 3 "" H 5290 5210 50  0001 C CNN
	1    5290 5210
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 61EC01F1
P 3960 5730
F 0 "#PWR0104" H 3960 5480 50  0001 C CNN
F 1 "GND" H 3965 5557 50  0000 C CNN
F 2 "" H 3960 5730 50  0001 C CNN
F 3 "" H 3960 5730 50  0001 C CNN
	1    3960 5730
	1    0    0    -1  
$EndComp
Wire Wire Line
	3960 5730 3960 5580
Wire Wire Line
	3960 5580 4130 5580
Wire Wire Line
	5130 5280 5290 5280
Wire Wire Line
	5290 5280 5290 5210
Wire Wire Line
	5130 5380 5290 5380
Wire Wire Line
	5290 5380 5290 5280
Connection ~ 5290 5280
$Comp
L power:+3V3 #PWR0105
U 1 1 61EC7EDC
P 3970 5170
F 0 "#PWR0105" H 3970 5020 50  0001 C CNN
F 1 "+3V3" H 3985 5343 50  0000 C CNN
F 2 "" H 3970 5170 50  0001 C CNN
F 3 "" H 3970 5170 50  0001 C CNN
	1    3970 5170
	1    0    0    -1  
$EndComp
Wire Wire Line
	3970 5480 4130 5480
Wire Wire Line
	3970 5170 3970 5480
Text GLabel 3520 5280 0    50   Input ~ 0
SPI_CS0
Wire Wire Line
	4130 5280 3520 5280
Text GLabel 3520 5380 0    50   Output ~ 0
MISO0
Wire Wire Line
	4130 5380 3520 5380
Text GLabel 5560 5580 2    50   Input ~ 0
MOSI0
Wire Wire Line
	5130 5580 5560 5580
Text GLabel 5550 5480 2    50   Input ~ 0
SCK0
Wire Wire Line
	5130 5480 5550 5480
$Comp
L Transistor_FET:2N7002 Q2
U 1 1 61EE0332
P 1560 1070
F 0 "Q2" H 1764 1116 50  0000 L CNN
F 1 "2N7002" H 1764 1025 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 1760 995 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 1560 1070 50  0001 L CNN
	1    1560 1070
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q3
U 1 1 61EE7151
P 3190 1070
F 0 "Q3" H 3394 1116 50  0000 L CNN
F 1 "2N7002" H 3394 1025 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3390 995 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 3190 1070 50  0001 L CNN
	1    3190 1070
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 61EE9915
P 1170 790
F 0 "R2" V 1330 750 50  0000 L CNN
F 1 "4k7" V 1260 730 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1100 790 50  0001 C CNN
F 3 "~" H 1170 790 50  0001 C CNN
	1    1170 790 
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 61EF97D1
P 1380 1330
F 0 "R4" V 1540 1290 50  0000 L CNN
F 1 "4k7" V 1470 1270 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1310 1330 50  0001 C CNN
F 3 "~" H 1380 1330 50  0001 C CNN
	1    1380 1330
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 61EFA152
P 2770 810
F 0 "R3" V 2930 770 50  0000 L CNN
F 1 "4k7" V 2860 750 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2700 810 50  0001 C CNN
F 3 "~" H 2770 810 50  0001 C CNN
	1    2770 810 
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 61EFA591
P 3020 1350
F 0 "R5" V 3180 1310 50  0000 L CNN
F 1 "4k7" V 3110 1290 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2950 1350 50  0001 C CNN
F 3 "~" H 3020 1350 50  0001 C CNN
	1    3020 1350
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 61F027DA
P 880 780
F 0 "#PWR0106" H 880 630 50  0001 C CNN
F 1 "+5V" H 895 953 50  0000 C CNN
F 2 "" H 880 780 50  0001 C CNN
F 3 "" H 880 780 50  0001 C CNN
	1    880  780 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 61F03731
P 2510 780
F 0 "#PWR0107" H 2510 630 50  0001 C CNN
F 1 "+5V" H 2525 953 50  0000 C CNN
F 2 "" H 2510 780 50  0001 C CNN
F 3 "" H 2510 780 50  0001 C CNN
	1    2510 780 
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0108
U 1 1 61F03D2E
P 930 1040
F 0 "#PWR0108" H 930 890 50  0001 C CNN
F 1 "+3V3" H 945 1213 50  0000 C CNN
F 2 "" H 930 1040 50  0001 C CNN
F 3 "" H 930 1040 50  0001 C CNN
	1    930  1040
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0109
U 1 1 61F051B5
P 2530 1060
F 0 "#PWR0109" H 2530 910 50  0001 C CNN
F 1 "+3V3" H 2545 1233 50  0000 C CNN
F 2 "" H 2530 1060 50  0001 C CNN
F 3 "" H 2530 1060 50  0001 C CNN
	1    2530 1060
	1    0    0    -1  
$EndComp
Wire Wire Line
	1020 790  880  790 
Wire Wire Line
	880  790  880  780 
Wire Wire Line
	930  1040 930  1070
Wire Wire Line
	930  1070 1180 1070
Wire Wire Line
	1230 1330 1180 1330
Wire Wire Line
	1180 1330 1180 1070
Connection ~ 1180 1070
Wire Wire Line
	1180 1070 1360 1070
Wire Wire Line
	1530 1330 1660 1330
Wire Wire Line
	1660 1330 1660 1270
Wire Wire Line
	1320 790  1660 790 
Wire Wire Line
	1660 790  1660 870 
Wire Wire Line
	2620 810  2510 810 
Wire Wire Line
	2510 810  2510 780 
Wire Wire Line
	2530 1060 2530 1070
Wire Wire Line
	2530 1070 2800 1070
Wire Wire Line
	2870 1350 2800 1350
Wire Wire Line
	2800 1350 2800 1070
Connection ~ 2800 1070
Wire Wire Line
	2800 1070 2990 1070
Wire Wire Line
	3170 1350 3290 1350
Wire Wire Line
	3290 1350 3290 1270
Wire Wire Line
	3290 810  3290 870 
Wire Wire Line
	2920 810  3290 810 
Text GLabel 3700 1350 2    50   3State ~ 0
SDA0
Text GLabel 2010 1330 2    50   3State ~ 0
SCL0
Wire Wire Line
	1660 1330 2010 1330
Connection ~ 1660 1330
Wire Wire Line
	3290 1350 3700 1350
Connection ~ 3290 1350
Text GLabel 1980 790  2    50   3State ~ 0
SCL_5V
Wire Wire Line
	1660 790  1980 790 
Connection ~ 1660 790 
Text GLabel 3670 810  2    50   3State ~ 0
SDA_5V
Wire Wire Line
	3290 810  3670 810 
Connection ~ 3290 810 
$Comp
L Connector:Conn_01x04_Female J7
U 1 1 61F50FBB
P 1190 2280
F 0 "J7" H 1218 2256 50  0000 L CNN
F 1 "To LCD Module" H 1218 2165 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 1190 2280 50  0001 C CNN
F 3 "~" H 1190 2280 50  0001 C CNN
	1    1190 2280
	-1   0    0    -1  
$EndComp
Text GLabel 1600 2480 2    50   3State ~ 0
SCL_5V
Text GLabel 1600 2380 2    50   3State ~ 0
SDA_5V
$Comp
L power:+5V #PWR0110
U 1 1 61F54BAE
P 1490 2060
F 0 "#PWR0110" H 1490 1910 50  0001 C CNN
F 1 "+5V" H 1505 2233 50  0000 C CNN
F 2 "" H 1490 2060 50  0001 C CNN
F 3 "" H 1490 2060 50  0001 C CNN
	1    1490 2060
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 61F5514C
P 1450 2540
F 0 "#PWR0111" H 1450 2290 50  0001 C CNN
F 1 "GND" H 1455 2367 50  0000 C CNN
F 2 "" H 1450 2540 50  0001 C CNN
F 3 "" H 1450 2540 50  0001 C CNN
	1    1450 2540
	1    0    0    -1  
$EndComp
Wire Wire Line
	1390 2480 1600 2480
Wire Wire Line
	1600 2380 1390 2380
Wire Wire Line
	1390 2180 1450 2180
Wire Wire Line
	1450 2180 1450 2540
Wire Wire Line
	1390 2280 1490 2280
Wire Wire Line
	1490 2280 1490 2060
Wire Wire Line
	3550 3490 3910 3490
Wire Wire Line
	3910 3590 3560 3590
$Comp
L Transistor_FET:2N7002 Q4
U 1 1 61FEB448
P 1430 4690
F 0 "Q4" H 1634 4736 50  0000 L CNN
F 1 "2N7002" H 1634 4645 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 1630 4615 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 1430 4690 50  0001 L CNN
	1    1430 4690
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q5
U 1 1 61FEB44E
P 1460 5690
F 0 "Q5" H 1664 5736 50  0000 L CNN
F 1 "2N7002" H 1664 5645 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 1660 5615 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 1460 5690 50  0001 L CNN
	1    1460 5690
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 61FEB454
P 1040 4410
F 0 "R8" V 1200 4370 50  0000 L CNN
F 1 "4k7" V 1130 4350 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 970 4410 50  0001 C CNN
F 3 "~" H 1040 4410 50  0001 C CNN
	1    1040 4410
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 61FEB45A
P 1250 4950
F 0 "R9" V 1410 4910 50  0000 L CNN
F 1 "4k7" V 1340 4890 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1180 4950 50  0001 C CNN
F 3 "~" H 1250 4950 50  0001 C CNN
	1    1250 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 61FEB460
P 1040 5430
F 0 "R10" V 1200 5390 50  0000 L CNN
F 1 "4k7" V 1130 5370 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 970 5430 50  0001 C CNN
F 3 "~" H 1040 5430 50  0001 C CNN
	1    1040 5430
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 61FEB466
P 1290 5970
F 0 "R11" V 1450 5930 50  0000 L CNN
F 1 "4k7" V 1380 5910 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1220 5970 50  0001 C CNN
F 3 "~" H 1290 5970 50  0001 C CNN
	1    1290 5970
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0112
U 1 1 61FEB46C
P 750 4400
F 0 "#PWR0112" H 750 4250 50  0001 C CNN
F 1 "+5V" H 765 4573 50  0000 C CNN
F 2 "" H 750 4400 50  0001 C CNN
F 3 "" H 750 4400 50  0001 C CNN
	1    750  4400
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0114
U 1 1 61FEB478
P 800 4660
F 0 "#PWR0114" H 800 4510 50  0001 C CNN
F 1 "+3V3" H 815 4833 50  0000 C CNN
F 2 "" H 800 4660 50  0001 C CNN
F 3 "" H 800 4660 50  0001 C CNN
	1    800  4660
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0115
U 1 1 61FEB47E
P 800 5680
F 0 "#PWR0115" H 800 5530 50  0001 C CNN
F 1 "+3V3" H 815 5853 50  0000 C CNN
F 2 "" H 800 5680 50  0001 C CNN
F 3 "" H 800 5680 50  0001 C CNN
	1    800  5680
	1    0    0    -1  
$EndComp
Wire Wire Line
	890  4410 750  4410
Wire Wire Line
	750  4410 750  4400
Wire Wire Line
	800  4660 800  4690
Wire Wire Line
	800  4690 1050 4690
Wire Wire Line
	1100 4950 1050 4950
Wire Wire Line
	1050 4950 1050 4690
Connection ~ 1050 4690
Wire Wire Line
	1050 4690 1230 4690
Wire Wire Line
	1400 4950 1530 4950
Wire Wire Line
	1530 4950 1530 4890
Wire Wire Line
	1190 4410 1530 4410
Wire Wire Line
	1530 4410 1530 4490
Wire Wire Line
	800  5680 800  5690
Wire Wire Line
	800  5690 1070 5690
Wire Wire Line
	1140 5970 1070 5970
Wire Wire Line
	1070 5970 1070 5690
Connection ~ 1070 5690
Wire Wire Line
	1070 5690 1260 5690
Wire Wire Line
	1440 5970 1560 5970
Wire Wire Line
	1560 5970 1560 5890
Wire Wire Line
	1560 5430 1560 5490
Text GLabel 1970 5970 2    50   Output ~ 0
UART_RX0
Text GLabel 1880 4950 2    50   Input ~ 0
UART_TX0
Wire Wire Line
	1530 4950 1880 4950
Connection ~ 1530 4950
Wire Wire Line
	1560 5970 1970 5970
Connection ~ 1560 5970
Text GLabel 1850 4410 2    50   Output ~ 0
HC05_RX
Wire Wire Line
	1530 4410 1850 4410
Connection ~ 1530 4410
Text GLabel 1940 5430 2    50   Input ~ 0
HC05_TX
Wire Wire Line
	1560 5430 1940 5430
Connection ~ 1560 5430
$Comp
L Connector:Conn_01x06_Female J8
U 1 1 6200DC8F
P 1210 3410
F 0 "J8" H 1310 3410 50  0000 C CNN
F 1 "To HC-05 Module" H 1590 3340 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 1210 3410 50  0001 C CNN
F 3 "~" H 1210 3410 50  0001 C CNN
	1    1210 3410
	-1   0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q6
U 1 1 620150AF
P 1500 6680
F 0 "Q6" H 1704 6726 50  0000 L CNN
F 1 "2N7002" H 1704 6635 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 1700 6605 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 1500 6680 50  0001 L CNN
	1    1500 6680
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 620150B5
P 1080 6420
F 0 "R12" V 1240 6380 50  0000 L CNN
F 1 "4k7" V 1170 6360 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1010 6420 50  0001 C CNN
F 3 "~" H 1080 6420 50  0001 C CNN
	1    1080 6420
	0    1    1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 620150BB
P 1330 6960
F 0 "R13" V 1490 6920 50  0000 L CNN
F 1 "4k7" V 1420 6900 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1260 6960 50  0001 C CNN
F 3 "~" H 1330 6960 50  0001 C CNN
	1    1330 6960
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0116
U 1 1 620150C1
P 860 6390
F 0 "#PWR0116" H 860 6240 50  0001 C CNN
F 1 "+5V" H 875 6563 50  0000 C CNN
F 2 "" H 860 6390 50  0001 C CNN
F 3 "" H 860 6390 50  0001 C CNN
	1    860  6390
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0117
U 1 1 620150C7
P 840 6670
F 0 "#PWR0117" H 840 6520 50  0001 C CNN
F 1 "+3V3" H 855 6843 50  0000 C CNN
F 2 "" H 840 6670 50  0001 C CNN
F 3 "" H 840 6670 50  0001 C CNN
	1    840  6670
	1    0    0    -1  
$EndComp
Wire Wire Line
	930  6420 860  6420
Wire Wire Line
	860  6420 860  6390
Wire Wire Line
	840  6670 840  6680
Wire Wire Line
	840  6680 1110 6680
Wire Wire Line
	1180 6960 1110 6960
Wire Wire Line
	1110 6960 1110 6680
Connection ~ 1110 6680
Wire Wire Line
	1110 6680 1300 6680
Wire Wire Line
	1480 6960 1600 6960
Wire Wire Line
	1600 6960 1600 6880
Wire Wire Line
	1600 6420 1600 6480
Wire Wire Line
	1230 6420 1600 6420
Text GLabel 2010 6960 2    39   Input ~ 0
~UART_KEY
Wire Wire Line
	1600 6960 2010 6960
Connection ~ 1600 6960
Text GLabel 1980 6420 2    50   Output ~ 0
~HC05_KEY
Wire Wire Line
	1600 6420 1980 6420
Connection ~ 1600 6420
Text GLabel 3560 3790 0    39   Output ~ 0
~UART_KEY
Wire Wire Line
	3910 3790 3560 3790
Text GLabel 1700 3210 2    50   Output ~ 0
~HC05_KEY
$Comp
L power:+5V #PWR0118
U 1 1 6202B082
P 1540 3110
F 0 "#PWR0118" H 1540 2960 50  0001 C CNN
F 1 "+5V" H 1555 3283 50  0000 C CNN
F 2 "" H 1540 3110 50  0001 C CNN
F 3 "" H 1540 3110 50  0001 C CNN
	1    1540 3110
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 6202B320
P 1570 3780
F 0 "#PWR0119" H 1570 3530 50  0001 C CNN
F 1 "GND" H 1575 3607 50  0000 C CNN
F 2 "" H 1570 3780 50  0001 C CNN
F 3 "" H 1570 3780 50  0001 C CNN
	1    1570 3780
	1    0    0    -1  
$EndComp
NoConn ~ 1410 3710
Text GLabel 1710 3610 2    50   Output ~ 0
HC05_RX
Text GLabel 1700 3510 2    50   Input ~ 0
HC05_TX
Wire Wire Line
	1410 3610 1710 3610
Wire Wire Line
	1410 3510 1700 3510
Wire Wire Line
	1410 3410 1570 3410
Wire Wire Line
	1570 3410 1570 3780
Wire Wire Line
	1410 3310 1540 3310
Wire Wire Line
	1540 3310 1540 3110
Wire Wire Line
	1410 3210 1700 3210
$Comp
L power:+5V #PWR0113
U 1 1 61FEB472
P 820 5400
F 0 "#PWR0113" H 820 5250 50  0001 C CNN
F 1 "+5V" H 835 5573 50  0000 C CNN
F 2 "" H 820 5400 50  0001 C CNN
F 3 "" H 820 5400 50  0001 C CNN
	1    820  5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1190 5430 1560 5430
Wire Wire Line
	820  5430 890  5430
Wire Wire Line
	820  5400 820  5430
Wire Wire Line
	5440 2190 5440 2690
NoConn ~ 5310 2590
NoConn ~ 5310 3290
$Comp
L Graphic:Logo_Open_Hardware_Large #LOGO1
U 1 1 61EDAA38
P 6350 7170
F 0 "#LOGO1" H 6350 7670 50  0001 C CNN
F 1 "Logo_Open_Hardware_Large" H 6350 6770 50  0001 C CNN
F 2 "" H 6350 7170 50  0001 C CNN
F 3 "~" H 6350 7170 50  0001 C CNN
	1    6350 7170
	1    0    0    -1  
$EndComp
$EndSCHEMATC