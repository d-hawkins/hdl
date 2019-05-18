# Digilent Arty 'blinky' Design

11/27/2016 D. W. Hawkins (dwh@caltech.edu)

The 'blinky' LED design is a minimal demonstration of the Arty board.
The design generates a count on the green and RGB LEDs. The switches and
push buttons invert the state of the green LEDs.

To synthesize the design;

* Start Vivado.
* Use the Tcl console to change directory to the project folder, eg.,
~~~~
tcl> cd {C:\github\d-hawkins\hdl\boards\xilinx\digilent_arty\blinky}
~~~~
* Source the synthesis script, i.e.,
~~~~
tcl> source scripts/synth.tcl
~~~~
* After the bit-file is generated, program the Arty board.
