# Avnet MiniZed 'blinky_osc' Design

11/21/2017 D. W. Hawkins (dwh@caltech.edu)

The 'blinky_osc' LED design is a minimal demonstration of the MiniZed board.
The design blinks the blue DONE and the green/red bi-color RGB LEDs. The design
uses the 65MHz on-FPGA oscillator (accessed via the STARTUPE2 component).

This design does not use the Zynq-7 processor block.

To synthesize the design;

* Start Vivado.
* Use the Tcl console to change directory to the project folder, eg.,
~~~~
tcl> cd {C:\github\d-hawkins\hdl\boards\xilinx\avnet_minized\blinky_osc}
~~~~
* Source the synthesis script, i.e.,
~~~~
tcl> source scripts/synth.tcl
~~~~
* After the bit-file is generated, program the MiniZed board.
