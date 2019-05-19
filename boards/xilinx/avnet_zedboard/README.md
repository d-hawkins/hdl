# Avnet Zedboard

5/18/2019 D. W. Hawkins (dwh@caltech.edu)

# Introduction
This directory contains example designs for the Avnet Zedboard.

# Features

* Xilinx Zynq-7000 (XC7Z020CLG484-1) FPGA
* Dual-core ARM Cortex-A9
* 53,200 6-input LUTs and 106,400 registers (1 CLB = 8 LUTs + 16 registers)
* 140 36Kbits block RAM (BRAM)
* 220 DSP slices (DSP48E1 with pre-add, 25x18-bit multiply, 48-bit post-add/accumulate)
* On-chip analog-to-digital converter (XADC) with Xilinx AMS header
* 512MB Micron DDR3 (2 x MT41K128M16JT-125:K) with 32-bit data bus at up to 533MHz (1066Mbs) supported (1.5V DDR3 connected to the PS)
* 256Mb Spansion S25FL256SAGMFI00 104MHz Quad-SPI Flash (connected to the PS)
* SD card
* Digilent USB-JTAG port (FTDI FT232H)
* Cypress CY7C64225 USB-UART Bridge
* Texas Instruments TUSB1210BRHBR ULPI USB OTG 2.0
* Marvell 88E1518 10/100/1000 Mbps Ethernet
* 33.33MHz PS clock
* 100MHz PL clock
* Analog Devices ADV7511KSTZ330 HDMI
* 12-bit VGA (implemented using 3 x 4-bit resistor network DACs)
* 128 x 32 OLED (with Inteltronic/Wisechip UG-2832HSWEG04 controller interface)
* Analog Devices ADAU1761BCPZ SigmaDSP 96kHz, 24-Bit Stereo Audio Codec
* 1 push button connected to PS_SRST_B
* 1 push button connected to PROGRAM_B
* 2 PS push buttons (PB1 and PB2)
* 5 PL push buttons (arranged in a joystick pattern)
* 8 PL DIP switches
* 1 PS red LED
* 8 PL red LEDs
* 1 PL blue DONE LED
* FMC-LPC (without transceivers)
* 4 PL Pmod connectors (JA1 and B1 with 200-ohm series resistors, and JC1 and JD1 with differential routing)
* 1 PS Pmod connector (JE1 with series 200-ohm resistors)

# Resources

Document | Link
---------|-----
Zedboard Site | http://zedboard.org
Documentation | http://zedboard.org/support/documentation/1521
Reference Designs | http://zedboard.org/support/design/1521/11
Avnet Github | https://github.com/Avnet
Avnet Board Files | https://github.com/Avnet/bdf

# Configuration Mode Settings

The jumpers that control the Zedboard power-on configuration mode can be
configured as follows:

 Description  | MODE[4] | MODE[3] | MODE[2] | MODE[1] | MODE[0]
--------------|---------|---------|---------|---------|---------
 MIO bit      | MIO[6]  | MIO[5]  | MIO[4]  | MIO[3]  | MIO[2]  
 Jumper       | JP11    | JP10    | JP9     | JP8     | JP 7    
 JTAG Chain   |         |         |         |         |    0    
 JTAG Boot    |         |    0    |    0    |    0    |         
 QSPI Boot    |         |    1    |    0    |    0    |         
 SD Card Boot |         |    1    |    1    |    0    |         
 PLL Enabled  |    0    |         |         |         |         

For more details on the configuration settings, see Table 18 in the
Zedboard Hardware User's Guide and Table 6-4 "Boot Mode MIO Strapping Pins"
in the Zynq-7000 TRM (UG585).