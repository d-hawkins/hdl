# -----------------------------------------------------------------
# basys3_timing_constraints.tcl
#
# 10/22/2016 D. W. Hawkins (dwh@caltech.edu)
#
# Digilent Basys-3 timing constraints file.
#
# -----------------------------------------------------------------

# -----------------------------------------------------------------
# Constraints script message
# -----------------------------------------------------------------
#
puts "basys3_timing_constraints.tcl: Running the timing constraints file!"

# -----------------------------------------------------------------
# Clocks
# -----------------------------------------------------------------
#
set port [get_ports -quiet clk]
if {[llength $port]} {
	create_clock -period 10.000 -name clk_100MHz -add $port
}

