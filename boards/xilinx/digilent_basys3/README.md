# Digilent Basys-3

10/22/2016 D. W. Hawkins (dwh@caltech.edu)

# Introduction
This directory contains example designs for the Digilent Basys-3 board.

Digilent provides an extensive reference manual and reference designs for this board - see the Resources below.

# Features

* Xilinx Artix-7 (XC7A35T-1CPG236C) FPGA
* 33,280 logic cells in 5,200 slices (each slice contains four 6-input LUTs and 8 flip-flops)
* 1,800 Kbits (50 x 36Kbits BRAMs) of fast block RAM
* Five clock management tiles, each with a phase-locked loop (PLL)
* 90 DSP slices (DSP48E1 with pre-add, 25x18-bit multiply, 48-bit post-add/accumulate)
* Internal clock speeds exceeding 450 MHz
* On-chip analog-to-digital converter (XADC)
* Digilent USB-JTAG port for FPGA programming and communication
* USB-UART Bridge
* 12-bit VGA output
* USB HID Host for mice, keyboards and memory sticks
* 16 user switches
* 16 user LEDs
* 5 user pushbuttons
* 4-digit 7-segment display
* 4 Pmod ports:
  * 3 Standard 12-pin Pmod ports
  * 1 dual purpose XADC signal / standard Pmod port

# Resources

Document | Link
---------|-----
Digilent board ($149) with Reference Manual and Schematic | http://store.digilentinc.com/basys-3-artix-7-fpga-trainer-board-recommended-for-introductory-users
Digilent Basys-3 Reference Manual | https://reference.digilentinc.com/basys3/refmanual
Tutorials | https://reference.digilentinc.com/reference/programmable-logic/basys-3/start
Digilent Github | https://github.com/Digilent
Vivado Board Files | https://github.com/Digilent/vivado-boards
Vivado Board Files Instructions | https://reference.digilentinc.com/reference/software/vivado/board-files
Basys-3 repo with XDC constraints and tutorial source | https://github.com/Digilent/Basys3
Basys-3 FPGA Configuration Guide (JTAG, QSPI, and USB-HDD) | https://reference.digilentinc.com/learn/programmable-logic/tutorials/basys-3-programming-guide/start
Digilent Github examples build procedure | https://reference.digilentinc.com/learn/software/tutorials/vivado-projects-from-digilent-github/start


# Notes
Random notes from the Digilent documentation:
* The board supports programming via JTAG, Quad-SPI flash, and from a USB stick (jumper selectable)
* The USB-UART is an FTDI FT2232HQ
* The two-channel FTDI FT2232HQ is used as a Digilent USB-JTAG programmer and a USB-UART
* The USB host controller is a PIC24FJ128
* The QSPI Flash is a 32Mbit Spansion FL032PIF (bitfiles are around 16Mbit)
* The reference clock is a 100MHz oscillator connected to W5
* The VGA DAC is implemented using FPGA outputs and resistors
* There are four PMOD connectors; one of them connects to the XADC inputs
* The Artix-7 XADC is a 1MSps 12-bit dual-channel ADC (see UG480 for details)
* The XC7A35T has two GTP transceivers, however they are not used on this board
* The schematic does not include the FTDI interface (the page is missing)
* The Tutorials web page has links to multiple tutorials, which in turn link to the github repo containing the tutorial source
