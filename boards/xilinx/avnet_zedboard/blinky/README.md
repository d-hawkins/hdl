# Avnet Zedboard 'blinky' Design

5/18/2019 D. W. Hawkins (dwh@caltech.edu)

The 'blinky' LED design is a minimal demonstration of the Zedboard.
The design blinks the blue DONE LED and the 8 green LEDs. The design uses
the 100MHz external clock (connected to the PL).

To synthesize the design;

* Start Vivado.
* Use the Tcl console to change directory to the project folder, eg.,
~~~~
tcl> cd {C:\github\d-hawkins\hdl\boards\xilinx\avnet_zedboard\blinky}
~~~~
* Source the synthesis script, i.e.,
~~~~
tcl> source scripts/synth.tcl
~~~~
* After the bit-file is generated, program the Zedboard board.
