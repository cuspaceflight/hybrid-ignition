# Hybrid Rocket Engine Ignition System

This repository contains the design files for the valve controller used by CU Spaceflight to control our hybrid rocket engine. It is capable of actuating up to 10x 24W solenoid valves simultaneously and is controlled over RS422 or USB by a GUI. 

### Repository Layout

* **ChibiOS:** ChibiOS RTOS, developed by Giovanni Di Sirio.
* **agg-kicad:** KiCAD libraries, footprints and scripts developed by Adam Greig.
* **gen-board.h:** Python tool for generating 'board.h' header files for STM32 microcontrollers for use with ChibiOS.
* **m4-gcs:** Python GUI used to control and monitor the valve controller, developed by Greg Brooks.
* **pcb:** Hardware design files including schematic, pcb layout and BOM.
    * **comms:** Communications board project files.
    * **ignition:** Ignition board project files.
    * **lib:** Various schematic symbols.
* **firmware:** Firmware for each of the three sub-systems.
    * **comms-relay:** Full duplex USB to RS422 converter.
    * **comms-router:** Communications interface for the valve controller. Handles receiving packets over RS422 and routing to the firing boards over UART and vice-versa.
    * **ignition:** Actuates valves on command and reports measurements such as currents consumption, output voltage and if the valve coil is plugged in or not.

Developed by Matt Coates (mc955).