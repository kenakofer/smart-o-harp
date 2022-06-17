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
L power:+12V #PWR020
U 1 1 5F589306
P 9900 1250
F 0 "#PWR020" H 9900 1100 50  0001 C CNN
F 1 "+12V" H 9915 1423 50  0000 C CNN
F 2 "" H 9900 1250 50  0001 C CNN
F 3 "" H 9900 1250 50  0001 C CNN
	1    9900 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5F5C90C8
P 6150 -350
F 0 "#PWR012" H 6150 -600 50  0001 C CNN
F 1 "GND" H 6155 -523 50  0000 C CNN
F 2 "" H 6150 -350 50  0001 C CNN
F 3 "" H 6150 -350 50  0001 C CNN
	1    6150 -350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5F5C9C22
P 6700 -350
F 0 "#PWR013" H 6700 -600 50  0001 C CNN
F 1 "GND" H 6705 -523 50  0000 C CNN
F 2 "" H 6700 -350 50  0001 C CNN
F 3 "" H 6700 -350 50  0001 C CNN
	1    6700 -350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5F5CA1EF
P 7250 -350
F 0 "#PWR014" H 7250 -600 50  0001 C CNN
F 1 "GND" H 7255 -523 50  0000 C CNN
F 2 "" H 7250 -350 50  0001 C CNN
F 3 "" H 7250 -350 50  0001 C CNN
	1    7250 -350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5F5CA668
P 7800 -350
F 0 "#PWR016" H 7800 -600 50  0001 C CNN
F 1 "GND" H 7805 -523 50  0000 C CNN
F 2 "" H 7800 -350 50  0001 C CNN
F 3 "" H 7800 -350 50  0001 C CNN
	1    7800 -350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5F5CA98D
P 8350 -350
F 0 "#PWR017" H 8350 -600 50  0001 C CNN
F 1 "GND" H 8355 -523 50  0000 C CNN
F 2 "" H 8350 -350 50  0001 C CNN
F 3 "" H 8350 -350 50  0001 C CNN
	1    8350 -350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5F5CAC7F
P 8900 -350
F 0 "#PWR018" H 8900 -600 50  0001 C CNN
F 1 "GND" H 8905 -523 50  0000 C CNN
F 2 "" H 8900 -350 50  0001 C CNN
F 3 "" H 8900 -350 50  0001 C CNN
	1    8900 -350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5F5CAF60
P 9450 -350
F 0 "#PWR019" H 9450 -600 50  0001 C CNN
F 1 "GND" H 9455 -523 50  0000 C CNN
F 2 "" H 9450 -350 50  0001 C CNN
F 3 "" H 9450 -350 50  0001 C CNN
	1    9450 -350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5F5CBCA5
P 10000 -350
F 0 "#PWR021" H 10000 -600 50  0001 C CNN
F 1 "GND" H 10005 -523 50  0000 C CNN
F 2 "" H 10000 -350 50  0001 C CNN
F 3 "" H 10000 -350 50  0001 C CNN
	1    10000 -350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 -700 6150 -350
Wire Wire Line
	6700 -350 6700 -700
Wire Wire Line
	7250 -700 7250 -350
Wire Wire Line
	7800 -350 7800 -700
Wire Wire Line
	8350 -350 8350 -700
Wire Wire Line
	8900 -700 8900 -350
Wire Wire Line
	9450 -700 9450 -350
Wire Wire Line
	10000 -350 10000 -700
Wire Wire Line
	6500 -100 6500 -400
Wire Wire Line
	7050 -50  7050 -400
Wire Wire Line
	7600 0    7600 -400
Wire Wire Line
	8150 50   8150 -400
Wire Wire Line
	8700 100  8700 -400
Wire Wire Line
	9250 150  9250 -400
Wire Wire Line
	9800 200  9800 -400
$Comp
L power:GND #PWR011
U 1 1 5F63E490
P 5550 950
F 0 "#PWR011" H 5550 700 50  0001 C CNN
F 1 "GND" H 5555 777 50  0000 C CNN
F 2 "" H 5550 950 50  0001 C CNN
F 3 "" H 5550 950 50  0001 C CNN
	1    5550 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 3200 9600 3650
$Comp
L Device:R R9
U 1 1 5F653844
P 5950 -250
F 0 "R9" H 6020 -204 50  0000 L CNN
F 1 "1K" H 6020 -295 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 5880 -250 50  0001 C CNN
F 3 "~" H 5950 -250 50  0001 C CNN
	1    5950 -250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5F6593F5
P 6350 -100
F 0 "R10" V 6143 -100 50  0000 C CNN
F 1 "1K" V 6234 -100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6280 -100 50  0001 C CNN
F 3 "~" H 6350 -100 50  0001 C CNN
	1    6350 -100
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 5F659884
P 6900 -50
F 0 "R11" V 6693 -50 50  0000 C CNN
F 1 "1K" V 6784 -50 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6830 -50 50  0001 C CNN
F 3 "~" H 6900 -50 50  0001 C CNN
	1    6900 -50 
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 5F659B84
P 7450 0
F 0 "R12" V 7243 0   50  0000 C CNN
F 1 "1K" V 7334 0   50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7380 0   50  0001 C CNN
F 3 "~" H 7450 0   50  0001 C CNN
	1    7450 0   
	0    1    1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 5F659D5E
P 8000 50
F 0 "R13" V 7793 50  50  0000 C CNN
F 1 "1K" V 7884 50  50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7930 50  50  0001 C CNN
F 3 "~" H 8000 50  50  0001 C CNN
	1    8000 50  
	0    1    1    0   
$EndComp
$Comp
L Device:R R14
U 1 1 5F659EF9
P 8550 100
F 0 "R14" V 8343 100 50  0000 C CNN
F 1 "1K" V 8434 100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 8480 100 50  0001 C CNN
F 3 "~" H 8550 100 50  0001 C CNN
	1    8550 100 
	0    1    1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 5F65A07F
P 9100 150
F 0 "R15" V 8893 150 50  0000 C CNN
F 1 "1K" V 8984 150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 9030 150 50  0001 C CNN
F 3 "~" H 9100 150 50  0001 C CNN
	1    9100 150 
	0    1    1    0   
$EndComp
$Comp
L Device:R R16
U 1 1 5F65A340
P 9650 200
F 0 "R16" V 9443 200 50  0000 C CNN
F 1 "1K" V 9534 200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 9580 200 50  0001 C CNN
F 3 "~" H 9650 200 50  0001 C CNN
	1    9650 200 
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 550  5950 -100
Wire Wire Line
	6200 -100 6050 -100
Wire Wire Line
	6050 -100 6050 550 
Wire Wire Line
	6150 -50  6150 550 
Wire Wire Line
	6150 -50  6750 -50 
Wire Wire Line
	7300 0    6250 0   
Wire Wire Line
	6250 0    6250 550 
Wire Wire Line
	7850 50   6350 50  
Wire Wire Line
	6350 50   6350 550 
Wire Wire Line
	8400 100  6450 100 
Wire Wire Line
	6450 100  6450 550 
Wire Wire Line
	8950 150  6550 150 
Wire Wire Line
	6550 150  6550 550 
Wire Wire Line
	9500 200  6650 200 
Wire Wire Line
	6650 200  6650 550 
$Comp
L power:GND #PWR02
U 1 1 5F7F50C9
P 1600 -350
F 0 "#PWR02" H 1600 -600 50  0001 C CNN
F 1 "GND" H 1605 -523 50  0000 C CNN
F 2 "" H 1600 -350 50  0001 C CNN
F 3 "" H 1600 -350 50  0001 C CNN
	1    1600 -350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5F7F50CF
P 2150 -350
F 0 "#PWR04" H 2150 -600 50  0001 C CNN
F 1 "GND" H 2155 -523 50  0000 C CNN
F 2 "" H 2150 -350 50  0001 C CNN
F 3 "" H 2150 -350 50  0001 C CNN
	1    2150 -350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5F7F50D5
P 2700 -350
F 0 "#PWR05" H 2700 -600 50  0001 C CNN
F 1 "GND" H 2705 -523 50  0000 C CNN
F 2 "" H 2700 -350 50  0001 C CNN
F 3 "" H 2700 -350 50  0001 C CNN
	1    2700 -350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5F7F50DB
P 3250 -350
F 0 "#PWR06" H 3250 -600 50  0001 C CNN
F 1 "GND" H 3255 -523 50  0000 C CNN
F 2 "" H 3250 -350 50  0001 C CNN
F 3 "" H 3250 -350 50  0001 C CNN
	1    3250 -350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5F7F50E1
P 3800 -350
F 0 "#PWR07" H 3800 -600 50  0001 C CNN
F 1 "GND" H 3805 -523 50  0000 C CNN
F 2 "" H 3800 -350 50  0001 C CNN
F 3 "" H 3800 -350 50  0001 C CNN
	1    3800 -350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5F7F50E7
P 4350 -350
F 0 "#PWR08" H 4350 -600 50  0001 C CNN
F 1 "GND" H 4355 -523 50  0000 C CNN
F 2 "" H 4350 -350 50  0001 C CNN
F 3 "" H 4350 -350 50  0001 C CNN
	1    4350 -350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5F7F50ED
P 4900 -350
F 0 "#PWR09" H 4900 -600 50  0001 C CNN
F 1 "GND" H 4905 -523 50  0000 C CNN
F 2 "" H 4900 -350 50  0001 C CNN
F 3 "" H 4900 -350 50  0001 C CNN
	1    4900 -350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5F7F50F3
P 5450 -350
F 0 "#PWR010" H 5450 -600 50  0001 C CNN
F 1 "GND" H 5455 -523 50  0000 C CNN
F 2 "" H 5450 -350 50  0001 C CNN
F 3 "" H 5450 -350 50  0001 C CNN
	1    5450 -350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 -700 1600 -350
Wire Wire Line
	2150 -350 2150 -700
Wire Wire Line
	2700 -700 2700 -350
Wire Wire Line
	3250 -350 3250 -700
Wire Wire Line
	3800 -350 3800 -700
Wire Wire Line
	4350 -700 4350 -350
Wire Wire Line
	4900 -700 4900 -350
Wire Wire Line
	5450 -350 5450 -700
Wire Wire Line
	1950 -100 1950 -400
Wire Wire Line
	2500 -50  2500 -400
Wire Wire Line
	3050 0    3050 -400
Wire Wire Line
	3600 50   3600 -400
Wire Wire Line
	4150 100  4150 -400
Wire Wire Line
	4700 150  4700 -400
Wire Wire Line
	5250 200  5250 -400
$Comp
L Device:R R1
U 1 1 5F7F5108
P 1400 -250
F 0 "R1" H 1470 -204 50  0000 L CNN
F 1 "1K" H 1470 -295 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1330 -250 50  0001 C CNN
F 3 "~" H 1400 -250 50  0001 C CNN
	1    1400 -250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5F7F510E
P 1800 -100
F 0 "R2" V 1593 -100 50  0000 C CNN
F 1 "1K" V 1684 -100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1730 -100 50  0001 C CNN
F 3 "~" H 1800 -100 50  0001 C CNN
	1    1800 -100
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5F7F5114
P 2350 -50
F 0 "R3" V 2143 -50 50  0000 C CNN
F 1 "1K" V 2234 -50 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 2280 -50 50  0001 C CNN
F 3 "~" H 2350 -50 50  0001 C CNN
	1    2350 -50 
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5F7F511A
P 2900 0
F 0 "R4" V 2693 0   50  0000 C CNN
F 1 "1K" V 2784 0   50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 2830 0   50  0001 C CNN
F 3 "~" H 2900 0   50  0001 C CNN
	1    2900 0   
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5F7F5120
P 3450 50
F 0 "R5" V 3243 50  50  0000 C CNN
F 1 "1K" V 3334 50  50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 3380 50  50  0001 C CNN
F 3 "~" H 3450 50  50  0001 C CNN
	1    3450 50  
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5F7F5126
P 4000 100
F 0 "R6" V 3793 100 50  0000 C CNN
F 1 "1K" V 3884 100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 3930 100 50  0001 C CNN
F 3 "~" H 4000 100 50  0001 C CNN
	1    4000 100 
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5F7F512C
P 4550 150
F 0 "R7" V 4343 150 50  0000 C CNN
F 1 "1K" V 4434 150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 4480 150 50  0001 C CNN
F 3 "~" H 4550 150 50  0001 C CNN
	1    4550 150 
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5F7F5132
P 5100 200
F 0 "R8" V 4893 200 50  0000 C CNN
F 1 "1K" V 4984 200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 5030 200 50  0001 C CNN
F 3 "~" H 5100 200 50  0001 C CNN
	1    5100 200 
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 550  1400 -100
Wire Wire Line
	1650 -100 1500 -100
Wire Wire Line
	1500 -100 1500 550 
Wire Wire Line
	1600 -50  1600 550 
Wire Wire Line
	1600 -50  2200 -50 
Wire Wire Line
	2750 0    1700 0   
Wire Wire Line
	1700 0    1700 550 
Wire Wire Line
	3300 50   1800 50  
Wire Wire Line
	1800 50   1800 550 
Wire Wire Line
	3850 100  1900 100 
Wire Wire Line
	1900 100  1900 550 
Wire Wire Line
	4400 150  2000 150 
Wire Wire Line
	2000 150  2000 550 
Wire Wire Line
	4950 200  2100 200 
Wire Wire Line
	2100 200  2100 550 
Wire Wire Line
	8300 2500 8300 2350
Wire Wire Line
	8400 2350 8400 2500
Wire Wire Line
	8500 2500 8500 2350
Wire Wire Line
	8600 2350 8600 2500
Wire Wire Line
	8700 2500 8700 2350
Wire Wire Line
	8800 2350 8800 2500
Wire Wire Line
	8900 2500 8900 2350
Wire Wire Line
	9000 2350 9000 2500
$Comp
L power:GND #PWR01
U 1 1 5F95677E
P 1000 950
F 0 "#PWR01" H 1000 700 50  0001 C CNN
F 1 "GND" H 1000 800 50  0000 C CNN
F 2 "" H 1000 950 50  0001 C CNN
F 3 "" H 1000 950 50  0001 C CNN
	1    1000 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 2300 8000 2500
Wire Wire Line
	2300 950  2300 3650
Wire Wire Line
	2100 1350 5400 1350
Wire Wire Line
	1900 1350 1900 2300
Wire Wire Line
	8200 2500 8200 2200
Wire Wire Line
	1500 2200 1500 1350
Wire Wire Line
	2300 3650 6350 3650
Wire Wire Line
	6850 950  6850 3650
Connection ~ 6850 3650
Wire Wire Line
	6850 3650 9600 3650
Wire Wire Line
	5400 1350 5400 550 
Wire Wire Line
	5400 550  5750 550 
Wire Wire Line
	1500 2200 6050 2200
Wire Wire Line
	6050 1350 6050 2200
Connection ~ 6050 2200
Wire Wire Line
	6050 2200 8200 2200
Wire Wire Line
	8100 2500 8100 2100
Wire Wire Line
	8100 2100 6650 2100
Wire Wire Line
	6650 2100 6650 1350
$Comp
L power:GND #PWR015
U 1 1 5FA7B43D
P 7600 3200
F 0 "#PWR015" H 7600 2950 50  0001 C CNN
F 1 "GND" H 7605 3027 50  0000 C CNN
F 2 "" H 7600 3200 50  0001 C CNN
F 3 "" H 7600 3200 50  0001 C CNN
	1    7600 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3000 7600 3100
Connection ~ 7600 3100
Wire Wire Line
	7600 3100 7600 3200
Wire Wire Line
	7900 2500 7900 2400
Wire Wire Line
	7900 2400 6150 2400
Wire Wire Line
	6150 2400 6150 1350
Wire Wire Line
	6150 2400 1600 2400
Wire Wire Line
	1600 2400 1600 1350
Connection ~ 6150 2400
Wire Wire Line
	1900 2300 6450 2300
Wire Wire Line
	6450 1350 6450 2300
Connection ~ 6450 2300
Wire Wire Line
	6450 2300 8000 2300
Wire Wire Line
	1800 1350 1800 3650
Wire Wire Line
	1800 3650 2300 3650
Connection ~ 2300 3650
Wire Wire Line
	6350 1350 6350 3650
Connection ~ 6350 3650
Wire Wire Line
	6350 3650 6850 3650
Wire Wire Line
	9900 2900 9600 2900
$Comp
L Connector_Generic:Conn_02x03_Odd_Even solenoid_power1
U 1 1 5FAFC3FF
P 10200 2700
F 0 "solenoid_power1" H 10250 2375 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 10250 2466 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 10200 2700 50  0001 C CNN
F 3 "~" H 10200 2700 50  0001 C CNN
	1    10200 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	9900 2800 9900 2900
Connection ~ 9900 2800
Connection ~ 9900 2600
Wire Wire Line
	9900 2600 9900 2700
Connection ~ 9900 2700
Wire Wire Line
	9900 2700 9900 2800
$Comp
L power:GND #PWR022
U 1 1 5FB27605
P 10400 3050
F 0 "#PWR022" H 10400 2800 50  0001 C CNN
F 1 "GND" H 10405 2877 50  0000 C CNN
F 2 "" H 10400 3050 50  0001 C CNN
F 3 "" H 10400 3050 50  0001 C CNN
	1    10400 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 2600 10400 2700
Connection ~ 10400 2700
Wire Wire Line
	10400 2700 10400 2800
Connection ~ 10400 2800
Wire Wire Line
	10400 2800 10400 3050
Connection ~ 10400 2600
Wire Wire Line
	9100 2350 9100 2500
Wire Wire Line
	9200 2350 9200 2500
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5F5B42EA
P 8600 3000
F 0 "A1" V 8554 1957 50  0000 R CNN
F 1 "Arduino_Nano_v3.x" V 8645 1957 50  0000 R CNN
F 2 "Module:Arduino_Nano" H 8600 3000 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 8600 3000 50  0001 C CNN
	1    8600 3000
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x08_Female keypad1
U 1 1 5F5DCA25
P 8600 2150
F 0 "keypad1" V 8765 2080 50  0000 C CNN
F 1 "Conn_01x08_Female" V 8674 2080 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 8600 2150 50  0001 C CNN
F 3 "~" H 8600 2150 50  0001 C CNN
	1    8600 2150
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74HC595 U1
U 1 1 5F5852ED
P 1700 950
F 0 "U1" V 1746 1594 50  0000 L CNN
F 1 "74HC595" V 1655 1594 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 1700 950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 1700 950 50  0001 C CNN
	1    1700 950 
	0    1    -1   0   
$EndComp
$Comp
L 74xx:74HC595 U2
U 1 1 5F585DB4
P 6250 950
F 0 "U2" V 6296 1594 50  0000 L CNN
F 1 "74HC595" V 6205 1594 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 6250 950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 6250 950 50  0001 C CNN
	1    6250 950 
	0    1    -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J1
U 1 1 5F684C92
P 10100 2050
F 0 "J1" H 10150 2267 50  0000 C CNN
F 1 "Conn_02x02_Odd_Even" H 10150 2176 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Vertical" H 10100 2050 50  0001 C CNN
F 3 "~" H 10100 2050 50  0001 C CNN
	1    10100 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 2150 9900 2600
Wire Wire Line
	9900 2050 9900 2150
Connection ~ 9900 2050
Connection ~ 9900 2150
Wire Wire Line
	10400 2050 10400 2150
Connection ~ 10400 2150
Wire Wire Line
	10400 2150 10400 2600
$Comp
L Device:D D17
U 1 1 5F77C222
P 9600 -2150
F 0 "D17" V 9554 -2070 50  0000 L CNN
F 1 "D" V 9645 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 9600 -2150 50  0001 C CNN
F 3 "~" H 9600 -2150 50  0001 C CNN
	1    9600 -2150
	0    1    1    0   
$EndComp
$Comp
L Device:D D16
U 1 1 5F793E17
P 9050 -2150
F 0 "D16" V 9004 -2070 50  0000 L CNN
F 1 "D" V 9095 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 9050 -2150 50  0001 C CNN
F 3 "~" H 9050 -2150 50  0001 C CNN
	1    9050 -2150
	0    1    1    0   
$EndComp
$Comp
L Device:D D15
U 1 1 5F7948A9
P 8500 -2150
F 0 "D15" V 8454 -2070 50  0000 L CNN
F 1 "D" V 8545 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 8500 -2150 50  0001 C CNN
F 3 "~" H 8500 -2150 50  0001 C CNN
	1    8500 -2150
	0    1    1    0   
$EndComp
$Comp
L Device:D D14
U 1 1 5F794D5F
P 7950 -2150
F 0 "D14" V 7904 -2070 50  0000 L CNN
F 1 "D" V 7995 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 7950 -2150 50  0001 C CNN
F 3 "~" H 7950 -2150 50  0001 C CNN
	1    7950 -2150
	0    1    1    0   
$EndComp
$Comp
L Device:D D13
U 1 1 5F7952AB
P 7400 -2150
F 0 "D13" V 7354 -2070 50  0000 L CNN
F 1 "D" V 7445 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 7400 -2150 50  0001 C CNN
F 3 "~" H 7400 -2150 50  0001 C CNN
	1    7400 -2150
	0    1    1    0   
$EndComp
Connection ~ 9600 -2300
Connection ~ 7950 -2300
Wire Wire Line
	7950 -2300 8200 -2300
Connection ~ 8500 -2300
Wire Wire Line
	8500 -2300 8750 -2300
Connection ~ 9050 -2300
Wire Wire Line
	9050 -2300 9100 -2300
$Comp
L Device:D D12
U 1 1 5F80FD84
P 6850 -2150
F 0 "D12" V 6804 -2070 50  0000 L CNN
F 1 "D" V 6895 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 6850 -2150 50  0001 C CNN
F 3 "~" H 6850 -2150 50  0001 C CNN
	1    6850 -2150
	0    1    1    0   
$EndComp
Connection ~ 7400 -2300
Wire Wire Line
	7400 -2300 7700 -2300
$Comp
L Device:D D11
U 1 1 5F83DFE9
P 6300 -2150
F 0 "D11" V 6254 -2070 50  0000 L CNN
F 1 "D" V 6345 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 6300 -2150 50  0001 C CNN
F 3 "~" H 6300 -2150 50  0001 C CNN
	1    6300 -2150
	0    1    1    0   
$EndComp
$Comp
L Device:D D10
U 1 1 5F83DFF0
P 5750 -2150
F 0 "D10" V 5704 -2070 50  0000 L CNN
F 1 "D" V 5795 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 5750 -2150 50  0001 C CNN
F 3 "~" H 5750 -2150 50  0001 C CNN
	1    5750 -2150
	0    1    1    0   
$EndComp
Connection ~ 6300 -2300
Wire Wire Line
	6300 -2300 6600 -2300
$Comp
L Device:D D9
U 1 1 5F883F54
P 5050 -2150
F 0 "D9" V 5004 -2070 50  0000 L CNN
F 1 "D" V 5095 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 5050 -2150 50  0001 C CNN
F 3 "~" H 5050 -2150 50  0001 C CNN
	1    5050 -2150
	0    1    1    0   
$EndComp
$Comp
L Device:D D8
U 1 1 5F883F5B
P 4500 -2150
F 0 "D8" V 4454 -2070 50  0000 L CNN
F 1 "D" V 4545 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 4500 -2150 50  0001 C CNN
F 3 "~" H 4500 -2150 50  0001 C CNN
	1    4500 -2150
	0    1    1    0   
$EndComp
$Comp
L Device:D D6
U 1 1 5F883F61
P 3950 -2150
F 0 "D6" V 3904 -2070 50  0000 L CNN
F 1 "D" V 3995 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 3950 -2150 50  0001 C CNN
F 3 "~" H 3950 -2150 50  0001 C CNN
	1    3950 -2150
	0    1    1    0   
$EndComp
Connection ~ 5050 -2300
Connection ~ 3950 -2300
Wire Wire Line
	3950 -2300 4200 -2300
Connection ~ 4500 -2300
Wire Wire Line
	4500 -2300 4750 -2300
Wire Wire Line
	5050 -2300 5300 -2300
Connection ~ 5750 -2300
Wire Wire Line
	5750 -2300 6050 -2300
Connection ~ 6850 -2300
Wire Wire Line
	6850 -2300 7150 -2300
$Comp
L Mechanical:MountingHole H1
U 1 1 5F8F6F5F
P 10600 -2150
F 0 "H1" H 10700 -2104 50  0000 L CNN
F 1 "MountingHole" H 10700 -2195 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 10600 -2150 50  0001 C CNN
F 3 "~" H 10600 -2150 50  0001 C CNN
	1    10600 -2150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5F8F8021
P 10600 -1750
F 0 "H2" H 10700 -1704 50  0000 L CNN
F 1 "MountingHole" H 10700 -1795 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 10600 -1750 50  0001 C CNN
F 3 "~" H 10600 -1750 50  0001 C CNN
	1    10600 -1750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5F8F8203
P 10600 -1350
F 0 "H3" H 10700 -1304 50  0000 L CNN
F 1 "MountingHole" H 10700 -1395 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 10600 -1350 50  0001 C CNN
F 3 "~" H 10600 -1350 50  0001 C CNN
	1    10600 -1350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5F8F8616
P 10600 -950
F 0 "H4" H 10700 -904 50  0000 L CNN
F 1 "MountingHole" H 10700 -995 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 10600 -950 50  0001 C CNN
F 3 "~" H 10600 -950 50  0001 C CNN
	1    10600 -950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 -700 1200 -1700
Wire Wire Line
	2300 -2000 2300 -1700
Wire Wire Line
	2850 -700 2850 -1700
Wire Wire Line
	3400 -2000 3400 -1000
Wire Wire Line
	3950 -700 3950 -1050
Wire Wire Line
	4500 -2000 4500 -1100
Wire Wire Line
	5050 -700 5050 -1150
Wire Wire Line
	5750 -700 5750 -1200
Wire Wire Line
	6300 -700 6300 -1250
Wire Wire Line
	6850 -2000 6850 -1300
Wire Wire Line
	7400 -700 7400 -1350
Wire Wire Line
	7950 -2000 7950 -1400
Wire Wire Line
	8500 -700 8500 -1450
Wire Wire Line
	9050 -2000 9050 -1500
Wire Wire Line
	9600 -700 9600 -1550
$Comp
L Connector:Screw_Terminal_01x03 Bb_B_C3
U 1 1 5F79A8D0
P 550 -1950
F 0 "Bb_B_C3" V 650 -1800 50  0000 R CNN
F 1 "Screw_Terminal_01x03" V 423 -2138 50  0001 R CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x03_P5.00mm_45-Degree" H 550 -1950 50  0001 C CNN
F 3 "~" H 550 -1950 50  0001 C CNN
	1    550  -1950
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 G_G#_A2
U 1 1 5F79DF3B
P 250 -1950
F 0 "G_G#_A2" V 350 -1800 50  0000 R CNN
F 1 "Screw_Terminal_01x03" V 123 -2138 50  0001 R CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x03_P5.00mm_45-Degree" H 250 -1950 50  0001 C CNN
F 3 "~" H 250 -1950 50  0001 C CNN
	1    250  -1950
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 E_F_F#2
U 1 1 5F79F279
P -50 -1950
F 0 "E_F_F#2" V 50  -1850 50  0000 R CNN
F 1 "Screw_Terminal_01x03" V -177 -2138 50  0001 R CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x03_P5.00mm_45-Degree" H -50 -1950 50  0001 C CNN
F 3 "~" H -50 -1950 50  0001 C CNN
	1    -50  -1950
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 C#_D_D#2
U 1 1 5F79FC96
P -350 -1950
F 0 "C#_D_D#2" V -250 -1800 50  0000 R CNN
F 1 "Screw_Terminal_01x03" V -477 -2138 50  0001 R CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x03_P5.00mm_45-Degree" H -350 -1950 50  0001 C CNN
F 3 "~" H -350 -1950 50  0001 C CNN
	1    -350 -1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1750 -700 1750 -1700
Connection ~ 3400 -1000
Wire Wire Line
	3400 -1000 3400 -700
Connection ~ 3950 -1050
Wire Wire Line
	3950 -1050 3950 -2000
Connection ~ 4500 -1100
Wire Wire Line
	4500 -1100 4500 -700
Connection ~ 5050 -1150
Wire Wire Line
	5050 -1150 5050 -2000
Connection ~ 5750 -1200
Wire Wire Line
	5750 -1200 5750 -2000
Connection ~ 6300 -1250
Wire Wire Line
	6300 -1250 6300 -2000
Connection ~ 6850 -1300
Wire Wire Line
	6850 -1300 6850 -700
Connection ~ 7400 -1350
Wire Wire Line
	7400 -1350 7400 -2000
Connection ~ 7950 -1400
Wire Wire Line
	7950 -1400 7950 -700
Connection ~ 8500 -1450
Wire Wire Line
	8500 -1450 8500 -2000
Connection ~ 9050 -1500
Wire Wire Line
	9050 -1500 9050 -700
Connection ~ 9600 -1550
Wire Wire Line
	9600 -1550 9600 -2000
Wire Wire Line
	650  -1550 650  -1750
Wire Wire Line
	-700 -1550 -700 -1750
Wire Wire Line
	-2050 -1550 -2050 -1750
Wire Wire Line
	-2050 -1550 -700 -1550
Connection ~ -700 -1550
Connection ~ 650  -1550
Wire Wire Line
	650  -1550 9600 -1550
Wire Wire Line
	550  -1500 550  -1750
Wire Wire Line
	550  -1500 9050 -1500
Wire Wire Line
	550  -1500 -800 -1500
Wire Wire Line
	-800 -1500 -800 -1750
Connection ~ 550  -1500
Wire Wire Line
	-800 -1500 -2150 -1500
Wire Wire Line
	-2150 -1500 -2150 -1750
Connection ~ -800 -1500
Wire Wire Line
	450  -1450 450  -1750
Wire Wire Line
	450  -1450 8500 -1450
Wire Wire Line
	450  -1450 -900 -1450
Wire Wire Line
	-900 -1450 -900 -1750
Connection ~ 450  -1450
Wire Wire Line
	-900 -1450 -2250 -1450
Wire Wire Line
	-2250 -1450 -2250 -1750
Connection ~ -900 -1450
Wire Wire Line
	350  -1400 350  -1750
Wire Wire Line
	350  -1400 7950 -1400
Wire Wire Line
	350  -1400 -1000 -1400
Wire Wire Line
	-1000 -1400 -1000 -1750
Connection ~ 350  -1400
Wire Wire Line
	-1000 -1400 -2350 -1400
Wire Wire Line
	-2350 -1400 -2350 -1750
Connection ~ -1000 -1400
Wire Wire Line
	-2050 -1550 -2950 -1550
Wire Wire Line
	-2950 -1550 -2950 -1750
Connection ~ -2050 -1550
$Comp
L Connector:Screw_Terminal_01x03 Bb_B_C2
U 1 1 5F8E9B6E
P -800 -1950
F 0 "Bb_B_C2" V -700 -1800 50  0000 R CNN
F 1 "Screw_Terminal_01x03" V -927 -2138 50  0001 R CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x03_P5.00mm_45-Degree" H -800 -1950 50  0001 C CNN
F 3 "~" H -800 -1950 50  0001 C CNN
	1    -800 -1950
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 G_G#_A1
U 1 1 5F8E9B74
P -1100 -1950
F 0 "G_G#_A1" V -1000 -1800 50  0000 R CNN
F 1 "Screw_Terminal_01x03" V -1227 -2138 50  0001 R CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x03_P5.00mm_45-Degree" H -1100 -1950 50  0001 C CNN
F 3 "~" H -1100 -1950 50  0001 C CNN
	1    -1100 -1950
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 E_F_F#1
U 1 1 5F8E9B7A
P -1400 -1950
F 0 "E_F_F#1" V -1300 -1850 50  0000 R CNN
F 1 "Screw_Terminal_01x03" V -1527 -2138 50  0001 R CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x03_P5.00mm_45-Degree" H -1400 -1950 50  0001 C CNN
F 3 "~" H -1400 -1950 50  0001 C CNN
	1    -1400 -1950
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 C#_D_D#1
U 1 1 5F8E9B80
P -1700 -1950
F 0 "C#_D_D#1" V -1600 -1800 50  0000 R CNN
F 1 "Screw_Terminal_01x03" V -1827 -2138 50  0001 R CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x03_P5.00mm_45-Degree" H -1700 -1950 50  0001 C CNN
F 3 "~" H -1700 -1950 50  0001 C CNN
	1    -1700 -1950
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 Bb_B_C1
U 1 1 5F8F8DC6
P -2150 -1950
F 0 "Bb_B_C1" V -2050 -1800 50  0000 R CNN
F 1 "Screw_Terminal_01x03" V -2277 -2138 50  0001 R CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x03_P5.00mm_45-Degree" H -2150 -1950 50  0001 C CNN
F 3 "~" H -2150 -1950 50  0001 C CNN
	1    -2150 -1950
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 F#_G_A1
U 1 1 5F8F8DCC
P -2450 -1950
F 0 "F#_G_A1" V -2350 -1800 50  0000 R CNN
F 1 "Screw_Terminal_01x03" V -2577 -2138 50  0001 R CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x03_P5.00mm_45-Degree" H -2450 -1950 50  0001 C CNN
F 3 "~" H -2450 -1950 50  0001 C CNN
	1    -2450 -1950
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 D_E_F1
U 1 1 5F8F8DD2
P -2750 -1950
F 0 "D_E_F1" V -2650 -1850 50  0000 R CNN
F 1 "Screw_Terminal_01x03" V -2877 -2138 50  0001 R CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x03_P5.00mm_45-Degree" H -2750 -1950 50  0001 C CNN
F 3 "~" H -2750 -1950 50  0001 C CNN
	1    -2750 -1950
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 F_G_C1
U 1 1 5F8F8DD8
P -3050 -1950
F 0 "F_G_C1" V -2950 -1800 50  0000 R CNN
F 1 "Screw_Terminal_01x03" V -3177 -2138 50  0001 R CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x03_P5.00mm_45-Degree" H -3050 -1950 50  0001 C CNN
F 3 "~" H -3050 -1950 50  0001 C CNN
	1    -3050 -1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	-700 -1550 650  -1550
Wire Wire Line
	250  -1350 250  -1750
Wire Wire Line
	250  -1350 7400 -1350
Wire Wire Line
	250  -1350 -1100 -1350
Wire Wire Line
	-1100 -1350 -1100 -1750
Connection ~ 250  -1350
Wire Wire Line
	150  -1300 150  -1750
Wire Wire Line
	150  -1300 6850 -1300
Wire Wire Line
	150  -1300 -1200 -1300
Wire Wire Line
	-1200 -1300 -1200 -1750
Connection ~ 150  -1300
Wire Wire Line
	-1200 -1300 -2450 -1300
Wire Wire Line
	-2450 -1300 -2450 -1750
Connection ~ -1200 -1300
Wire Wire Line
	-2450 -1300 -3050 -1300
Wire Wire Line
	-3050 -1300 -3050 -1750
Connection ~ -2450 -1300
Wire Wire Line
	50   -1250 50   -1750
Wire Wire Line
	50   -1250 6300 -1250
Wire Wire Line
	50   -1250 -1300 -1250
Wire Wire Line
	-1300 -1250 -1300 -1750
Connection ~ 50   -1250
Wire Wire Line
	-1300 -1250 -2550 -1250
Wire Wire Line
	-2550 -1250 -2550 -1750
Connection ~ -1300 -1250
Wire Wire Line
	-50  -1200 -50  -1750
Wire Wire Line
	-50  -1200 5750 -1200
Wire Wire Line
	-50  -1200 -1400 -1200
Wire Wire Line
	-1400 -1200 -1400 -1750
Connection ~ -50  -1200
Wire Wire Line
	-1400 -1200 -2650 -1200
Wire Wire Line
	-2650 -1200 -2650 -1750
Connection ~ -1400 -1200
Wire Wire Line
	-2650 -1200 -3150 -1200
Wire Wire Line
	-3150 -1200 -3150 -1750
Connection ~ -2650 -1200
Wire Wire Line
	-150 -1150 -150 -1750
Wire Wire Line
	-150 -1150 5050 -1150
Wire Wire Line
	-150 -1150 -1500 -1150
Wire Wire Line
	-1500 -1150 -1500 -1750
Connection ~ -150 -1150
Wire Wire Line
	-1500 -1150 -2750 -1150
Wire Wire Line
	-2750 -1150 -2750 -1750
Connection ~ -1500 -1150
Wire Wire Line
	-250 -1100 -250 -1750
Wire Wire Line
	-250 -1100 4500 -1100
Wire Wire Line
	-250 -1100 -1600 -1100
Wire Wire Line
	-1600 -1100 -1600 -1750
Connection ~ -250 -1100
Wire Wire Line
	-350 -1050 -350 -1750
Wire Wire Line
	-350 -1050 3950 -1050
Wire Wire Line
	-350 -1050 -1700 -1050
Wire Wire Line
	-1700 -1050 -1700 -1750
Connection ~ -350 -1050
Wire Wire Line
	-1700 -1050 -2850 -1050
Wire Wire Line
	-2850 -1050 -2850 -1750
Connection ~ -1700 -1050
Wire Wire Line
	-450 -1000 -450 -1750
Wire Wire Line
	-450 -1000 3400 -1000
Wire Wire Line
	-450 -1000 -1800 -1000
Wire Wire Line
	-1800 -1000 -1800 -1750
Connection ~ -450 -1000
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 5FAAE783
P 1400 -1900
F 0 "J2" V 1318 -2088 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 1273 -2088 50  0001 R CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x02_P5.00mm_45-Degree" H 1400 -1900 50  0001 C CNN
F 3 "~" H 1400 -1900 50  0001 C CNN
	1    1400 -1900
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 5FAB08B8
P 2500 -1900
F 0 "J3" V 2418 -2088 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 2373 -2088 50  0001 R CNN
F 2 "TerminalBlock_Altech:Altech_AK300_1x02_P5.00mm_45-Degree" H 2500 -1900 50  0001 C CNN
F 3 "~" H 2500 -1900 50  0001 C CNN
	1    2500 -1900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1200 -1700 1400 -1700
Connection ~ 1200 -1700
Wire Wire Line
	1200 -1700 1200 -2000
Wire Wire Line
	1500 -1700 1750 -1700
Connection ~ 1750 -1700
Wire Wire Line
	1750 -1700 1750 -2000
Wire Wire Line
	2300 -1700 2500 -1700
Connection ~ 2300 -1700
Wire Wire Line
	2300 -1700 2300 -700
Wire Wire Line
	2600 -1700 2850 -1700
Connection ~ 2850 -1700
Wire Wire Line
	2850 -1700 2850 -2000
$Comp
L Transistor_FET:2N7002K Q16
U 1 1 5FB2BC96
P 9800 -600
F 0 "Q16" V 10142 -600 50  0000 C CNN
F 1 "2N7002K" V 10051 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 10000 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 9800 -600 50  0001 L CNN
	1    9800 -600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002K Q15
U 1 1 5FB42577
P 9250 -600
F 0 "Q15" V 9592 -600 50  0000 C CNN
F 1 "2N7002K" V 9501 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 9450 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 9250 -600 50  0001 L CNN
	1    9250 -600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002K Q14
U 1 1 5FB44839
P 8700 -600
F 0 "Q14" V 9042 -600 50  0000 C CNN
F 1 "2N7002K" V 8951 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 8900 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 8700 -600 50  0001 L CNN
	1    8700 -600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002K Q13
U 1 1 5FB466F9
P 8150 -600
F 0 "Q13" V 8492 -600 50  0000 C CNN
F 1 "2N7002K" V 8401 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 8350 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 8150 -600 50  0001 L CNN
	1    8150 -600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002K Q12
U 1 1 5FB66A5A
P 7600 -600
F 0 "Q12" V 7942 -600 50  0000 C CNN
F 1 "2N7002K" V 7851 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 7800 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 7600 -600 50  0001 L CNN
	1    7600 -600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002K Q11
U 1 1 5FB681C1
P 7050 -600
F 0 "Q11" V 7392 -600 50  0000 C CNN
F 1 "2N7002K" V 7301 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 7250 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 7050 -600 50  0001 L CNN
	1    7050 -600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002K Q10
U 1 1 5FB6A8C8
P 6500 -600
F 0 "Q10" V 6842 -600 50  0000 C CNN
F 1 "2N7002K" V 6751 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 6700 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 6500 -600 50  0001 L CNN
	1    6500 -600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002K Q9
U 1 1 5FB6C8DE
P 5950 -600
F 0 "Q9" V 6292 -600 50  0000 C CNN
F 1 "2N7002K" V 6201 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 6150 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 5950 -600 50  0001 L CNN
	1    5950 -600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002K Q8
U 1 1 5FB6F3B0
P 5250 -600
F 0 "Q8" V 5592 -600 50  0000 C CNN
F 1 "2N7002K" V 5501 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 5450 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 5250 -600 50  0001 L CNN
	1    5250 -600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002K Q7
U 1 1 5FB71672
P 4700 -600
F 0 "Q7" V 5042 -600 50  0000 C CNN
F 1 "2N7002K" V 4951 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 4900 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 4700 -600 50  0001 L CNN
	1    4700 -600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002K Q6
U 1 1 5FB73085
P 4150 -600
F 0 "Q6" V 4492 -600 50  0000 C CNN
F 1 "2N7002K" V 4401 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 4350 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 4150 -600 50  0001 L CNN
	1    4150 -600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002K Q5
U 1 1 5FB74DEF
P 3600 -600
F 0 "Q5" V 3942 -600 50  0000 C CNN
F 1 "2N7002K" V 3851 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 3800 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 3600 -600 50  0001 L CNN
	1    3600 -600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002K Q4
U 1 1 5FB76D5A
P 3050 -600
F 0 "Q4" V 3392 -600 50  0000 C CNN
F 1 "2N7002K" V 3301 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 3250 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 3050 -600 50  0001 L CNN
	1    3050 -600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002K Q3
U 1 1 5FB79B77
P 2500 -600
F 0 "Q3" V 2842 -600 50  0000 C CNN
F 1 "2N7002K" V 2751 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 2700 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 2500 -600 50  0001 L CNN
	1    2500 -600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002K Q2
U 1 1 5FB7BC38
P 1950 -600
F 0 "Q2" V 2292 -600 50  0000 C CNN
F 1 "2N7002K" V 2201 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 2150 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 1950 -600 50  0001 L CNN
	1    1950 -600
	0    1    -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002K Q1
U 1 1 5FB7E2FC
P 1400 -600
F 0 "Q1" V 1742 -600 50  0000 C CNN
F 1 "2N7002K" V 1651 -600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:ATPAK-2" H 1600 -675 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 1400 -600 50  0001 L CNN
	1    1400 -600
	0    1    -1   0   
$EndComp
Wire Wire Line
	9900 1250 9900 1450
Connection ~ 9900 1450
Wire Wire Line
	9900 1450 9900 2050
Wire Wire Line
	10500 1450 10500 -2300
Wire Wire Line
	9600 -2300 9650 -2300
Wire Wire Line
	9900 1450 10500 1450
Wire Wire Line
	3400 -2300 3650 -2300
Connection ~ 3400 -2300
Wire Wire Line
	3100 -2300 3400 -2300
Connection ~ 3100 -2300
$Comp
L Connector:Conn_01x01_Male J7
U 1 1 5F6F72AF
P 3100 -2500
F 0 "J7" V 3162 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 3253 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 3100 -2500 50  0001 C CNN
F 3 "~" H 3100 -2500 50  0001 C CNN
	1    3100 -2500
	0    1    1    0   
$EndComp
Wire Wire Line
	2550 -2300 2850 -2300
Connection ~ 2550 -2300
$Comp
L Connector:Conn_01x01_Male J6
U 1 1 5F6F6A9D
P 2550 -2500
F 0 "J6" V 2612 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 2703 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 2550 -2500 50  0001 C CNN
F 3 "~" H 2550 -2500 50  0001 C CNN
	1    2550 -2500
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 -2300 2300 -2300
Connection ~ 2000 -2300
$Comp
L Connector:Conn_01x01_Male J5
U 1 1 5F6F66BA
P 2000 -2500
F 0 "J5" V 2062 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 2153 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 2000 -2500 50  0001 C CNN
F 3 "~" H 2000 -2500 50  0001 C CNN
	1    2000 -2500
	0    1    1    0   
$EndComp
Wire Wire Line
	1450 -2300 1750 -2300
Connection ~ 1450 -2300
$Comp
L Connector:Conn_01x01_Male J4
U 1 1 5F6F33CC
P 1450 -2500
F 0 "J4" V 1512 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 1603 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 1450 -2500 50  0001 C CNN
F 3 "~" H 1450 -2500 50  0001 C CNN
	1    1450 -2500
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 -2300 2550 -2300
Connection ~ 2300 -2300
Wire Wire Line
	1750 -2300 2000 -2300
Wire Wire Line
	1200 -2300 1450 -2300
Connection ~ 1750 -2300
$Comp
L Device:D D1
U 1 1 5F883F8E
P 1200 -2150
F 0 "D1" V 1154 -2070 50  0000 L CNN
F 1 "D" V 1245 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 1200 -2150 50  0001 C CNN
F 3 "~" H 1200 -2150 50  0001 C CNN
	1    1200 -2150
	0    1    1    0   
$EndComp
$Comp
L Device:D D2
U 1 1 5F883F88
P 1750 -2150
F 0 "D2" V 1704 -2070 50  0000 L CNN
F 1 "D" V 1795 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 1750 -2150 50  0001 C CNN
F 3 "~" H 1750 -2150 50  0001 C CNN
	1    1750 -2150
	0    1    1    0   
$EndComp
Wire Wire Line
	2850 -2300 3100 -2300
Connection ~ 2850 -2300
$Comp
L Device:D D3
U 1 1 5F883F7F
P 2300 -2150
F 0 "D3" V 2254 -2070 50  0000 L CNN
F 1 "D" V 2345 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 2300 -2150 50  0001 C CNN
F 3 "~" H 2300 -2150 50  0001 C CNN
	1    2300 -2150
	0    1    1    0   
$EndComp
$Comp
L Device:D D4
U 1 1 5F883F6D
P 2850 -2150
F 0 "D4" V 2804 -2070 50  0000 L CNN
F 1 "D" V 2895 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 2850 -2150 50  0001 C CNN
F 3 "~" H 2850 -2150 50  0001 C CNN
	1    2850 -2150
	0    1    1    0   
$EndComp
$Comp
L Device:D D5
U 1 1 5F883F67
P 3400 -2150
F 0 "D5" V 3354 -2070 50  0000 L CNN
F 1 "D" V 3445 -2070 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P5.08mm_Vertical_AnodeUp" H 3400 -2150 50  0001 C CNN
F 3 "~" H 3400 -2150 50  0001 C CNN
	1    3400 -2150
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J11
U 1 1 5F715191
P 5300 -2500
F 0 "J11" V 5362 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 5453 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 5300 -2500 50  0001 C CNN
F 3 "~" H 5300 -2500 50  0001 C CNN
	1    5300 -2500
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J10
U 1 1 5F715197
P 4750 -2500
F 0 "J10" V 4812 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 4903 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 4750 -2500 50  0001 C CNN
F 3 "~" H 4750 -2500 50  0001 C CNN
	1    4750 -2500
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J9
U 1 1 5F71519D
P 4200 -2500
F 0 "J9" V 4262 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 4353 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 4200 -2500 50  0001 C CNN
F 3 "~" H 4200 -2500 50  0001 C CNN
	1    4200 -2500
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J8
U 1 1 5F7151A3
P 3650 -2500
F 0 "J8" V 3712 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 3803 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 3650 -2500 50  0001 C CNN
F 3 "~" H 3650 -2500 50  0001 C CNN
	1    3650 -2500
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J15
U 1 1 5F72B15B
P 7700 -2500
F 0 "J15" V 7762 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 7853 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 7700 -2500 50  0001 C CNN
F 3 "~" H 7700 -2500 50  0001 C CNN
	1    7700 -2500
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J14
U 1 1 5F72B161
P 7150 -2500
F 0 "J14" V 7212 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 7303 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 7150 -2500 50  0001 C CNN
F 3 "~" H 7150 -2500 50  0001 C CNN
	1    7150 -2500
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J13
U 1 1 5F72B167
P 6600 -2500
F 0 "J13" V 6662 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 6753 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 6600 -2500 50  0001 C CNN
F 3 "~" H 6600 -2500 50  0001 C CNN
	1    6600 -2500
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J12
U 1 1 5F72B16D
P 6050 -2500
F 0 "J12" V 6112 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 6203 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 6050 -2500 50  0001 C CNN
F 3 "~" H 6050 -2500 50  0001 C CNN
	1    6050 -2500
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J19
U 1 1 5F740DF1
P 9850 -2500
F 0 "J19" V 9912 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 10003 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9850 -2500 50  0001 C CNN
F 3 "~" H 9850 -2500 50  0001 C CNN
	1    9850 -2500
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J18
U 1 1 5F740DF7
P 9300 -2500
F 0 "J18" V 9362 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 9453 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9300 -2500 50  0001 C CNN
F 3 "~" H 9300 -2500 50  0001 C CNN
	1    9300 -2500
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J17
U 1 1 5F740DFD
P 8750 -2500
F 0 "J17" V 8812 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 8903 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 8750 -2500 50  0001 C CNN
F 3 "~" H 8750 -2500 50  0001 C CNN
	1    8750 -2500
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J16
U 1 1 5F740E03
P 8200 -2500
F 0 "J16" V 8262 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 8353 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 8200 -2500 50  0001 C CNN
F 3 "~" H 8200 -2500 50  0001 C CNN
	1    8200 -2500
	0    1    1    0   
$EndComp
Connection ~ 3650 -2300
Wire Wire Line
	3650 -2300 3950 -2300
Connection ~ 4200 -2300
Wire Wire Line
	4200 -2300 4500 -2300
Connection ~ 4750 -2300
Wire Wire Line
	4750 -2300 5050 -2300
Connection ~ 5300 -2300
Wire Wire Line
	5300 -2300 5750 -2300
Connection ~ 6050 -2300
Wire Wire Line
	6050 -2300 6300 -2300
Connection ~ 6600 -2300
Wire Wire Line
	6600 -2300 6850 -2300
Connection ~ 7150 -2300
Wire Wire Line
	7150 -2300 7400 -2300
Connection ~ 7700 -2300
Wire Wire Line
	7700 -2300 7950 -2300
Connection ~ 8200 -2300
Wire Wire Line
	8200 -2300 8500 -2300
Connection ~ 8750 -2300
Wire Wire Line
	8750 -2300 8800 -2300
Connection ~ 9300 -2300
Wire Wire Line
	9300 -2300 9350 -2300
Connection ~ 9850 -2300
Wire Wire Line
	9850 -2300 9900 -2300
$Comp
L Connector:Conn_01x01_Male J35
U 1 1 5F61C517
P 9900 -2500
F 0 "J35" V 9962 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 10053 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9900 -2500 50  0001 C CNN
F 3 "~" H 9900 -2500 50  0001 C CNN
	1    9900 -2500
	0    1    1    0   
$EndComp
Connection ~ 9900 -2300
Wire Wire Line
	9900 -2300 9950 -2300
$Comp
L Connector:Conn_01x01_Male J36
U 1 1 5F61C7AA
P 9950 -2500
F 0 "J36" V 10012 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 10103 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9950 -2500 50  0001 C CNN
F 3 "~" H 9950 -2500 50  0001 C CNN
	1    9950 -2500
	0    1    1    0   
$EndComp
Connection ~ 9950 -2300
Wire Wire Line
	9950 -2300 10000 -2300
$Comp
L Connector:Conn_01x01_Male J37
U 1 1 5F61CA13
P 10000 -2500
F 0 "J37" V 10062 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 10153 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 10000 -2500 50  0001 C CNN
F 3 "~" H 10000 -2500 50  0001 C CNN
	1    10000 -2500
	0    1    1    0   
$EndComp
Connection ~ 10000 -2300
Wire Wire Line
	10000 -2300 10050 -2300
$Comp
L Connector:Conn_01x01_Male J38
U 1 1 5F61CB95
P 10050 -2500
F 0 "J38" V 10112 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 10203 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 10050 -2500 50  0001 C CNN
F 3 "~" H 10050 -2500 50  0001 C CNN
	1    10050 -2500
	0    1    1    0   
$EndComp
Connection ~ 10050 -2300
Wire Wire Line
	10050 -2300 10100 -2300
$Comp
L Connector:Conn_01x01_Male J39
U 1 1 5F61CDFE
P 10100 -2500
F 0 "J39" V 10162 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 10253 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 10100 -2500 50  0001 C CNN
F 3 "~" H 10100 -2500 50  0001 C CNN
	1    10100 -2500
	0    1    1    0   
$EndComp
Connection ~ 10100 -2300
Wire Wire Line
	10100 -2300 10150 -2300
$Comp
L Connector:Conn_01x01_Male J40
U 1 1 5F61CF80
P 10150 -2500
F 0 "J40" V 10212 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 10303 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 10150 -2500 50  0001 C CNN
F 3 "~" H 10150 -2500 50  0001 C CNN
	1    10150 -2500
	0    1    1    0   
$EndComp
Connection ~ 10150 -2300
Wire Wire Line
	10150 -2300 10200 -2300
$Comp
L Connector:Conn_01x01_Male J41
U 1 1 5F61D195
P 10200 -2500
F 0 "J41" V 10262 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 10353 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 10200 -2500 50  0001 C CNN
F 3 "~" H 10200 -2500 50  0001 C CNN
	1    10200 -2500
	0    1    1    0   
$EndComp
Connection ~ 10200 -2300
Wire Wire Line
	10200 -2300 10250 -2300
$Comp
L Connector:Conn_01x01_Male J42
U 1 1 5F61D2ED
P 10250 -2500
F 0 "J42" V 10312 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 10403 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 10250 -2500 50  0001 C CNN
F 3 "~" H 10250 -2500 50  0001 C CNN
	1    10250 -2500
	0    1    1    0   
$EndComp
Connection ~ 10250 -2300
Wire Wire Line
	10250 -2300 10300 -2300
$Comp
L Connector:Conn_01x01_Male J43
U 1 1 5F61D45A
P 10300 -2500
F 0 "J43" V 10362 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 10453 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 10300 -2500 50  0001 C CNN
F 3 "~" H 10300 -2500 50  0001 C CNN
	1    10300 -2500
	0    1    1    0   
$EndComp
Connection ~ 10300 -2300
Wire Wire Line
	10300 -2300 10350 -2300
$Comp
L Connector:Conn_01x01_Male J44
U 1 1 5F61D588
P 10350 -2500
F 0 "J44" V 10412 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 10503 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 10350 -2500 50  0001 C CNN
F 3 "~" H 10350 -2500 50  0001 C CNN
	1    10350 -2500
	0    1    1    0   
$EndComp
Connection ~ 10350 -2300
Wire Wire Line
	10350 -2300 10400 -2300
$Comp
L Connector:Conn_01x01_Male J45
U 1 1 5F61D6E0
P 10400 -2500
F 0 "J45" V 10462 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 10553 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 10400 -2500 50  0001 C CNN
F 3 "~" H 10400 -2500 50  0001 C CNN
	1    10400 -2500
	0    1    1    0   
$EndComp
Connection ~ 10400 -2300
Wire Wire Line
	10400 -2300 10450 -2300
$Comp
L Connector:Conn_01x01_Male J46
U 1 1 5F61D8CB
P 10450 -2500
F 0 "J46" V 10512 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 10603 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 10450 -2500 50  0001 C CNN
F 3 "~" H 10450 -2500 50  0001 C CNN
	1    10450 -2500
	0    1    1    0   
$EndComp
Connection ~ 10450 -2300
Wire Wire Line
	10450 -2300 10500 -2300
$Comp
L Connector:Conn_01x01_Male J27
U 1 1 5F61DAA1
P 9350 -2500
F 0 "J27" V 9412 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 9503 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9350 -2500 50  0001 C CNN
F 3 "~" H 9350 -2500 50  0001 C CNN
	1    9350 -2500
	0    1    1    0   
$EndComp
Connection ~ 9350 -2300
Wire Wire Line
	9350 -2300 9400 -2300
$Comp
L Connector:Conn_01x01_Male J28
U 1 1 5F61DF02
P 9400 -2500
F 0 "J28" V 9462 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 9553 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9400 -2500 50  0001 C CNN
F 3 "~" H 9400 -2500 50  0001 C CNN
	1    9400 -2500
	0    1    1    0   
$EndComp
Connection ~ 9400 -2300
Wire Wire Line
	9400 -2300 9450 -2300
$Comp
L Connector:Conn_01x01_Male J29
U 1 1 5F61E05A
P 9450 -2500
F 0 "J29" V 9512 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 9603 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9450 -2500 50  0001 C CNN
F 3 "~" H 9450 -2500 50  0001 C CNN
	1    9450 -2500
	0    1    1    0   
$EndComp
Connection ~ 9450 -2300
Wire Wire Line
	9450 -2300 9500 -2300
$Comp
L Connector:Conn_01x01_Male J30
U 1 1 5F61E1DC
P 9500 -2500
F 0 "J30" V 9562 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 9653 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9500 -2500 50  0001 C CNN
F 3 "~" H 9500 -2500 50  0001 C CNN
	1    9500 -2500
	0    1    1    0   
$EndComp
Connection ~ 9500 -2300
Wire Wire Line
	9500 -2300 9600 -2300
$Comp
L Connector:Conn_01x01_Male J26
U 1 1 5F61E46F
P 9250 -2500
F 0 "J26" V 9312 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 9403 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9250 -2500 50  0001 C CNN
F 3 "~" H 9250 -2500 50  0001 C CNN
	1    9250 -2500
	0    1    1    0   
$EndComp
Connection ~ 9250 -2300
Wire Wire Line
	9250 -2300 9300 -2300
$Comp
L Connector:Conn_01x01_Male J31
U 1 1 5F61E828
P 9650 -2500
F 0 "J31" V 9712 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 9803 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9650 -2500 50  0001 C CNN
F 3 "~" H 9650 -2500 50  0001 C CNN
	1    9650 -2500
	0    1    1    0   
$EndComp
Connection ~ 9650 -2300
Wire Wire Line
	9650 -2300 9700 -2300
$Comp
L Connector:Conn_01x01_Male J32
U 1 1 5F61F025
P 9700 -2500
F 0 "J32" V 9762 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 9853 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9700 -2500 50  0001 C CNN
F 3 "~" H 9700 -2500 50  0001 C CNN
	1    9700 -2500
	0    1    1    0   
$EndComp
Connection ~ 9700 -2300
Wire Wire Line
	9700 -2300 9750 -2300
$Comp
L Connector:Conn_01x01_Male J33
U 1 1 5F61F264
P 9750 -2500
F 0 "J33" V 9812 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 9903 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9750 -2500 50  0001 C CNN
F 3 "~" H 9750 -2500 50  0001 C CNN
	1    9750 -2500
	0    1    1    0   
$EndComp
Connection ~ 9750 -2300
Wire Wire Line
	9750 -2300 9800 -2300
$Comp
L Connector:Conn_01x01_Male J34
U 1 1 5F61F3D1
P 9800 -2500
F 0 "J34" V 9862 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 9953 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9800 -2500 50  0001 C CNN
F 3 "~" H 9800 -2500 50  0001 C CNN
	1    9800 -2500
	0    1    1    0   
$EndComp
Connection ~ 9800 -2300
Wire Wire Line
	9800 -2300 9850 -2300
$Comp
L Connector:Conn_01x01_Male J20
U 1 1 5F61F529
P 8800 -2500
F 0 "J20" V 8862 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 8953 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 8800 -2500 50  0001 C CNN
F 3 "~" H 8800 -2500 50  0001 C CNN
	1    8800 -2500
	0    1    1    0   
$EndComp
Connection ~ 8800 -2300
Wire Wire Line
	8800 -2300 8850 -2300
$Comp
L Connector:Conn_01x01_Male J21
U 1 1 5F61F7BC
P 8850 -2500
F 0 "J21" V 8912 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 9003 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 8850 -2500 50  0001 C CNN
F 3 "~" H 8850 -2500 50  0001 C CNN
	1    8850 -2500
	0    1    1    0   
$EndComp
Connection ~ 8850 -2300
Wire Wire Line
	8850 -2300 8900 -2300
$Comp
L Connector:Conn_01x01_Male J22
U 1 1 5F61F9BC
P 8900 -2500
F 0 "J22" V 8962 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 9053 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 8900 -2500 50  0001 C CNN
F 3 "~" H 8900 -2500 50  0001 C CNN
	1    8900 -2500
	0    1    1    0   
$EndComp
Connection ~ 8900 -2300
Wire Wire Line
	8900 -2300 8950 -2300
$Comp
L Connector:Conn_01x01_Male J23
U 1 1 5F61FB14
P 8950 -2500
F 0 "J23" V 9012 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 9103 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 8950 -2500 50  0001 C CNN
F 3 "~" H 8950 -2500 50  0001 C CNN
	1    8950 -2500
	0    1    1    0   
$EndComp
Connection ~ 8950 -2300
Wire Wire Line
	8950 -2300 9000 -2300
$Comp
L Connector:Conn_01x01_Male J24
U 1 1 5F61FCEA
P 9000 -2500
F 0 "J24" V 9062 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 9153 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9000 -2500 50  0001 C CNN
F 3 "~" H 9000 -2500 50  0001 C CNN
	1    9000 -2500
	0    1    1    0   
$EndComp
Connection ~ 9000 -2300
Wire Wire Line
	9000 -2300 9050 -2300
$Comp
L Connector:Conn_01x01_Male J25
U 1 1 5F61FE57
P 9100 -2500
F 0 "J25" V 9162 -2456 50  0000 L CNN
F 1 "Conn_01x01_Male" V 9253 -2456 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 9100 -2500 50  0001 C CNN
F 3 "~" H 9100 -2500 50  0001 C CNN
	1    9100 -2500
	0    1    1    0   
$EndComp
Connection ~ 9100 -2300
Wire Wire Line
	9100 -2300 9250 -2300
$EndSCHEMATC
