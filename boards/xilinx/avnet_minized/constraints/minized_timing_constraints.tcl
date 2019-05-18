# -----------------------------------------------------------------
# minized_timing_constraints.tcl
#
# 11/21/2017 D. W. Hawkins (dwh@caltech.edu)
#
# Avnet MiniZed timing constraints file.
#
# -----------------------------------------------------------------

# -----------------------------------------------------------------
# Constraints script message
# -----------------------------------------------------------------
#
puts "minized_timing_constraints.tcl: Running the timing constraints file!"

# -----------------------------------------------------------------
# Clocks
# -----------------------------------------------------------------
#
# On-FPGA oscillator (from STARTUPE2 component)
set port [get_pins -quiet {*/CFGMCLK}]
if {[llength $port]} {
	create_clock -period 15.000 -name clk_65MHz -add $port
}

# Zynq-7 PS-to-PL FCLK clocks
set port [get_pins -quiet {*/FCLKCLK[0]}]
if {[llength $port]} {
	create_clock -period 10.000 -name fclk_100MHz -add $port
}
set port [get_pins -quiet {*/FCLKCLK[1]}]
if {[llength $port]} {
	create_clock -period 20.000 -name fclk_50MHz -add $port
}

