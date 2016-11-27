# Digilent Basys-3 'blinky' Design

11/27/2016 D. W. Hawkins (dwh@caltech.edu)

The 'blinky' LED design is a minimal demonstration of the Basys-3 board.
The design generates a count on the LEDs and hex display. The center
push button is reset, while the other four push buttons light the
decimal points on the hex display. The switches invert the state of
the LEDs.

To synthesize the design;

* Start Vivado.
* Use the Tcl console to change directory to the project folder, eg.,
~~~~
tcl> cd {C:\github\hdl\boards\xilinx\digilent_basys3\blinky}
~~~~
* Source the synthesis script, i.e.,
~~~~
tcl> source scripts/synth.tcl
~~~~
* After the bit-file is generated, program the Basys-3 board.
