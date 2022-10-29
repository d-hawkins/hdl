# Avnet Ultra96 CFGMCLK Blinky LED Example

10/29/2022 D. W. Hawkins (dwh@caltech.edu)

This example design demonstrates how the STARTUPE3 CFGMCLK can be used as the fabric clock source.

The design use the CFGMCLK source to blink the green DONE LED.

## Bitstream Generation

1. Start Vivado

2. Change directory to the project folder, eg.,

~~~
	cd {c:\github\d-hawkins\hdl\boards\xilinx\avnet_ultra96\blinky_cfgmclk}
~~~

3. Run the synthesis script

~~~
	source -notrace scripts/synth.tcl
~~~
