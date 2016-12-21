# -----------------------------------------------------------------
# nexys4_timing_constraints.tcl
#
# 12/21/2016 D. W. Hawkins (dwh@caltech.edu)
#
# Digilent Nexys-4 timing constraints file.
#
# -----------------------------------------------------------------

# -----------------------------------------------------------------
# Constraints script message
# -----------------------------------------------------------------
#
puts "nexys4_timing_constraints.tcl: Running the timing constraints file!"

# -----------------------------------------------------------------
# Clocks
# -----------------------------------------------------------------
#
set port [get_ports -quiet clk]
if {[llength $port]} {
	create_clock -period 10.000 -name clk_100MHz -add $port
}

