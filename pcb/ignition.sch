EESchema Schematic File Version 4
LIBS:ignition-cache
EELAYER 26 0
EELAYER END
$Descr A3 16535 11693
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
L agg-kicad:CONN_01x03 J?
U 1 1 5BCDF963
P 750 1050
F 0 "J?" H 750 1150 50  0000 C CNN
F 1 "PSU" H 750 750 50  0000 C CNN
F 2 "agg:S03B-PASK-2" H 750 1050 50  0001 C CNN
F 3 "" H 750 1050 50  0001 C CNN
	1    750  1050
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:CONN_01x03 J?
U 1 1 5BCDFB05
P 1300 1050
F 0 "J?" H 1300 1150 50  0000 C CNN
F 1 "PSU" H 1300 750 50  0000 C CNN
F 2 "agg:S03B-PASK-2" H 1300 1050 50  0001 C CNN
F 3 "" H 1300 1050 50  0001 C CNN
	1    1300 1050
	1    0    0    -1  
$EndComp
$Comp
L voltages:24v_A #PWR?
U 1 1 5BCDFEF8
P 950 950
F 0 "#PWR?" H 950 1060 50  0001 L CNN
F 1 "24v_A" H 950 1050 50  0000 C CNN
F 2 "" H 950 950 50  0001 C CNN
F 3 "" H 950 950 50  0001 C CNN
	1    950  950 
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:GND #PWR?
U 1 1 5BCDFF79
P 1500 1350
F 0 "#PWR?" H 1370 1390 50  0001 L CNN
F 1 "GND" H 1500 1250 50  0000 C CNN
F 2 "" H 1500 1350 50  0001 C CNN
F 3 "" H 1500 1350 50  0001 C CNN
	1    1500 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  1050 950  1050
Wire Wire Line
	850  1150 950  1150
Wire Wire Line
	950  1150 950  1050
Connection ~ 950  1050
Wire Wire Line
	850  1250 950  1250
Wire Wire Line
	950  1250 950  1150
Connection ~ 950  1150
Wire Wire Line
	950  950  950  1050
Wire Wire Line
	1400 1250 1500 1250
Wire Wire Line
	1500 1250 1500 1350
Wire Wire Line
	1500 1250 1500 1150
Wire Wire Line
	1500 1150 1400 1150
Connection ~ 1500 1250
Wire Wire Line
	1500 1150 1500 1050
Wire Wire Line
	1500 1050 1400 1050
Connection ~ 1500 1150
Text Notes 1200 1800 0    50   ~ 0
Vin: 250 VAC @ 2.5A Max\nVout: 24 VDC @ 8.8A Max
$Comp
L agg-kicad:PART X?
U 1 1 5BCE0246
P 600 1750
F 0 "X?" H 650 1850 50  0000 L CNN
F 1 "PSU" H 650 1750 50  0000 L CNN
F 2 "" H 600 1750 50  0001 C CNN
F 3 "http://www.deltapsu.com/products/download/Datasheet/PMT-24V200W1AM" H 600 1750 50  0001 C CNN
F 4 "1145-1076-ND" H 600 1750 50  0001 C CNN "Digikey"
	1    600  1750
	1    0    0    -1  
$EndComp
Text Notes 550  700  0    79   ~ 16
Power Supply A:
$Comp
L agg-kicad:STM32F4xxVxTx IC?
U 1 1 5BCE094A
P 12800 5250
F 0 "IC?" H 12800 8475 50  0000 C CNN
F 1 "STM32F4xxVxTx" H 12800 8384 50  0000 C CNN
F 2 "agg:LQFP-100" H 12350 2050 50  0001 L CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf" H 12350 1950 50  0001 L CNN
F 4 "2215224" H 12350 1850 50  0001 L CNN "Farnell"
	1    12800 5250
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:LTC4151 IC?
U 1 1 5BCE1054
P 4550 3600
F 0 "IC?" H 4200 4100 50  0000 C CNN
F 1 "LTC4151" H 4300 3100 50  0000 C CNN
F 2 "agg:DFN-10-EP-LT" H 4150 3000 50  0001 L CNN
F 3 "https://cds.linear.com/docs/en/datasheet/4151ff.pdf" H 4150 2900 50  0001 L CNN
F 4 "2295457" H 4150 2800 50  0001 L CNN "Farnell"
	1    4550 3600
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:CONN_01x03 J?
U 1 1 5BCE120B
P 2600 1050
F 0 "J?" H 2600 1150 50  0000 C CNN
F 1 "PSU" H 2600 750 50  0000 C CNN
F 2 "agg:S03B-PASK-2" H 2600 1050 50  0001 C CNN
F 3 "" H 2600 1050 50  0001 C CNN
	1    2600 1050
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:CONN_01x03 J?
U 1 1 5BCE1211
P 3150 1050
F 0 "J?" H 3150 1150 50  0000 C CNN
F 1 "PSU" H 3150 750 50  0000 C CNN
F 2 "agg:S03B-PASK-2" H 3150 1050 50  0001 C CNN
F 3 "" H 3150 1050 50  0001 C CNN
	1    3150 1050
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:GND #PWR?
U 1 1 5BCE121D
P 3350 1350
F 0 "#PWR?" H 3220 1390 50  0001 L CNN
F 1 "GND" H 3350 1250 50  0000 C CNN
F 2 "" H 3350 1350 50  0001 C CNN
F 3 "" H 3350 1350 50  0001 C CNN
	1    3350 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 1050 2800 1050
Wire Wire Line
	2700 1150 2800 1150
Wire Wire Line
	2800 1150 2800 1050
Connection ~ 2800 1050
Wire Wire Line
	2700 1250 2800 1250
Wire Wire Line
	2800 1250 2800 1150
Connection ~ 2800 1150
Wire Wire Line
	2800 950  2800 1050
Wire Wire Line
	3250 1250 3350 1250
Wire Wire Line
	3350 1250 3350 1350
Wire Wire Line
	3350 1250 3350 1150
Wire Wire Line
	3350 1150 3250 1150
Connection ~ 3350 1250
Wire Wire Line
	3350 1150 3350 1050
Wire Wire Line
	3350 1050 3250 1050
Connection ~ 3350 1150
Text Notes 3050 1800 0    50   ~ 0
Vin: 250 VAC @ 2.5A Max\nVout: 24 VDC @ 8.8A Max
$Comp
L agg-kicad:PART X?
U 1 1 5BCE1235
P 2450 1750
F 0 "X?" H 2500 1850 50  0000 L CNN
F 1 "PSU" H 2500 1750 50  0000 L CNN
F 2 "" H 2450 1750 50  0001 C CNN
F 3 "http://www.deltapsu.com/products/download/Datasheet/PMT-24V200W1AM" H 2450 1750 50  0001 C CNN
F 4 "1145-1076-ND" H 2450 1750 50  0001 C CNN "Digikey"
	1    2450 1750
	1    0    0    -1  
$EndComp
Text Notes 2400 700  0    79   ~ 16
Power Supply B:
Wire Notes Line
	550  1900 4200 1900
Wire Notes Line
	4200 1900 4200 500 
Wire Notes Line
	2300 1850 2300 500 
$Comp
L voltages:24v_B #PWR?
U 1 1 5BCE176A
P 2800 950
F 0 "#PWR?" H 2800 1060 50  0001 L CNN
F 1 "24v_B" H 2800 1074 50  0000 C CNN
F 2 "" H 2800 950 50  0001 C CNN
F 3 "" H 2800 950 50  0001 C CNN
	1    2800 950 
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:GND #PWR?
U 1 1 5BCE1C32
P 3950 4150
F 0 "#PWR?" H 3820 4190 50  0001 L CNN
F 1 "GND" H 3950 4050 50  0000 C CNN
F 2 "" H 3950 4150 50  0001 C CNN
F 3 "" H 3950 4150 50  0001 C CNN
	1    3950 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3800 3950 3800
Wire Wire Line
	3950 3800 3950 4150
Wire Wire Line
	4050 3700 3950 3700
Wire Wire Line
	3950 3700 3950 3800
Connection ~ 3950 3800
Wire Wire Line
	4050 3500 3950 3500
Wire Wire Line
	3950 3500 3950 3700
Connection ~ 3950 3700
Wire Wire Line
	4050 3400 3950 3400
Wire Wire Line
	3950 3400 3950 3500
Connection ~ 3950 3500
$Comp
L relay_spst:RELAY_SPST K?
U 1 1 5BCE000C
P 2650 3350
F 0 "K?" H 2550 3700 50  0000 C CNN
F 1 "10A SPST" H 2650 3200 50  0000 C CNN
F 2 "" H 2650 3350 60  0000 C CNN
F 3 "http://www.farnell.com/datasheets/1558263.pdf" H 2650 3350 60  0001 C CNN
F 4 "1891768" H 2650 3350 50  0001 C CNN "Farnell"
	1    2650 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 3200 4050 3200
Wire Wire Line
	5050 3900 5300 3900
Wire Wire Line
	5300 3900 5300 4500
Wire Wire Line
	5300 4500 3100 4500
Wire Wire Line
	3100 4500 3100 3700
Wire Wire Line
	3100 3700 3350 3700
Wire Wire Line
	2250 3250 1850 3250
Wire Wire Line
	2250 3350 2150 3350
Wire Wire Line
	2150 3350 2150 3500
$Comp
L agg-kicad:GND #PWR?
U 1 1 5BCE2014
P 2150 3500
F 0 "#PWR?" H 2020 3540 50  0001 L CNN
F 1 "GND" H 2150 3400 50  0000 C CNN
F 2 "" H 2150 3500 50  0001 C CNN
F 3 "" H 2150 3500 50  0001 C CNN
	1    2150 3500
	1    0    0    -1  
$EndComp
$Comp
L voltages:24v_A #PWR?
U 1 1 5BCE23BC
P 2150 3000
F 0 "#PWR?" H 2150 3110 50  0001 L CNN
F 1 "24v_A" H 2150 3100 50  0000 C CNN
F 2 "" H 2150 3000 50  0001 C CNN
F 3 "" H 2150 3000 50  0001 C CNN
	1    2150 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3000 2150 3100
Wire Wire Line
	2150 3100 2250 3100
Text Notes 1900 2650 0    79   ~ 16
Arming Relay:
$EndSCHEMATC
