# Digilent Nexys-4 'blinky' Design

12/21/2016 D. W. Hawkins (dwh@caltech.edu)

The 'blinky' LED design is a minimal demonstration of the Nexys-4 board.
The design generates a count on the LEDs and hex displays. The center
push button is reset, while the other four push buttons light the
decimal points on the hex displays. The switches invert the state of
the LEDs.

To synthesize the design;

* Start Vivado.
* Use the Tcl console to change directory to the project folder, eg.,
~~~~
tcl> cd {C:\github\d-hawkins\hdl\boards\xilinx\digilent_nexys4\blinky}
~~~~
* Source the synthesis script, i.e.,
~~~~
tcl> source scripts/synth.tcl
~~~~
* After the bit-file is generated, program the Nexys-4 board.
