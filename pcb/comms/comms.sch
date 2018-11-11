EESchema Schematic File Version 4
LIBS:comms-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Communications Board"
Date "2018-11-11"
Rev "1"
Comp "Matthew Coates"
Comment1 "Hybrid Ignition Controller"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L agg-kicad:MAX14787E IC3
U 1 1 5BF09872
P 5475 4525
F 0 "IC3" H 5350 4825 50  0000 C CNN
F 1 "MAX14787E" H 5475 4225 50  0000 C CNN
F 2 "agg:SOIC-8" H 5275 4125 50  0001 L CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX14784E-MAX14789E.pdf" H 5275 4025 50  0001 L CNN
F 4 "2528531" H 5275 3925 50  0001 L CNN "Farnell"
	1    5475 4525
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:RJHSE-538x IC4
U 1 1 5BF09CD1
P 8050 4475
F 0 "IC4" H 7700 4975 50  0000 C CNN
F 1 "RJHSE-538x" H 7875 3975 50  0000 C CNN
F 2 "agg:RJHSE-538X" H 7650 3875 50  0001 L CNN
F 3 "http://www.farnell.com/cad/2167247.pdf" H 7650 3775 50  0001 L CNN
F 4 "1462758" H 7650 3675 50  0001 L CNN "Farnell"
	1    8050 4475
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:USB-A P1
U 1 1 5BF0A10C
P 4775 2950
F 0 "P1" H 4875 3250 50  0000 C CNN
F 1 "USB-B" H 4800 2650 50  0000 C CNN
F 2 "agg:USB-B-SKT" H 4375 2550 50  0001 L CNN
F 3 "http://www.farnell.com/datasheets/2642536.pdf" H 4375 2450 50  0001 L CNN
F 4 "1753809" H 4375 2350 50  0001 L CNN "Farnell"
	1    4775 2950
	-1   0    0    -1  
$EndComp
$Comp
L agg-kicad:R R1
U 1 1 5BEB6A2F
P 1625 3525
F 0 "R1" H 1675 3575 31  0000 C CNN
F 1 "100" H 1675 3475 31  0000 C CNN
F 2 "agg:0402" H 1625 3525 50  0001 C CNN
F 3 "" H 1625 3525 50  0001 C CNN
F 4 "9239111" H 1625 3525 31  0001 C CNN "Farnell"
	1    1625 3525
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:SMD_XTAL Y1
U 1 1 5BEB6A37
P 1325 3375
F 0 "Y1" H 1375 3465 39  0000 C CNN
F 1 "26M" H 1375 3225 39  0000 C CNN
F 2 "agg:XTAL-20x16" H 1375 3155 50  0001 C CNN
F 3 "" H 1325 3375 50  0001 C CNN
F 4 "2506952" H 1325 3375 60  0001 C CNN "Farnell"
	1    1325 3375
	0    1    1    0   
$EndComp
$Comp
L agg-kicad:C C2
U 1 1 5BEB6A3F
P 1075 3625
F 0 "C2" H 1125 3685 31  0000 C CNN
F 1 "10p" H 1125 3565 31  0000 C CNN
F 2 "agg:0402" H 1075 3625 50  0001 C CNN
F 3 "" H 1075 3625 50  0001 C CNN
F 4 "2496790" H 1075 3625 60  0001 C CNN "Farnell"
	1    1075 3625
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:C C1
U 1 1 5BEB6A47
P 1075 3225
F 0 "C1" H 1125 3285 31  0000 C CNN
F 1 "10p" H 1125 3165 31  0000 C CNN
F 2 "agg:0402" H 1075 3225 50  0001 C CNN
F 3 "" H 1075 3225 50  0001 C CNN
F 4 "2496790" H 1075 3225 60  0001 C CNN "Farnell"
	1    1075 3225
	1    0    0    -1  
$EndComp
Text Label 1725 3225 2    47   ~ 0
~RST
$Comp
L agg-kicad:GND #PWR05
U 1 1 5BEB6A4F
P 1625 2925
F 0 "#PWR05" H 1495 2965 50  0001 L CNN
F 1 "GND" H 1575 2825 39  0000 L CNN
F 2 "" H 1625 2925 60  0001 C CNN
F 3 "" H 1625 2925 60  0001 C CNN
	1    1625 2925
	0    1    1    0   
$EndComp
$Comp
L agg-kicad:C C13
U 1 1 5BEB6A56
P 1725 2225
F 0 "C13" H 1775 2165 31  0000 C CNN
F 1 "2u2" H 1775 2285 31  0000 C CNN
F 2 "agg:0402" H 1725 2225 50  0001 C CNN
F 3 "" H 1725 2225 50  0001 C CNN
F 4 "2362088" H 1725 2225 60  0001 C CNN "Farnell"
	1    1725 2225
	-1   0    0    1   
$EndComp
$Comp
L agg-kicad:C C12
U 1 1 5BEB6A5E
P 1575 2325
F 0 "C12" H 1625 2265 31  0000 C CNN
F 1 "2u2" H 1625 2385 31  0000 C CNN
F 2 "agg:0402" H 1575 2325 50  0001 C CNN
F 3 "" H 1575 2325 50  0001 C CNN
F 4 "2362088" H 1575 2325 60  0001 C CNN "Farnell"
	1    1575 2325
	-1   0    0    1   
$EndComp
$Comp
L agg-kicad:GND #PWR03
U 1 1 5BEB6A65
P 1425 2225
F 0 "#PWR03" H 1295 2265 50  0001 L CNN
F 1 "GND" H 1375 2125 39  0001 C CNN
F 2 "" H 1425 2225 60  0000 C CNN
F 3 "" H 1425 2225 60  0000 C CNN
	1    1425 2225
	0    1    1    0   
$EndComp
$Comp
L agg-kicad:GND #PWR04
U 1 1 5BEB6A6B
P 1425 2325
F 0 "#PWR04" H 1295 2365 50  0001 L CNN
F 1 "GND" H 1375 2225 39  0000 C CNN
F 2 "" H 1425 2325 60  0000 C CNN
F 3 "" H 1425 2325 60  0000 C CNN
	1    1425 2325
	0    1    1    0   
$EndComp
$Comp
L agg-kicad:C C7
U 1 1 5BEB6A72
P 1325 2025
F 0 "C7" H 1375 2095 31  0000 C CNN
F 1 "1u" H 1375 1955 31  0000 C CNN
F 2 "agg:0402" H 1325 2025 50  0001 C CNN
F 3 "" H 1325 2025 50  0001 C CNN
F 4 "2496814" H 1325 2025 60  0001 C CNN "Farnell"
	1    1325 2025
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:C C3
U 1 1 5BEB6A7A
P 1325 1225
F 0 "C3" H 1375 1285 31  0000 C CNN
F 1 "4u7" H 1375 1165 31  0000 C CNN
F 2 "agg:0402" H 1325 1225 50  0001 C CNN
F 3 "" H 1325 1225 50  0001 C CNN
F 4 "2426952" H 1325 1225 31  0001 C CNN "Farnell"
	1    1325 1225
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:3v3 #PWR06
U 1 1 5BEB6A81
P 1775 1175
F 0 "#PWR06" H 1775 1285 50  0001 L CNN
F 1 "3v3" H 1775 1265 50  0000 C CNN
F 2 "" H 1775 1175 60  0000 C CNN
F 3 "" H 1775 1175 60  0000 C CNN
	1    1775 1175
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:C C11
U 1 1 5BEB6A88
P 1525 1925
F 0 "C11" H 1575 1995 31  0000 C CNN
F 1 "100n" H 1575 1855 31  0000 C CNN
F 2 "agg:0402" H 1525 1925 50  0001 C CNN
F 3 "" H 1525 1925 50  0001 C CNN
F 4 "2496771" H 1525 1925 60  0001 C CNN "Farnell"
	1    1525 1925
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:C C6
U 1 1 5BEB6A90
P 1325 1825
F 0 "C6" H 1375 1895 31  0000 C CNN
F 1 "100n" H 1375 1755 31  0000 C CNN
F 2 "agg:0402" H 1325 1825 50  0001 C CNN
F 3 "" H 1325 1825 50  0001 C CNN
F 4 "2496771" H 1325 1825 60  0001 C CNN "Farnell"
	1    1325 1825
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:C C10
U 1 1 5BEB6A98
P 1525 1725
F 0 "C10" H 1575 1795 31  0000 C CNN
F 1 "100n" H 1575 1655 31  0000 C CNN
F 2 "agg:0402" H 1525 1725 50  0001 C CNN
F 3 "" H 1525 1725 50  0001 C CNN
F 4 "2496771" H 1525 1725 60  0001 C CNN "Farnell"
	1    1525 1725
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:C C5
U 1 1 5BEB6AA0
P 1325 1625
F 0 "C5" H 1375 1695 31  0000 C CNN
F 1 "100n" H 1375 1555 31  0000 C CNN
F 2 "agg:0402" H 1325 1625 50  0001 C CNN
F 3 "" H 1325 1625 50  0001 C CNN
F 4 "2496771" H 1325 1625 60  0001 C CNN "Farnell"
	1    1325 1625
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:C C9
U 1 1 5BEB6AA8
P 1525 1525
F 0 "C9" H 1575 1595 31  0000 C CNN
F 1 "100n" H 1575 1455 31  0000 C CNN
F 2 "agg:0402" H 1525 1525 50  0001 C CNN
F 3 "" H 1525 1525 50  0001 C CNN
F 4 "2496771" H 1525 1525 60  0001 C CNN "Farnell"
	1    1525 1525
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:C C4
U 1 1 5BEB6AB0
P 1325 1425
F 0 "C4" H 1375 1495 31  0000 C CNN
F 1 "100n" H 1375 1355 31  0000 C CNN
F 2 "agg:0402" H 1325 1425 50  0001 C CNN
F 3 "" H 1325 1425 50  0001 C CNN
F 4 "2496771" H 1325 1425 60  0001 C CNN "Farnell"
	1    1325 1425
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:C C8
U 1 1 5BEB6AB8
P 1525 1325
F 0 "C8" H 1575 1395 31  0000 C CNN
F 1 "100n" H 1575 1255 31  0000 C CNN
F 2 "agg:0402" H 1525 1325 50  0001 C CNN
F 3 "" H 1525 1325 50  0001 C CNN
F 4 "2496771" H 1525 1325 60  0001 C CNN "Farnell"
	1    1525 1325
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:GND #PWR02
U 1 1 5BEB6ABF
P 1175 2075
F 0 "#PWR02" H 1045 2115 50  0001 L CNN
F 1 "GND" H 1175 1975 39  0000 C CNN
F 2 "" H 1175 2075 60  0000 C CNN
F 3 "" H 1175 2075 60  0000 C CNN
	1    1175 2075
	1    0    0    -1  
$EndComp
Text Label 1725 5125 2    50   ~ 0
SWDIO
Text Label 1725 5225 2    50   ~ 0
SWDCLK
Text Label 1725 4725 2    50   ~ 0
USART1_TX
Text Label 1725 4825 2    50   ~ 0
USART1_RX
$Comp
L agg-kicad:GND #PWR01
U 1 1 5BEB6ACF
P 875 3425
F 0 "#PWR01" H 745 3465 50  0001 L CNN
F 1 "GND" H 825 3325 39  0000 L CNN
F 2 "" H 875 3425 60  0001 C CNN
F 3 "" H 875 3425 60  0001 C CNN
	1    875  3425
	0    1    1    0   
$EndComp
Wire Wire Line
	1725 3525 1825 3525
Wire Wire Line
	1525 3225 1525 3425
Wire Wire Line
	1225 3475 1225 3525
Wire Wire Line
	1225 3525 975  3525
Wire Wire Line
	1225 3375 1225 3325
Wire Wire Line
	1225 3325 975  3325
Wire Wire Line
	975  3225 975  3325
Connection ~ 975  3325
Connection ~ 975  3525
Wire Wire Line
	975  3625 1075 3625
Wire Wire Line
	1525 3625 1325 3625
Wire Wire Line
	1525 3225 1325 3225
Wire Wire Line
	1075 3225 975  3225
Wire Wire Line
	975  3425 875  3425
Connection ~ 975  3425
Wire Wire Line
	1325 3375 1325 3225
Connection ~ 1325 3225
Wire Wire Line
	1325 3475 1325 3625
Connection ~ 1325 3625
Wire Wire Line
	1525 3625 1525 3525
Wire Wire Line
	1525 3525 1625 3525
Wire Wire Line
	1525 3425 1825 3425
Wire Wire Line
	1825 3225 1725 3225
Wire Wire Line
	1725 3125 1825 3125
Wire Wire Line
	1725 2525 1725 2625
Wire Wire Line
	1625 2925 1725 2925
Connection ~ 1725 2925
Wire Wire Line
	1825 2525 1725 2525
Wire Wire Line
	1825 2825 1725 2825
Connection ~ 1725 2825
Wire Wire Line
	1825 2725 1725 2725
Connection ~ 1725 2725
Wire Wire Line
	1825 2625 1725 2625
Connection ~ 1725 2625
Wire Wire Line
	1425 2325 1475 2325
Wire Wire Line
	1425 2225 1625 2225
Wire Wire Line
	1725 2225 1825 2225
Wire Wire Line
	1825 2325 1575 2325
Wire Wire Line
	1175 2075 1175 2025
Wire Wire Line
	1175 1225 1325 1225
Wire Wire Line
	1425 1225 1775 1225
Wire Wire Line
	1775 1175 1775 1225
Connection ~ 1775 1225
Wire Wire Line
	1625 1325 1775 1325
Wire Wire Line
	1425 1425 1775 1425
Connection ~ 1775 1325
Wire Wire Line
	1625 1525 1775 1525
Connection ~ 1775 1425
Wire Wire Line
	1425 1625 1775 1625
Connection ~ 1775 1525
Wire Wire Line
	1625 1725 1775 1725
Connection ~ 1775 1625
Wire Wire Line
	1425 1825 1775 1825
Connection ~ 1775 1725
Wire Wire Line
	1625 1925 1775 1925
Connection ~ 1775 1825
Wire Wire Line
	1425 2025 1775 2025
Connection ~ 1775 1925
Connection ~ 1775 2025
Wire Wire Line
	1525 1325 1175 1325
Connection ~ 1175 1325
Wire Wire Line
	1325 1425 1175 1425
Connection ~ 1175 1425
Wire Wire Line
	1525 1525 1175 1525
Connection ~ 1175 1525
Wire Wire Line
	1325 1625 1175 1625
Connection ~ 1175 1625
Wire Wire Line
	1325 1825 1175 1825
Connection ~ 1175 1825
Wire Wire Line
	1325 2025 1175 2025
Connection ~ 1175 2025
Wire Wire Line
	1525 1925 1175 1925
Connection ~ 1175 1925
Wire Wire Line
	1525 1725 1175 1725
Connection ~ 1175 1725
Wire Wire Line
	1825 5125 1725 5125
Wire Wire Line
	1825 5225 1725 5225
Wire Wire Line
	1825 4725 1725 4725
Wire Wire Line
	1825 4825 1725 4825
Wire Wire Line
	975  3325 975  3425
Wire Wire Line
	975  3525 975  3625
Wire Wire Line
	975  3425 975  3525
Wire Wire Line
	1325 3225 1175 3225
Wire Wire Line
	1325 3625 1175 3625
Wire Wire Line
	1725 2925 1725 3125
Wire Wire Line
	1725 2925 1825 2925
Wire Wire Line
	1725 2825 1725 2925
Wire Wire Line
	1725 2725 1725 2825
Wire Wire Line
	1725 2625 1725 2725
Wire Wire Line
	1775 1225 1825 1225
Wire Wire Line
	1775 1225 1775 1325
Wire Wire Line
	1775 1325 1825 1325
Wire Wire Line
	1775 1325 1775 1425
Wire Wire Line
	1775 1425 1825 1425
Wire Wire Line
	1775 1425 1775 1525
Wire Wire Line
	1775 1525 1825 1525
Wire Wire Line
	1775 1525 1775 1625
Wire Wire Line
	1775 1625 1825 1625
Wire Wire Line
	1775 1625 1775 1725
Wire Wire Line
	1775 1725 1825 1725
Wire Wire Line
	1775 1725 1775 1825
Wire Wire Line
	1775 1825 1825 1825
Wire Wire Line
	1775 1825 1775 1925
Wire Wire Line
	1775 1925 1825 1925
Wire Wire Line
	1775 1925 1775 2025
Wire Wire Line
	1775 2025 1825 2025
Wire Wire Line
	1175 1325 1175 1225
Wire Wire Line
	1175 1425 1175 1325
Wire Wire Line
	1175 1525 1175 1425
Wire Wire Line
	1175 1625 1175 1525
Wire Wire Line
	1175 1825 1175 1725
Wire Wire Line
	1175 2025 1175 1925
Wire Wire Line
	1175 1925 1175 1825
Wire Wire Line
	1175 1725 1175 1625
Text Label 1725 6825 2    50   ~ 0
STATUS
$Comp
L agg-kicad:STM32F4xxVxTx IC1
U 1 1 5BEB6B4F
P 2425 4225
F 0 "IC1" H 2425 7450 50  0000 C CNN
F 1 "STM32F437VIT6" H 2425 7359 50  0000 C CNN
F 2 "agg:LQFP-100" H 1975 1025 50  0001 L CNN
F 3 "http://www.farnell.com/datasheets/2308533.pdf" H 1975 925 50  0001 L CNN
F 4 "2333377" H 1975 825 50  0001 L CNN "Farnell"
	1    2425 4225
	1    0    0    -1  
$EndComp
NoConn ~ 3025 1825
Text Label 1725 3925 2    50   ~ 0
USART2_TX
Wire Wire Line
	1725 3925 1825 3925
Wire Wire Line
	1825 4025 1725 4025
Wire Wire Line
	1825 6825 1725 6825
NoConn ~ 3025 6225
NoConn ~ 3025 6025
NoConn ~ 3025 5425
NoConn ~ 3025 5325
NoConn ~ 3025 5225
NoConn ~ 3025 4925
NoConn ~ 3025 4825
NoConn ~ 3025 4625
NoConn ~ 1825 6225
NoConn ~ 1825 6125
NoConn ~ 1825 5825
NoConn ~ 1825 5925
NoConn ~ 1825 6025
NoConn ~ 1825 5325
NoConn ~ 1825 5025
NoConn ~ 1825 4925
NoConn ~ 3025 4525
NoConn ~ 1825 4625
NoConn ~ 1825 4425
NoConn ~ 1825 4325
NoConn ~ 1825 4225
NoConn ~ 1825 4125
NoConn ~ 1825 3725
NoConn ~ 3025 3725
NoConn ~ 3025 3625
NoConn ~ 3025 3525
NoConn ~ 3025 3425
NoConn ~ 3025 3325
NoConn ~ 3025 3125
NoConn ~ 3025 3025
NoConn ~ 3025 2625
NoConn ~ 3025 2725
NoConn ~ 3025 2825
Text Label 1725 4025 2    50   ~ 0
USART2_RX
Text Notes 625  775  0    79   ~ 16
Microcontroller:
NoConn ~ 1825 5525
NoConn ~ 3025 4025
NoConn ~ 3025 4125
NoConn ~ 3025 4225
NoConn ~ 3025 4325
NoConn ~ 3025 4425
NoConn ~ 3025 6125
NoConn ~ 3025 3925
NoConn ~ 3025 5925
NoConn ~ 3025 1725
$Comp
L agg-kicad:3v3 #PWR013
U 1 1 5C1B4C1B
P 6050 1150
F 0 "#PWR013" H 6050 1260 50  0001 L CNN
F 1 "3v3" H 6050 1240 50  0000 C CNN
F 2 "" H 6050 1150 60  0000 C CNN
F 3 "" H 6050 1150 60  0000 C CNN
	1    6050 1150
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:ADP3335 IC2
U 1 1 5C1B4C22
P 5250 1300
F 0 "IC2" H 5050 1500 50  0000 L CNN
F 1 "ADP3335" H 5050 1000 50  0000 L CNN
F 2 "agg:MSOP-8" H 5050 900 50  0001 L CNN
F 3 "" H 5650 900 50  0001 C CNN
F 4 "2067775" H 5050 800 50  0001 L CNN "Farnell"
	1    5250 1300
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:GND #PWR08
U 1 1 5C1B4C29
P 4900 1550
F 0 "#PWR08" H 4770 1590 50  0001 L CNN
F 1 "GND" H 4850 1450 39  0000 L CNN
F 2 "" H 4900 1550 60  0001 C CNN
F 3 "" H 4900 1550 60  0001 C CNN
	1    4900 1550
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:C C16
U 1 1 5C1B4C30
P 5800 1300
F 0 "C16" V 5812 1358 39  0000 L CNN
F 1 "10n" V 5887 1358 39  0000 L CNN
F 2 "agg:0603-L" H 5800 1300 50  0001 C CNN
F 3 "" H 5800 1300 50  0001 C CNN
F 4 "2496825" H 5800 1300 60  0001 C CNN "Farnell"
	1    5800 1300
	0    1    1    0   
$EndComp
$Comp
L agg-kicad:C C14
U 1 1 5C1B4C38
P 4750 1300
F 0 "C14" V 4750 1225 39  0000 C CNN
F 1 "1u" V 4825 1225 39  0000 C CNN
F 2 "agg:0603-L" H 4750 1300 50  0001 C CNN
F 3 "" H 4750 1300 50  0001 C CNN
F 4 "1865556" H 4750 1300 60  0001 C CNN "Farnell"
	1    4750 1300
	0    1    1    0   
$EndComp
$Comp
L agg-kicad:5v #PWR07
U 1 1 5C1B4C3F
P 4750 1150
F 0 "#PWR07" H 4750 1260 50  0001 L CNN
F 1 "5v" H 4750 1274 50  0000 C CNN
F 2 "" H 4750 1150 50  0001 C CNN
F 3 "" H 4750 1150 50  0001 C CNN
	1    4750 1150
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:GND #PWR014
U 1 1 5C1B4C45
P 6050 1500
F 0 "#PWR014" H 5920 1540 50  0001 L CNN
F 1 "GND" H 6000 1400 39  0000 L CNN
F 2 "" H 6050 1500 60  0001 C CNN
F 3 "" H 6050 1500 60  0001 C CNN
	1    6050 1500
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:C C17
U 1 1 5C1B4C4C
P 6050 1300
F 0 "C17" V 6062 1358 39  0000 L CNN
F 1 "1u" V 6137 1358 39  0000 L CNN
F 2 "agg:0603-L" H 6050 1300 50  0001 C CNN
F 3 "" H 6050 1300 50  0001 C CNN
F 4 "1865556" H 6050 1300 60  0001 C CNN "Farnell"
	1    6050 1300
	0    1    1    0   
$EndComp
$Comp
L agg-kicad:PWR #FLG01
U 1 1 5C1B4C53
P 4700 1200
F 0 "#FLG01" H 4700 1360 50  0001 C CNN
F 1 "PWR" V 4700 1288 31  0000 L CNN
F 2 "" H 4700 1200 50  0001 C CNN
F 3 "" H 4700 1200 50  0001 C CNN
	1    4700 1200
	0    -1   -1   0   
$EndComp
$Comp
L agg-kicad:PWR #FLG02
U 1 1 5C1B4C59
P 4700 1500
F 0 "#FLG02" H 4700 1660 50  0001 C CNN
F 1 "PWR" V 4700 1588 31  0000 L CNN
F 2 "" H 4700 1500 50  0001 C CNN
F 3 "" H 4700 1500 50  0001 C CNN
	1    4700 1500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5600 1400 5550 1400
Wire Wire Line
	5800 1500 5550 1500
Wire Wire Line
	5800 1400 5800 1500
Wire Wire Line
	5800 1200 5800 1300
Wire Wire Line
	6050 1150 6050 1200
Wire Wire Line
	4900 1400 4950 1400
Wire Wire Line
	4700 1200 4750 1200
Wire Wire Line
	4950 1300 4900 1300
Connection ~ 4900 1300
Wire Wire Line
	4700 1500 4750 1500
Wire Wire Line
	4900 1500 4900 1550
Wire Wire Line
	4750 1500 4750 1400
Wire Wire Line
	4750 1150 4750 1200
Connection ~ 4750 1200
Wire Wire Line
	6050 1500 6050 1400
Wire Wire Line
	5600 1400 5600 1300
Wire Wire Line
	5550 1300 5600 1300
Connection ~ 5600 1300
Connection ~ 5600 1200
Connection ~ 5800 1200
Connection ~ 6050 1200
Connection ~ 4900 1500
Wire Wire Line
	4900 1200 4900 1300
Connection ~ 4900 1200
Connection ~ 4750 1500
Wire Wire Line
	5550 1200 5600 1200
$Comp
L agg-kicad:LED D1
U 1 1 5C1B4C7A
P 6500 1450
F 0 "D1" V 6550 1375 39  0000 R CNN
F 1 "LED" V 6505 1392 39  0001 R CNN
F 2 "agg:0603-LED" H 6500 1450 50  0001 C CNN
F 3 "" H 6500 1450 50  0001 C CNN
F 4 "2290328" V 6500 1450 60  0001 C CNN "Farnell"
	1    6500 1450
	0    -1   -1   0   
$EndComp
$Comp
L agg-kicad:GND #PWR016
U 1 1 5C1B4C81
P 6500 1500
F 0 "#PWR016" H 6370 1540 50  0001 L CNN
F 1 "GND" H 6450 1400 47  0000 L CNN
F 2 "" H 6500 1500 60  0001 C CNN
F 3 "" H 6500 1500 60  0001 C CNN
	1    6500 1500
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:GND #PWR018
U 1 1 5C1B4C87
P 6900 1500
F 0 "#PWR018" H 6770 1540 50  0001 L CNN
F 1 "GND" H 6850 1400 47  0000 L CNN
F 2 "" H 6900 1500 60  0001 C CNN
F 3 "" H 6900 1500 60  0001 C CNN
	1    6900 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 1200 6500 1150
Wire Wire Line
	6500 1300 6500 1350
Wire Wire Line
	6500 1450 6500 1500
Wire Wire Line
	6900 1450 6900 1500
Wire Wire Line
	6900 1300 6900 1350
Wire Wire Line
	6900 1200 6900 1150
Wire Wire Line
	6900 1150 7000 1150
$Comp
L agg-kicad:3v3 #PWR015
U 1 1 5C1B4C94
P 6500 1150
F 0 "#PWR015" H 6500 1260 50  0001 L CNN
F 1 "3v3" H 6500 1240 50  0000 C CNN
F 2 "" H 6500 1150 60  0000 C CNN
F 3 "" H 6500 1150 60  0000 C CNN
	1    6500 1150
	1    0    0    -1  
$EndComp
Text Label 7000 1150 0    50   ~ 0
STATUS
Text Notes 4400 725  0    79   ~ 16
Power Supply:
Wire Wire Line
	4900 1300 4900 1400
Wire Wire Line
	4750 1200 4900 1200
Wire Wire Line
	4750 1200 4750 1300
Wire Wire Line
	5600 1300 5600 1200
Wire Wire Line
	5600 1200 5800 1200
Wire Wire Line
	5800 1200 6050 1200
Wire Wire Line
	6050 1200 6050 1300
Wire Wire Line
	4900 1500 4950 1500
Wire Wire Line
	4900 1200 4950 1200
Wire Wire Line
	4750 1500 4900 1500
Wire Wire Line
	6050 1200 6100 1200
$Comp
L agg-kicad:TESTPAD TP1
U 1 1 5C1B4CA7
P 6100 1200
F 0 "TP1" H 6250 1200 24  0000 C CNN
F 1 "TESTPAD" H 6100 1125 50  0001 L CNN
F 2 "agg:TESTPAD" H 6100 1050 50  0001 L CNN
F 3 "" H 6100 1200 50  0001 C CNN
	1    6100 1200
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:R R4
U 1 1 5C1B4CAF
P 6500 1200
F 0 "R4" V 6500 1125 39  0000 C CNN
F 1 "100R" V 6575 1100 39  0000 C CNN
F 2 "agg:0603" H 6500 1200 50  0001 C CNN
F 3 "" H 6500 1200 50  0001 C CNN
F 4 "2616742" V 6500 1200 50  0001 C CNN "Farnell"
	1    6500 1200
	0    -1   1    0   
$EndComp
$Comp
L agg-kicad:LED D2
U 1 1 5C1B4CB7
P 6900 1450
F 0 "D2" V 6950 1375 39  0000 R CNN
F 1 "LED" V 6905 1392 39  0001 R CNN
F 2 "agg:0603-LED" H 6900 1450 50  0001 C CNN
F 3 "" H 6900 1450 50  0001 C CNN
F 4 "2290328" V 6900 1450 60  0001 C CNN "Farnell"
	1    6900 1450
	0    -1   -1   0   
$EndComp
$Comp
L agg-kicad:R R5
U 1 1 5C1B4CBF
P 6900 1200
F 0 "R5" V 6900 1125 39  0000 C CNN
F 1 "100R" V 6975 1100 39  0000 C CNN
F 2 "agg:0603" H 6900 1200 50  0001 C CNN
F 3 "" H 6900 1200 50  0001 C CNN
F 4 "2616742" V 6900 1200 50  0001 C CNN "Farnell"
	1    6900 1200
	0    -1   1    0   
$EndComp
$Comp
L agg-kicad:SWD_TC P2
U 1 1 5C1B4CC6
P 9900 2900
F 0 "P2" H 9650 3100 50  0000 C CNN
F 1 "SWD_TC" H 9725 2700 50  0000 C CNN
F 2 "agg:TC2030-NL" H 9600 2600 50  0001 L CNN
F 3 "" H 9506 3000 50  0001 C CNN
	1    9900 2900
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:C C19
U 1 1 5C1B4CCE
P 9300 3050
F 0 "C19" V 9375 3150 39  0000 C CNN
F 1 "100n" V 9300 3150 39  0000 C CNN
F 2 "agg:0402" H 9300 3050 50  0001 C CNN
F 3 "" H 9300 3050 50  0001 C CNN
F 4 "2496771" H 9300 3050 60  0001 C CNN "Farnell"
	1    9300 3050
	0    -1   -1   0   
$EndComp
$Comp
L agg-kicad:3v3 #PWR026
U 1 1 5C1B4CD5
P 9450 2700
F 0 "#PWR026" H 9450 2810 50  0001 L CNN
F 1 "3v3" H 9450 2790 50  0000 C CNN
F 2 "" H 9450 2700 60  0000 C CNN
F 3 "" H 9450 2700 60  0000 C CNN
	1    9450 2700
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:GND #PWR027
U 1 1 5C1B4CDB
P 9450 3100
F 0 "#PWR027" H 9320 3140 50  0001 L CNN
F 1 "GND" H 9400 3000 39  0000 L CNN
F 2 "" H 9450 3100 60  0001 C CNN
F 3 "" H 9450 3100 60  0001 C CNN
	1    9450 3100
	1    0    0    -1  
$EndComp
NoConn ~ 10300 3000
Text Label 10400 2800 0    50   ~ 0
SWDIO
Text Label 10400 2900 0    50   ~ 0
SWDCLK
Text Label 9200 2900 2    50   ~ 0
~RST
$Comp
L agg-kicad:GND #PWR025
U 1 1 5C1B4CE5
P 9300 3100
F 0 "#PWR025" H 9170 3140 50  0001 L CNN
F 1 "GND" H 9250 3000 39  0000 L CNN
F 2 "" H 9300 3100 60  0001 C CNN
F 3 "" H 9300 3100 60  0001 C CNN
	1    9300 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 2700 9450 2800
Wire Wire Line
	9450 2800 9500 2800
Wire Wire Line
	9500 3000 9450 3000
Wire Wire Line
	9450 3000 9450 3100
Wire Wire Line
	10300 2800 10400 2800
Wire Wire Line
	10300 2900 10400 2900
Wire Wire Line
	9300 3050 9300 3100
Wire Wire Line
	9200 2900 9300 2900
Wire Wire Line
	9300 2900 9300 2950
Connection ~ 9300 2900
Text Notes 8675 2350 0    79   ~ 16
Tag Connect:
Wire Wire Line
	9300 2900 9500 2900
$Comp
L agg-kicad:CONN_01x02 J3
U 1 1 5C1B4D20
P 8250 1225
F 0 "J3" H 8225 1325 50  0000 C CNN
F 1 "5v In" H 8250 1025 50  0000 C CNN
F 2 "agg:S02B-PASK-2" H 8250 1225 50  0001 C CNN
F 3 "" H 8250 1225 50  0001 C CNN
F 4 "1830747" H 8250 1225 50  0001 C CNN "Farnell"
	1    8250 1225
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:GND #PWR021
U 1 1 5C1B4D27
P 8450 1425
F 0 "#PWR021" H 8320 1465 50  0001 L CNN
F 1 "GND" H 8450 1325 50  0000 C CNN
F 2 "" H 8450 1425 50  0001 C CNN
F 3 "" H 8450 1425 50  0001 C CNN
	1    8450 1425
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 1325 8450 1325
$Comp
L agg-kicad:5v #PWR022
U 1 1 5C1B4D2E
P 8650 1125
F 0 "#PWR022" H 8650 1235 50  0001 L CNN
F 1 "5v" H 8650 1249 50  0000 C CNN
F 2 "" H 8650 1125 50  0001 C CNN
F 3 "" H 8650 1125 50  0001 C CNN
	1    8650 1125
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:GND #PWR024
U 1 1 5C1B4D3C
P 5875 2525
F 0 "#PWR024" H 5745 2565 50  0001 L CNN
F 1 "GND" H 5875 2425 50  0000 C CNN
F 2 "" H 5875 2525 50  0001 C CNN
F 3 "" H 5875 2525 50  0001 C CNN
	1    5875 2525
	1    0    0    -1  
$EndComp
Text Notes 4400 2350 0    79   ~ 16
USB Input:
$Comp
L agg-kicad:GND #PWR011
U 1 1 5C2403EE
P 5175 3250
F 0 "#PWR011" H 5045 3290 50  0001 L CNN
F 1 "GND" H 5100 3150 50  0000 L CNN
F 2 "" H 5175 3250 60  0001 C CNN
F 3 "" H 5175 3250 60  0001 C CNN
	1    5175 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5175 3150 5175 3250
Wire Wire Line
	5175 3050 5175 3150
Connection ~ 5175 3150
$Comp
L agg-kicad:R R2
U 1 1 5C2520F6
P 5250 2575
F 0 "R2" H 5300 2625 39  0000 C CNN
F 1 "0R" H 5300 2525 39  0000 C CNN
F 2 "agg:0603" H 5250 2575 50  0001 C CNN
F 3 "" H 5250 2575 50  0001 C CNN
F 4 "2122112" V 5250 2575 50  0001 C CNN "Farnell"
	1    5250 2575
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:5v #PWR012
U 1 1 5C252DEC
P 5450 2525
F 0 "#PWR012" H 5450 2635 50  0001 L CNN
F 1 "5v" H 5450 2649 50  0000 C CNN
F 2 "" H 5450 2525 50  0001 C CNN
F 3 "" H 5450 2525 50  0001 C CNN
	1    5450 2525
	1    0    0    -1  
$EndComp
Wire Wire Line
	5075 3050 5175 3050
Wire Wire Line
	5075 3150 5175 3150
Wire Wire Line
	5075 2750 5175 2750
Wire Wire Line
	5125 2575 5175 2575
Wire Wire Line
	5175 2575 5175 2750
Wire Wire Line
	5350 2575 5450 2575
Wire Wire Line
	8650 1225 8650 1125
$Comp
L agg-kicad:C C18
U 1 1 5C2EC01C
P 5875 2375
F 0 "C18" V 5887 2433 39  0000 L CNN
F 1 "1u" V 5962 2433 39  0000 L CNN
F 2 "agg:0603-L" H 5875 2375 50  0001 C CNN
F 3 "" H 5875 2375 50  0001 C CNN
F 4 "1865556" H 5875 2375 60  0001 C CNN "Farnell"
	1    5875 2375
	0    1    1    0   
$EndComp
Text Notes 7900 725  0    79   ~ 16
External Supply:
Text Notes 4400 3775 0    79   ~ 16
RS485 Driver:
Wire Notes Line
	4250 500  4250 7775
Wire Notes Line
	4250 2100 11200 2100
Wire Notes Line
	7775 475  7775 2100
Wire Wire Line
	5175 2575 5250 2575
Connection ~ 5175 2575
Wire Wire Line
	5075 2850 5325 2850
Wire Wire Line
	5075 2950 5325 2950
$Comp
L agg-kicad:GND #PWR020
U 1 1 5C3C0B8B
P 7825 3100
F 0 "#PWR020" H 7695 3140 50  0001 L CNN
F 1 "GND" H 7775 3000 47  0000 L CNN
F 2 "" H 7825 3100 60  0001 C CNN
F 3 "" H 7825 3100 60  0001 C CNN
	1    7825 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7725 3000 7825 3000
Wire Wire Line
	7825 3000 7825 3100
Wire Wire Line
	7725 2900 7825 2900
Wire Wire Line
	7725 2800 7825 2800
$Comp
L agg-kicad:CONN_01x03 J2
U 1 1 5C3C0B96
P 7625 2800
F 0 "J2" H 7625 2900 50  0000 C CNN
F 1 "UART2" H 7625 2500 50  0000 C CNN
F 2 "agg:S03B-PASK-2" H 7625 2800 50  0001 C CNN
F 3 "" H 7625 2800 50  0001 C CNN
F 4 "1830748" H 7625 2800 60  0001 C CNN "Farnell"
	1    7625 2800
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:GND #PWR017
U 1 1 5C3C0B9D
P 6750 3100
F 0 "#PWR017" H 6620 3140 50  0001 L CNN
F 1 "GND" H 6700 3000 47  0000 L CNN
F 2 "" H 6750 3100 60  0001 C CNN
F 3 "" H 6750 3100 60  0001 C CNN
	1    6750 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 3000 6750 3000
Wire Wire Line
	6750 3000 6750 3100
Wire Wire Line
	6650 2900 6750 2900
Wire Wire Line
	6650 2800 6750 2800
$Comp
L agg-kicad:CONN_01x03 J1
U 1 1 5C3C0BA8
P 6550 2800
F 0 "J1" H 6550 2900 50  0000 C CNN
F 1 "UART1" H 6550 2500 50  0000 C CNN
F 2 "agg:S03B-PASK-2" H 6550 2800 50  0001 C CNN
F 3 "" H 6550 2800 50  0001 C CNN
F 4 "1830748" H 6550 2800 60  0001 C CNN "Farnell"
	1    6550 2800
	1    0    0    -1  
$EndComp
Text Label 6750 2800 0    50   ~ 0
USART1_TX
Text Label 6750 2900 0    50   ~ 0
USART1_RX
Text Label 7825 2800 0    50   ~ 0
USART2_TX
Text Label 7825 2900 0    50   ~ 0
USART2_RX
Text Notes 6225 2350 0    79   ~ 16
UART to Ignition Boards:
Wire Notes Line
	6100 2100 6100 3550
Wire Notes Line
	8550 2100 8550 3550
Wire Notes Line
	4250 3550 11175 3550
Text Label 1700 7025 2    50   ~ 0
OTG_HS_DM
Text Label 1700 7125 2    50   ~ 0
OTG_HS_DP
Text Label 1700 6925 2    50   ~ 0
OTG_HS_VBUS
Wire Wire Line
	1700 6925 1825 6925
Wire Wire Line
	1700 7025 1825 7025
Wire Wire Line
	1700 7125 1825 7125
Text Label 5325 2850 0    50   ~ 0
OTG_HS_DM
Text Label 5325 2950 0    50   ~ 0
OTG_HS_DP
Text Label 5125 2575 2    50   ~ 0
OTG_HS_VBUS
Text Label 1750 6625 2    50   ~ 0
USART3_TX
Text Label 1750 6725 2    50   ~ 0
USART3_RX
Wire Wire Line
	1750 6625 1825 6625
Wire Wire Line
	1825 6725 1750 6725
NoConn ~ 3025 1625
NoConn ~ 3025 1525
NoConn ~ 3025 1425
NoConn ~ 3025 1325
NoConn ~ 3025 1225
NoConn ~ 3025 2125
NoConn ~ 3025 2225
NoConn ~ 3025 2325
NoConn ~ 3025 2425
NoConn ~ 3025 2525
NoConn ~ 3025 3225
NoConn ~ 3025 5525
NoConn ~ 3025 5725
NoConn ~ 3025 5825
NoConn ~ 1825 6425
NoConn ~ 1825 6525
NoConn ~ 1825 5625
NoConn ~ 1825 5725
NoConn ~ 1825 3825
$Comp
L agg-kicad:5v #PWR010
U 1 1 5BF60B5E
P 5125 4150
F 0 "#PWR010" H 5125 4260 50  0001 L CNN
F 1 "5v" H 5125 4250 50  0000 C CNN
F 2 "" H 5125 4150 50  0001 C CNN
F 3 "" H 5125 4150 50  0001 C CNN
	1    5125 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5125 4325 5175 4325
$Comp
L agg-kicad:GND #PWR09
U 1 1 5BF69AA0
P 4925 4425
F 0 "#PWR09" H 4795 4465 50  0001 L CNN
F 1 "GND" H 4875 4325 39  0000 L CNN
F 2 "" H 4925 4425 60  0001 C CNN
F 3 "" H 4925 4425 60  0001 C CNN
	1    4925 4425
	0    1    1    0   
$EndComp
$Comp
L agg-kicad:C C15
U 1 1 5BF724B3
P 5050 4350
F 0 "C15" V 5150 4425 39  0000 C CNN
F 1 "100n" V 5050 4450 39  0000 C CNN
F 2 "agg:0402" H 5050 4350 50  0001 C CNN
F 3 "" H 5050 4350 50  0001 C CNN
F 4 "2496771" H 5050 4350 60  0001 C CNN "Farnell"
	1    5050 4350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5175 4625 5125 4625
Wire Wire Line
	5175 4725 5125 4725
Text Label 6175 4775 0    50   ~ 0
~RS485_TX
Text Label 6175 4575 0    50   ~ 0
RS485_TX
Text Label 6175 4475 0    50   ~ 0
~RS485_RX
Text Label 6175 4275 0    50   ~ 0
RS485_RX
Wire Wire Line
	5775 4425 5875 4425
Wire Wire Line
	5775 4325 5875 4325
Text Label 5125 4725 2    50   ~ 0
USART3_TX
Text Label 5125 4625 2    50   ~ 0
USART3_RX
$Comp
L agg-kicad:R R3
U 1 1 5C04F8B2
P 5975 4325
F 0 "R3" V 5975 4250 39  0000 C CNN
F 1 "120R" V 6050 4225 39  0000 C CNN
F 2 "agg:0402" H 5975 4325 50  0001 C CNN
F 3 "" H 5975 4325 50  0001 C CNN
F 4 "2140682" V 5975 4325 50  0001 C CNN "Farnell"
	1    5975 4325
	0    -1   1    0   
$EndComp
Wire Wire Line
	5875 4325 5875 4275
Wire Wire Line
	5875 4275 5975 4275
Wire Wire Line
	6175 4475 5975 4475
Wire Wire Line
	5875 4475 5875 4425
Wire Wire Line
	5975 4425 5975 4475
Connection ~ 5975 4475
Wire Wire Line
	5975 4475 5875 4475
Wire Wire Line
	5975 4325 5975 4275
Connection ~ 5975 4275
Wire Wire Line
	5975 4275 6175 4275
Wire Wire Line
	5875 4575 6175 4575
Wire Wire Line
	5775 4625 5875 4625
Wire Wire Line
	5875 4775 6175 4775
Wire Wire Line
	5775 4725 5875 4725
Wire Wire Line
	5875 4725 5875 4775
Wire Wire Line
	5875 4575 5875 4625
Wire Wire Line
	4925 4425 5050 4425
Wire Wire Line
	5050 4350 5050 4425
Connection ~ 5050 4425
Wire Wire Line
	5050 4425 5175 4425
Wire Wire Line
	5050 4250 5050 4200
Wire Wire Line
	5050 4200 5125 4200
Wire Wire Line
	5125 4200 5125 4325
Connection ~ 5125 4200
Wire Wire Line
	5125 4150 5125 4200
Text Label 8650 4675 0    50   ~ 0
~RS485_TX
Text Label 8650 4775 0    50   ~ 0
RS485_TX
Text Label 8650 4275 0    50   ~ 0
~RS485_RX
Text Label 8650 4575 0    50   ~ 0
RS485_RX
Wire Wire Line
	8550 4775 8650 4775
Wire Wire Line
	8550 4675 8650 4675
Wire Wire Line
	8550 4575 8650 4575
Wire Wire Line
	8550 4275 8650 4275
NoConn ~ 8550 4475
NoConn ~ 8550 4375
NoConn ~ 8550 4175
NoConn ~ 8550 4075
$Comp
L agg-kicad:GND #PWR019
U 1 1 5C1671CC
P 7500 4925
F 0 "#PWR019" H 7370 4965 50  0001 L CNN
F 1 "GND" H 7450 4825 39  0000 L CNN
F 2 "" H 7500 4925 60  0001 C CNN
F 3 "" H 7500 4925 60  0001 C CNN
	1    7500 4925
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 4675 7550 4675
Wire Wire Line
	7500 4675 7500 4925
$Comp
L agg-kicad:R R6
U 1 1 5C1719EC
P 7300 4175
F 0 "R6" H 7350 4125 39  0000 C CNN
F 1 "100R" H 7350 4225 39  0000 C CNN
F 2 "agg:0603" H 7300 4175 50  0001 C CNN
F 3 "" H 7300 4175 50  0001 C CNN
F 4 "2616742" V 7300 4175 50  0001 C CNN "Farnell"
	1    7300 4175
	1    0    0    1   
$EndComp
Wire Wire Line
	7300 4175 7250 4175
$Comp
L agg-kicad:R R7
U 1 1 5C190BCC
P 7300 4475
F 0 "R7" H 7350 4425 39  0000 C CNN
F 1 "100R" H 7350 4525 39  0000 C CNN
F 2 "agg:0603" H 7300 4475 50  0001 C CNN
F 3 "" H 7300 4475 50  0001 C CNN
F 4 "2616742" V 7300 4475 50  0001 C CNN "Farnell"
	1    7300 4475
	1    0    0    1   
$EndComp
Wire Wire Line
	7300 4475 7250 4475
Text Label 7250 4175 2    50   ~ 0
LED1
Text Label 7250 4475 2    50   ~ 0
LED2
Wire Wire Line
	7550 4075 7500 4075
Wire Wire Line
	7500 4075 7500 4375
Connection ~ 7500 4675
Wire Wire Line
	7400 4475 7550 4475
Wire Wire Line
	7400 4175 7550 4175
Text Label 3125 5125 0    50   ~ 0
LED1
Text Label 3125 5025 0    50   ~ 0
LED2
Wire Wire Line
	7550 4375 7500 4375
Connection ~ 7500 4375
Wire Wire Line
	7500 4375 7500 4675
Wire Wire Line
	3025 5025 3125 5025
Wire Wire Line
	3125 5125 3025 5125
$Comp
L agg-kicad:PART X7
U 1 1 5BF5FB9C
P 5300 7200
F 0 "X7" H 5350 7300 50  0000 L CNN
F 1 "Case" H 5350 7200 50  0000 L CNN
F 2 "" H 5300 7200 50  0001 C CNN
F 3 "https://www.farnell.com/cad/1885404.pdf" H 5300 7200 50  0001 C CNN
F 4 "9287787" H 5300 7200 50  0001 C CNN "Farnell"
	1    5300 7200
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:PART X4
U 1 1 5BE5F39B
P 5850 7700
F 0 "X4" H 5900 7800 50  0000 L CNN
F 1 "RJ45 Cap" H 5900 7700 50  0000 L CNN
F 2 "" H 5850 7700 50  0001 C CNN
F 3 "" H 5850 7700 50  0001 C CNN
F 4 "125-7926" H 5850 7700 50  0001 C CNN "RS"
	1    5850 7700
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:PART X3
U 1 1 5BE5F1A8
P 5850 7450
F 0 "X3" H 5900 7550 50  0000 L CNN
F 1 "RJ45 Conn" H 5900 7450 50  0000 L CNN
F 2 "" H 5850 7450 50  0001 C CNN
F 3 "" H 5850 7450 50  0001 C CNN
F 4 "111-6745" H 5850 7450 50  0001 C CNN "RS"
	1    5850 7450
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:PART X2
U 1 1 5BE5F086
P 5300 7700
F 0 "X2" H 5350 7800 50  0000 L CNN
F 1 "USB Cap" H 5350 7700 50  0000 L CNN
F 2 "" H 5300 7700 50  0001 C CNN
F 3 "" H 5300 7700 50  0001 C CNN
F 4 "125-7930" H 5300 7700 50  0001 C CNN "RS"
	1    5300 7700
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:PART X1
U 1 1 5BE5EC2F
P 5300 7450
F 0 "X1" H 5350 7550 50  0000 L CNN
F 1 "USB Conn" H 5350 7450 50  0000 L CNN
F 2 "" H 5300 7450 50  0001 C CNN
F 3 "" H 5300 7450 50  0001 C CNN
F 4 "122-3021" H 5300 7450 50  0001 C CNN "RS"
	1    5300 7450
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:PART X5
U 1 1 5C1B4D87
P 5850 7200
F 0 "X5" H 5900 7300 50  0000 L CNN
F 1 "Hole" H 5900 7200 50  0000 L CNN
F 2 "agg:M3_MOUNT" H 5850 7200 50  0001 C CNN
F 3 "" H 5850 7200 50  0001 C CNN
	1    5850 7200
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:PART X6
U 1 1 5C1B4D80
P 6400 7200
F 0 "X6" H 6450 7300 50  0000 L CNN
F 1 "Hole" H 6450 7200 50  0000 L CNN
F 2 "agg:M3_MOUNT" H 6400 7200 50  0001 C CNN
F 3 "" H 6400 7200 50  0001 C CNN
	1    6400 7200
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:PART X8
U 1 1 5C1B4D79
P 6400 7450
F 0 "X8" H 6450 7550 50  0000 L CNN
F 1 "Hole" H 6450 7450 50  0000 L CNN
F 2 "agg:M3_MOUNT" H 6400 7450 50  0001 C CNN
F 3 "" H 6400 7450 50  0001 C CNN
	1    6400 7450
	1    0    0    -1  
$EndComp
$Comp
L agg-kicad:PART X9
U 1 1 5C1B4D72
P 6400 7700
F 0 "X9" H 6450 7800 50  0000 L CNN
F 1 "Hole" H 6450 7700 50  0000 L CNN
F 2 "agg:M3_MOUNT" H 6400 7700 50  0001 C CNN
F 3 "" H 6400 7700 50  0001 C CNN
	1    6400 7700
	1    0    0    -1  
$EndComp
Wire Notes Line
	4250 5275 11225 5275
Text Notes 9275 4450 0    50   Italic 10
Crossover Cable Required!
Wire Wire Line
	8450 1425 8450 1325
Text Notes 7625 3475 0    50   Italic 0
NF J1/J2 on PC Side
Text Notes 7875 2025 0    50   Italic 0
NF J3 on PC Side
Wire Wire Line
	8350 1225 8650 1225
Text Notes 5425 3475 0    50   Italic 0
NF R2 on \nController Side
Wire Wire Line
	5875 2475 5875 2525
Text Label 5850 2275 2    50   ~ 0
OTG_HS_VBUS
Wire Wire Line
	5850 2275 5875 2275
Wire Wire Line
	5875 2275 5875 2375
Wire Wire Line
	5450 2525 5450 2575
NoConn ~ 3025 6425
NoConn ~ 3025 6325
NoConn ~ 3025 1925
$EndSCHEMATC
