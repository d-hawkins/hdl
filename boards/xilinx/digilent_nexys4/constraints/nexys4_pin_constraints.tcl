# -----------------------------------------------------------------
# nexys4_pin_constraints.tcl
#
# 12/21/2016 D. W. Hawkins (dwh@caltech.edu)
#
# Digilent Nexys-4 (revision B) pin constraints file.
#
# This script creates an array of key-value pairs for each port in
# the design using standard Tcl syntax. At the end of the script,
# the array is parsed, and the key-value pairs are applied to the
# design using Vivado commands.
#
# This constraints file is based on the XDC file provided by
# Digilent located on their github site:
#
# https://github.com/Digilent/Nexys4/tree/master/Resources/XDC/Nexys4_Master.xdc
#
# Using Tcl constraints is nicer than XDC, since you can use
# Tcl conditional logic to determine if a pin is used in a
# design. That allows this Tcl constraints file to be used
# for all designs (with the caveat that the top-level port
# names much match the names used in this script).
#
# -----------------------------------------------------------------
# Notes
# ------
#
# 1. 'unmanaged' constraints file
#
#    This file is a Vivado 'unmanaged' constraints file. It will
#    not be modified by Vivado and supports all Tcl constructs.
#    XDC files support very limited Tcl syntax, eg., no
#    conditional logic.
#
# 2. Pin assignments are applied during implementation
#
#    If this file is added to a project, then Tcl puts output from
#    may appear in the following log files;
#
#    hdl\boards\xilinx\digilent_nexys4\blinky\vwork\project_1.runs\synth_1\runme.log
#    hdl\boards\xilinx\digilent_nexys4\blinky\vwork\project_1.runs\impl_1\runme.log
#
#    The Tcl command "set_property PACKAGE_PIN ..." should only be
#    used during implementation. The command will fail if called
#    during synthesis. To restrict this file to implementation
#    only, use the set_property command to set the constraints
#    file used_in_synthesis and used_in_simulation flags to false.
#
# -----------------------------------------------------------------

# -----------------------------------------------------------------
# Constraints script message
# -----------------------------------------------------------------
#
puts "nexys4_pin_constraints.tcl: Running the pin constraints file!"

# =================================================================
# Pin constraints
# =================================================================
#
# -----------------------------------------------------------------
# Unused pins
# -----------------------------------------------------------------

#set_property BITSTREAM.CONFIG.UNUSEDPIN Pulldown [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup   [current_design]
#set_property BITSTREAM.CONFIG.UNUSEDPIN Pullnone [current_design]

# -----------------------------------------------------------------
# Clock
# -----------------------------------------------------------------
#
# Input clock
set pin(clk) {PACKAGE_PIN = E3, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# Buttons
# -----------------------------------------------------------------
#
# Reset
set pin(rstN) {PACKAGE_PIN = C12, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}

# Inputs
set pin(btn_c) {PACKAGE_PIN = E16, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(btn_u) {PACKAGE_PIN = F15, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(btn_l) {PACKAGE_PIN = T16, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(btn_r) {PACKAGE_PIN = R10, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(btn_d) {PACKAGE_PIN = V10, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# Switches
# -----------------------------------------------------------------
#
# Inputs
set pin(sw[0])  {PACKAGE_PIN = U9, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[1])  {PACKAGE_PIN = U8, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[2])  {PACKAGE_PIN = R7, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[3])  {PACKAGE_PIN = R6, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[4])  {PACKAGE_PIN = R5, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[5])  {PACKAGE_PIN = V7, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[6])  {PACKAGE_PIN = V6, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[7])  {PACKAGE_PIN = V5, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[8])  {PACKAGE_PIN = U4, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[9])  {PACKAGE_PIN = V2, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[10]) {PACKAGE_PIN = U2, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[11]) {PACKAGE_PIN = T3, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[12]) {PACKAGE_PIN = T1, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[13]) {PACKAGE_PIN = R3, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[14]) {PACKAGE_PIN = P3, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[15]) {PACKAGE_PIN = P4, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# Green LEDs
# -----------------------------------------------------------------
#
# Outputs
set pin(led_g[0])  {PACKAGE_PIN = T8, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_g[1])  {PACKAGE_PIN = V9, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_g[2])  {PACKAGE_PIN = R8, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_g[3])  {PACKAGE_PIN = T6, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_g[4])  {PACKAGE_PIN = T5, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_g[5])  {PACKAGE_PIN = T4, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_g[6])  {PACKAGE_PIN = U7, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_g[7])  {PACKAGE_PIN = U6, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_g[8])  {PACKAGE_PIN = V4, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_g[9])  {PACKAGE_PIN = U3, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_g[10]) {PACKAGE_PIN = V1, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_g[11]) {PACKAGE_PIN = R1, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_g[12]) {PACKAGE_PIN = P5, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_g[13]) {PACKAGE_PIN = U1, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_g[14]) {PACKAGE_PIN = R2, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_g[15]) {PACKAGE_PIN = P2, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# RGB LEDs
# -----------------------------------------------------------------
#
# Outputs
set pin(led_rgb[0])  {PACKAGE_PIN =  K5, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_rgb[1])  {PACKAGE_PIN = F13, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_rgb[2])  {PACKAGE_PIN =  F6, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_rgb[3])  {PACKAGE_PIN =  K6, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_rgb[4])  {PACKAGE_PIN =  H6, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led_rgb[5])  {PACKAGE_PIN = L16, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# Hexadecimal displays
# -----------------------------------------------------------------
#
# Outputs
#
# Anodes
set pin(hex_an[0])  {PACKAGE_PIN = N6, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_an[1])  {PACKAGE_PIN = M6, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_an[2])  {PACKAGE_PIN = M3, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_an[3])  {PACKAGE_PIN = N5, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_an[4])  {PACKAGE_PIN = N2, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_an[5])  {PACKAGE_PIN = N4, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_an[6])  {PACKAGE_PIN = L1, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_an[7])  {PACKAGE_PIN = M1, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# Segments
set pin(hex_seg[0]) {PACKAGE_PIN = L3, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_seg[1]) {PACKAGE_PIN = N1, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_seg[2]) {PACKAGE_PIN = L5, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_seg[3]) {PACKAGE_PIN = L4, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_seg[4]) {PACKAGE_PIN = K3, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_seg[5]) {PACKAGE_PIN = M2, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_seg[6]) {PACKAGE_PIN = L6, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# Decimal point
set pin(hex_dp)     {PACKAGE_PIN = M4, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# UART Interface
# -----------------------------------------------------------------
#
# FPGA-side UART receiver (input)
set pin(uart_rxd) {PACKAGE_PIN = C4, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}

# FPGA-side UART transmitter (output)
set pin(uart_txd) {PACKAGE_PIN = D4, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# UART handshake signals
#set pin(uart_rts) {PACKAGE_PIN = D3, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
#set pin(uart_cts) {PACKAGE_PIN = E5, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
#  **** TODO ****
# -----------------------------------------------------------------
#
# Complete the conversion of the remaining XDC interfaces to Tcl


# =================================================================
# Vivado commands
# =================================================================
#
# Get the list of ports in the constraints
set ports_allowed [lsort [array names pin]]
#puts "Ports allowed: $ports_allowed"

# Get the list of ports used in the design
# * use concat to add parantheses to ports with indexed names
#   eg., hex_an[0] becomes {hex_an[0]} which matches the
#   format in ports_allowed (otherwise list search can fail)
set ports_used [lsort [concat [get_ports *]]]
#puts "Ports used   : $ports_used"

# Port assignments
foreach portname $ports_used {

	# Check the port matches an allowed port
	# * use -exact so that square brackets are not interpreted
	#   as a regex pattern matching command
	# * note: using Tcl error does not stop the process
	if {[lsearch -exact $ports_allowed $portname] == -1} {
		puts "WARNING: '$portname' is not a recognized port name!"
		continue
	}

	# Port object
	set port [get_ports $portname]

	# Convert the comma separated list into a Tcl list
	set options [split $pin($portname) ,]

	# Process each key-value pair
	foreach option $options {

		# Extract the key and value
		set keyval [split $option =]
		set key [lindex $keyval 0]
		set val [lindex $keyval 1]

		# Strip whitespace
		set key [string trim $key]
		set val [string trim $val]

		# Generate a log message for pin assignments
		if {[string equal $key "PACKAGE_PIN"] == 1} {
			puts "nexys4_pin_constraints.tcl: $portname = $val"
		}

		# Execute the Vivado constraint
		set_property $key $val $port
	}
}