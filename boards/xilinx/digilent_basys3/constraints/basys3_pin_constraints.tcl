# -----------------------------------------------------------------
# basys3_pin_constraints.tcl
#
# 10/22/2016 D. W. Hawkins (dwh@caltech.edu)
#
# Digilent Basys-3 pin constraints file.
#
# This script creates an array of key-value pairs for each port in
# the design using standard Tcl syntax. At the end of the script,
# the array is parsed, and the key-value pairs are applied to the
# design using Vivado commands.
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
#    C:\temp\vivado\basys3\blinky\vwork\project_1.runs\synth_1\runme.log
#    C:\temp\vivado\basys3\blinky\vwork\project_1.runs\impl_1\runme.log
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
puts "basys3_pin_constraints.tcl: Running the pin constraints file!"

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
set pin(clk) {PACKAGE_PIN = W5, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# Buttons
# -----------------------------------------------------------------
#
# Inputs
set pin(btn_c) {PACKAGE_PIN = U18, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(btn_u) {PACKAGE_PIN = T18, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(btn_l) {PACKAGE_PIN = W19, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(btn_r) {PACKAGE_PIN = T17, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(btn_d) {PACKAGE_PIN = U17, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# Switches
# -----------------------------------------------------------------
#
# Inputs
set pin(sw[0])  {PACKAGE_PIN = V17, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[1])  {PACKAGE_PIN = V16, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[2])  {PACKAGE_PIN = W16, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[3])  {PACKAGE_PIN = W17, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[4])  {PACKAGE_PIN = W15, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[5])  {PACKAGE_PIN = V15, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[6])  {PACKAGE_PIN = W14, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[7])  {PACKAGE_PIN = W13, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[8])  {PACKAGE_PIN =  V2, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[9])  {PACKAGE_PIN =  T3, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[10]) {PACKAGE_PIN =  T2, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[11]) {PACKAGE_PIN =  R3, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[12]) {PACKAGE_PIN =  W2, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[13]) {PACKAGE_PIN =  U1, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[14]) {PACKAGE_PIN =  T1, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}
set pin(sw[15]) {PACKAGE_PIN =  R2, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# LEDs
# -----------------------------------------------------------------
#
# Outputs
set pin(led[0])  {PACKAGE_PIN = U16, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[1])  {PACKAGE_PIN = E19, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[2])  {PACKAGE_PIN = U19, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[3])  {PACKAGE_PIN = V19, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[4])  {PACKAGE_PIN = W18, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[5])  {PACKAGE_PIN = U15, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[6])  {PACKAGE_PIN = U14, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[7])  {PACKAGE_PIN = V14, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[8])  {PACKAGE_PIN = V13, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[9])  {PACKAGE_PIN =  V3, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[10]) {PACKAGE_PIN =  W3, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[11]) {PACKAGE_PIN =  U3, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[12]) {PACKAGE_PIN =  P3, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[13]) {PACKAGE_PIN =  N3, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[14]) {PACKAGE_PIN =  P1, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[15]) {PACKAGE_PIN =  L1, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# Hexadecimal display
# -----------------------------------------------------------------
#
# Outputs
#
# Anodes
set pin(hex_an[0])  {PACKAGE_PIN = U2, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_an[1])  {PACKAGE_PIN = U4, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_an[2])  {PACKAGE_PIN = V4, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_an[3])  {PACKAGE_PIN = W4, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# Segments
set pin(hex_seg[0]) {PACKAGE_PIN = W7, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_seg[1]) {PACKAGE_PIN = W6, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_seg[2]) {PACKAGE_PIN = U8, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_seg[3]) {PACKAGE_PIN = V8, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_seg[4]) {PACKAGE_PIN = U5, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_seg[5]) {PACKAGE_PIN = V5, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hex_seg[6]) {PACKAGE_PIN = U7, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# Decimal point
set pin(hex_dp)     {PACKAGE_PIN = V7, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# UART Interface
# -----------------------------------------------------------------
#
# FPGA-side UART receiver (input)
set pin(uart_rxd) {PACKAGE_PIN = B18, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}

# FPGAside UART transmitter (output)
set pin(uart_txd) {PACKAGE_PIN = A18, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# VGA Interface
# -----------------------------------------------------------------
#
set pin(vga_hsync) {PACKAGE_PIN = P19, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_vsync) {PACKAGE_PIN = R19, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

set pin(vga_r[0])  {PACKAGE_PIN = G19, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_r[1])  {PACKAGE_PIN = H19, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_r[2])  {PACKAGE_PIN = J19, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_r[3])  {PACKAGE_PIN = N19, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

set pin(vga_g[0])  {PACKAGE_PIN = J17, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_g[1])  {PACKAGE_PIN = H17, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_g[2])  {PACKAGE_PIN = G17, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_g[3])  {PACKAGE_PIN = D17, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

set pin(vga_b[0])  {PACKAGE_PIN = N18, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_b[1])  {PACKAGE_PIN = L18, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_b[2])  {PACKAGE_PIN = K18, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_b[3])  {PACKAGE_PIN = J18, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# PS/2 Interface
# -----------------------------------------------------------------
#
set pin(ps2_clk)  {PACKAGE_PIN = C17, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, PULLUP = TRUE, OFFCHIP_TERM = NONE}
set pin(ps2_data) {PACKAGE_PIN = B17, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, PULLUP = TRUE, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# QSPI Flash
# -----------------------------------------------------------------
#
# The QSPI clock signal uses the CCLK configuration pin. This pin
# must be accessed by instantiating the STARTUPE2 primitive.
#
set pin(qspi_cs_n)  {PACKAGE_PIN = K19, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(qspi_dq[0]) {PACKAGE_PIN = D18, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(qspi_dq[1]) {PACKAGE_PIN = D19, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(qspi_dq[2]) {PACKAGE_PIN = G18, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(qspi_dq[3]) {PACKAGE_PIN = F18, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# Pmods
# -----------------------------------------------------------------
#
# Pmod Header JA
set pin(pmod_a[0]) {PACKAGE_PIN = J1, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_a[1]) {PACKAGE_PIN = L2, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_a[2]) {PACKAGE_PIN = J2, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_a[3]) {PACKAGE_PIN = G2, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_a[4]) {PACKAGE_PIN = H1, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_a[5]) {PACKAGE_PIN = K2, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_a[6]) {PACKAGE_PIN = H2, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_a[7]) {PACKAGE_PIN = G3, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# Pmod Header JB
set pin(pmod_b[0]) {PACKAGE_PIN = A14, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_b[1]) {PACKAGE_PIN = A16, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_b[2]) {PACKAGE_PIN = B15, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_b[3]) {PACKAGE_PIN = B16, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_b[4]) {PACKAGE_PIN = A15, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_b[5]) {PACKAGE_PIN = A17, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_b[6]) {PACKAGE_PIN = C15, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_b[7]) {PACKAGE_PIN = C16, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# Pmod Header JC
set pin(pmod_c[0]) {PACKAGE_PIN = K17, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_c[1]) {PACKAGE_PIN = M18, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_c[2]) {PACKAGE_PIN = N17, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_c[3]) {PACKAGE_PIN = P18, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_c[4]) {PACKAGE_PIN = L17, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_c[5]) {PACKAGE_PIN = M19, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_c[6]) {PACKAGE_PIN = P17, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_c[7]) {PACKAGE_PIN = R18, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# Pmod Header JXADC
set pin(pmod_d[0]) {PACKAGE_PIN = J3, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_d[1]) {PACKAGE_PIN = L3, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_d[2]) {PACKAGE_PIN = M2, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_d[3]) {PACKAGE_PIN = N2, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_d[4]) {PACKAGE_PIN = K3, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_d[5]) {PACKAGE_PIN = M3, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_d[6]) {PACKAGE_PIN = M1, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_d[7]) {PACKAGE_PIN = N1, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

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
			puts "basys3_pin_constraints.tcl: $portname = $val"
		}

		# Execute the Vivado constraint
		set_property $key $val $port
	}
}