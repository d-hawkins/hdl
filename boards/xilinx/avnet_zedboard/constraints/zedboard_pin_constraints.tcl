# -----------------------------------------------------------------------------
# zedboard_pin_constraints.tcl
#
# 5/18/2019 D. W. Hawkins (dwh@caltech.edu)
#
# Avnet Zedboard pin constraints file.
#
# This script creates an array of key-value pairs for each port in
# the design using standard Tcl syntax. At the end of the script,
# the array is parsed, and the key-value pairs are applied to the
# design using Vivado commands.
#
# This script is based on the Avnet Zedboard XDC file;
#
# http://zedboard.org/sites/default/files/documentations/zedboard_master_XDC_RevC_D_v3.zip
#
# This script contains the pin assignments for the Programmable
# Logic (PL) portion of the design. The Processor System (PS)
# pin assignments are defined by the Zynq First Stage Bootloader
# (FSBL).
#
# -----------------------------------------------------------------------------
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
#    hdl\boards\xilinx\avnet_zedboard\blinky\vwork\project_1.runs\synth_1\runme.log
#    hdl\boards\xilinx\avnet_zedboard\blinky\vwork\project_1.runs\impl_1\runme.log
#
#    The Tcl command "set_property PACKAGE_PIN ..." should only be
#    used during implementation. The command will fail if called
#    during synthesis. To restrict this file to implementation
#    only, use the set_property command to set the constraints
#    file used_in_synthesis and used_in_simulation flags to false.
#
# -----------------------------------------------------------------------------
# References
# ----------
#
# [1] Avnet, "Zedboard Hardware User Guide", 2.2, 2/27/2014.
#     http://zedboard.org/sites/default/files/documentations/ZedBoard_HW_UG_v2_2.pdf
#
# [2] Avnet, "Zedboard Schematic", revision D.2, 3/4/2013.
#     http://zedboard.org/sites/default/files/documentations/ZedBoard_RevD.2_Schematic_130516.pdf
#
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Constraints script message
# -----------------------------------------------------------------------------
#
puts "zedboard_pin_constraints.tcl: Running the pin constraints file!"

# =============================================================================
# Pin constraints
# =============================================================================
#
# -----------------------------------------------------------------------------
# Unused pins
# -----------------------------------------------------------------------------

#set_property BITSTREAM.CONFIG.UNUSEDPIN Pulldown [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup   [current_design]
#set_property BITSTREAM.CONFIG.UNUSEDPIN Pullnone [current_design]

# ----------------------------------------------------------------------------
# Adjustable Bank Voltage
# ----------------------------------------------------------------------------
#
# Banks 34 and 35 connect VCCO = VADJ (p11 [2]).
# The default VADJ bank voltage is 2.5V.
#
if {![info exist VADJ]} {
#	set VADJ LVCMOS33
	set VADJ LVCMOS25
#	set VADJ LVCMOS18
}

# ----------------------------------------------------------------------------
# Power-on Pull-up
# ----------------------------------------------------------------------------
#
# PUDC_B  Description
# ------  -----------
#  Low    Internal pull-up resistors are enabled  on each SelectIO pin
#  High   Internal pull-up resistors are disabled on each SelectIO pin
#
# The state of the PUDC_B pin effects the state of the I/O from power-on
# until configuration completes.
#
# The Zedboard connects PUDC_B to a 1k pull-down, a 10k pull-up, and
# jumper JP5. Jumper JP5 is not installed but deault, so the default
# logic level on PUDC_B is low, i.e., pull-ups enabled on power-on.
#
# Bank 34, VCCO = VADJ (p11 [2])
set pin(pudc_b) [list PACKAGE_PIN = K16, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]

# ----------------------------------------------------------------------------
# 100MHz Clock
# ----------------------------------------------------------------------------
#
# Bank 13, VCCO = 3.3V (p11 [2])
set pin(clk_100mhz) {PACKAGE_PIN = Y9, IOSTANDARD = LVCMOS33, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------------------
# User LEDs
# -----------------------------------------------------------------------------
#
# Bank 33, VCCO = 3.3V (p11 [2])
set pin(led[0]) {PACKAGE_PIN = T22, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[1]) {PACKAGE_PIN = T21, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[2]) {PACKAGE_PIN = U22, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[3]) {PACKAGE_PIN = U21, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[4]) {PACKAGE_PIN = V22, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[5]) {PACKAGE_PIN = W22, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[6]) {PACKAGE_PIN = U19, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(led[7]) {PACKAGE_PIN = U14, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------------------
# Push Buttons
# -----------------------------------------------------------------------------
#
# The push button port, pb[], is indexed based on the top-to-bottom arrangement
# on the PCB, i.e.,
#
#  Index  Button
#  -----  ------
#    0    BTNU
#    1    BTNL
#    2    BTNC
#    3    BTNR
#    4    BTND
#
# Bank 34, VCCO = VADJ (p11 [2])
set pin(pb[0]) [list PACKAGE_PIN = T18, IOSTANDARD = $VADJ, OFFCHIP_TERM = NONE]
set pin(pb[1]) [list PACKAGE_PIN = N15, IOSTANDARD = $VADJ, OFFCHIP_TERM = NONE]
set pin(pb[2]) [list PACKAGE_PIN = P16, IOSTANDARD = $VADJ, OFFCHIP_TERM = NONE]
set pin(pb[3]) [list PACKAGE_PIN = R18, IOSTANDARD = $VADJ, OFFCHIP_TERM = NONE]
set pin(pb[4]) [list PACKAGE_PIN = R16, IOSTANDARD = $VADJ, OFFCHIP_TERM = NONE]

# -----------------------------------------------------------------------------
# DIP Switches
# -----------------------------------------------------------------------------
#
# Bank 35, VCCO = VADJ (p11 [2])
set pin(sw[0]) [list PACKAGE_PIN = F22, IOSTANDARD = $VADJ, OFFCHIP_TERM = NONE]
set pin(sw[1]) [list PACKAGE_PIN = G22, IOSTANDARD = $VADJ, OFFCHIP_TERM = NONE]
set pin(sw[2]) [list PACKAGE_PIN = H22, IOSTANDARD = $VADJ, OFFCHIP_TERM = NONE]
set pin(sw[3]) [list PACKAGE_PIN = F21, IOSTANDARD = $VADJ, OFFCHIP_TERM = NONE]
set pin(sw[4]) [list PACKAGE_PIN = H19, IOSTANDARD = $VADJ, OFFCHIP_TERM = NONE]
set pin(sw[5]) [list PACKAGE_PIN = H18, IOSTANDARD = $VADJ, OFFCHIP_TERM = NONE]
set pin(sw[6]) [list PACKAGE_PIN = H17, IOSTANDARD = $VADJ, OFFCHIP_TERM = NONE]
set pin(sw[7]) [list PACKAGE_PIN = M15, IOSTANDARD = $VADJ, OFFCHIP_TERM = NONE]

# -----------------------------------------------------------------------------
# OLED Display
# -----------------------------------------------------------------------------
#
# Bank 13, VCCO = 3.3V (p11 [2])
set pin(oled_sclk) {PACKAGE_PIN = AB12, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(oled_sdin) {PACKAGE_PIN = AA12, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(oled_dc)   {PACKAGE_PIN = U10,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(oled_res)  {PACKAGE_PIN = U9,   IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(oled_vbat) {PACKAGE_PIN = U11,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(oled_vdd)  {PACKAGE_PIN = U12,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------------------
# VGA
# -----------------------------------------------------------------------------
#
# Bank 33, VCCO = 3.3V (p11 [2])
set pin(vga_hsync) {PACKAGE_PIN = AA19, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_vsync) {PACKAGE_PIN = Y19,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_r[0])  {PACKAGE_PIN = V20,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_r[1])  {PACKAGE_PIN = U20,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_r[2])  {PACKAGE_PIN = V19,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_r[3])  {PACKAGE_PIN = V18,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_g[0])  {PACKAGE_PIN = AB22, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_g[1])  {PACKAGE_PIN = AA22, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_g[2])  {PACKAGE_PIN = AB21, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_g[3])  {PACKAGE_PIN = AA21, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_b[0])  {PACKAGE_PIN = Y21,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_b[1])  {PACKAGE_PIN = Y20,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_b[2])  {PACKAGE_PIN = AB20, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(vga_b[3])  {PACKAGE_PIN = AB19, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------------------
# HDMI
# -----------------------------------------------------------------------------
#
# Bank 33, VCCO = 3.3V (p11 [2])
set pin(hdmi_clk)    {PACKAGE_PIN = W18,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_scl)    {PACKAGE_PIN = AA18, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_sda)    {PACKAGE_PIN = Y16,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_int)    {PACKAGE_PIN = W16,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_de)     {PACKAGE_PIN = U16,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_hsync)  {PACKAGE_PIN = V17,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_vsync)  {PACKAGE_PIN = W17,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_spdif)  {PACKAGE_PIN = U15,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_spdifo) {PACKAGE_PIN = Y18,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[0])   {PACKAGE_PIN = Y13,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[1])   {PACKAGE_PIN = AA13, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[2])   {PACKAGE_PIN = AA14, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[3])   {PACKAGE_PIN = Y14,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[4])   {PACKAGE_PIN = AB15, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[5])   {PACKAGE_PIN = AB16, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[6])   {PACKAGE_PIN = AA16, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[7])   {PACKAGE_PIN = AB17, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[8])   {PACKAGE_PIN = AA17, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[9])   {PACKAGE_PIN = Y15,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[10])  {PACKAGE_PIN = W13,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[11])  {PACKAGE_PIN = W15,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[12])  {PACKAGE_PIN = V15,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[13])  {PACKAGE_PIN = U17,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[14])  {PACKAGE_PIN = V14,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(hdmi_d[15])  {PACKAGE_PIN = V13,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------------------
# Audio Codec
# -----------------------------------------------------------------------------
#
# Bank 13, VCCO = 3.3V (p11 [2])
set pin(audio_mclk)    {PACKAGE_PIN = AB2, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(audio_sck)     {PACKAGE_PIN = AB4, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(audio_sda)     {PACKAGE_PIN = AB5, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(audio_adr[0])  {PACKAGE_PIN = AB1, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(audio_adr[1])  {PACKAGE_PIN = Y5,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(audio_gpio[0]) {PACKAGE_PIN = Y8,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(audio_gpio[1]) {PACKAGE_PIN = AA7, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(audio_gpio[2]) {PACKAGE_PIN = AA6, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(audio_gpio[3]) {PACKAGE_PIN = Y6,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------------------
# USB OTG
# -----------------------------------------------------------------------------
#
# Reset
# Bank 35, VCCO = VADJ (p11 [2])
set pin(usb_otg_reset_n) [list PACKAGE_PIN = G17, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]

# VBUS enable
# Bank 34, VCCO = VADJ (p11 [2])
set pin(usb_otg_vbus_n)  [list PACKAGE_PIN = L16, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]

# -----------------------------------------------------------------------------
# Pmod-A (single-ended signals)
# -----------------------------------------------------------------------------
#
# Bank 13, VCCO = 3.3V (p11 [2])
set pin(pmod_a[0]) {PACKAGE_PIN = Y11,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_a[1]) {PACKAGE_PIN = AA11, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_a[2]) {PACKAGE_PIN = Y10,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_a[3]) {PACKAGE_PIN = AA9,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_a[4]) {PACKAGE_PIN = AB11, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_a[5]) {PACKAGE_PIN = AB10, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_a[6]) {PACKAGE_PIN = AB9,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_a[7]) {PACKAGE_PIN = AA8,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------------------
# Pmod-B (single-ended signals)
# -----------------------------------------------------------------------------
#
# Bank 13, VCCO = 3.3V (p11 [2])
set pin(pmod_b[0]) {PACKAGE_PIN = W12, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_b[1]) {PACKAGE_PIN = W11, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_b[2]) {PACKAGE_PIN = V10, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_b[3]) {PACKAGE_PIN = W8,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_b[4]) {PACKAGE_PIN = V12, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_b[5]) {PACKAGE_PIN = W10, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_b[6]) {PACKAGE_PIN = V9,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_b[7]) {PACKAGE_PIN = V8,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------------------
# Pmod-C (differential signals)
# -----------------------------------------------------------------------------
#
# Bank 13, VCCO = 3.3V (p11 [2])
set pin(pmod_c_p[0]) {PACKAGE_PIN = AB7, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_c_n[0]) {PACKAGE_PIN = AB6, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_c_p[1]) {PACKAGE_PIN = Y4,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_c_n[1]) {PACKAGE_PIN = AA4, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_c_p[2]) {PACKAGE_PIN = R6,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_c_n[2]) {PACKAGE_PIN = T6,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_c_p[3]) {PACKAGE_PIN = T4,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_c_n[3]) {PACKAGE_PIN = U4,  IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------------------
# Pmod-D (differential signals)
# -----------------------------------------------------------------------------
#
# Bank 13, VCCO = 3.3V (p11 [2])
set pin(pmod_d_p[0]) {PACKAGE_PIN = V7, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_d_n[0]) {PACKAGE_PIN = W7, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_d_p[1]) {PACKAGE_PIN = V5, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_d_n[1]) {PACKAGE_PIN = V4, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_d_p[2]) {PACKAGE_PIN = W6, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_d_n[2]) {PACKAGE_PIN = W5, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_d_p[3]) {PACKAGE_PIN = U6, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod_d_n[3]) {PACKAGE_PIN = U5, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------------------
# FMC-LPC 3.3V Signals (p2 [2])
# -----------------------------------------------------------------------------
#
# I2C
# Bank 13, VCCO = 3.3V (p11 [2])
set pin(fmc_scl)   {PACKAGE_PIN = R7,   IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(fmc_sda)   {PACKAGE_PIN = U7,   IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# Present
# Bank 33, VCCO = 3.3V (p11 [2])
set pin(fmc_prsnt) {PACKAGE_PIN = AB14, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------------------
# FMC-LPC Adjustable Voltage Signals (p2 [2])
# -----------------------------------------------------------------------------
#
# TODO:
# Single-ended versus differential configurations
# - do the top-level pin assignments need to change?
#
# Default VADJ bank voltage is 1.8V
if {![info exist VADJ]} {
#	set VADJ LVCMOS33
#	set VADJ LVCMOS25
	set VADJ LVCMOS18
}

# Clock
# Bank 34, VCCO = VADJ (p11 [2])
set pin(fmc_clk_p[0]) [list PACKAGE_PIN = L18, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_clk_n[0]) [list PACKAGE_PIN = L19, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
# Bank 35, VCCO = VADJ (p11 [2])
set pin(fmc_clk_p[1]) [list PACKAGE_PIN = D18, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_clk_n[1]) [list PACKAGE_PIN = C19, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]

# LA[0] and LA[1] connect to clock-capable pins
# Bank 34, VCCO = VADJ (p11 [2])
set pin(fmc_la_p[0])  [list PACKAGE_PIN = M19, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[0])  [list PACKAGE_PIN = M20, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[1])  [list PACKAGE_PIN = N19, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[1])  [list PACKAGE_PIN = N20, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[2])  [list PACKAGE_PIN = P17, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[2])  [list PACKAGE_PIN = P18, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[3])  [list PACKAGE_PIN = N22, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[3])  [list PACKAGE_PIN = P22, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[4])  [list PACKAGE_PIN = M21, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[4])  [list PACKAGE_PIN = M22, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[5])  [list PACKAGE_PIN = J18, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[5])  [list PACKAGE_PIN = K18, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[6])  [list PACKAGE_PIN = L21, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[6])  [list PACKAGE_PIN = L22, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[7])  [list PACKAGE_PIN = T16, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[7])  [list PACKAGE_PIN = T17, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
#
set pin(fmc_la_p[8])  [list PACKAGE_PIN = J21, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[8])  [list PACKAGE_PIN = J22, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[9])  [list PACKAGE_PIN = R20, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[9])  [list PACKAGE_PIN = R21, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[10]) [list PACKAGE_PIN = R19, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[10]) [list PACKAGE_PIN = T19, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[11]) [list PACKAGE_PIN = N17, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[11]) [list PACKAGE_PIN = N18, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[12]) [list PACKAGE_PIN = P20, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[12]) [list PACKAGE_PIN = P21, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[13]) [list PACKAGE_PIN = L17, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[13]) [list PACKAGE_PIN = M17, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[14]) [list PACKAGE_PIN = K19, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[14]) [list PACKAGE_PIN = K20, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[15]) [list PACKAGE_PIN = J16, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[15]) [list PACKAGE_PIN = J17, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
#
set pin(fmc_la_p[16]) [list PACKAGE_PIN = J20, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[16]) [list PACKAGE_PIN = K21, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
#
# LA[17] and LA[18] connect to clock-capable pins
# Bank 34, VCCO = VADJ (p11 [2])
set pin(fmc_la_p[17]) [list PACKAGE_PIN = B19, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[17]) [list PACKAGE_PIN = B20, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[18]) [list PACKAGE_PIN = D20, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[18]) [list PACKAGE_PIN = C20, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[19]) [list PACKAGE_PIN = G15, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[19]) [list PACKAGE_PIN = G16, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[20]) [list PACKAGE_PIN = G20, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[20]) [list PACKAGE_PIN = G21, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[21]) [list PACKAGE_PIN = E19, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[21]) [list PACKAGE_PIN = E20, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[22]) [list PACKAGE_PIN = G19, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[22]) [list PACKAGE_PIN = F19, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[23]) [list PACKAGE_PIN = E15, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[23]) [list PACKAGE_PIN = D15, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
#
set pin(fmc_la_p[24]) [list PACKAGE_PIN = A18, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[24]) [list PACKAGE_PIN = A19, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[25]) [list PACKAGE_PIN = D22, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[25]) [list PACKAGE_PIN = C22, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[26]) [list PACKAGE_PIN = F18, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[26]) [list PACKAGE_PIN = E18, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[27]) [list PACKAGE_PIN = E21, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[27]) [list PACKAGE_PIN = D21, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[28]) [list PACKAGE_PIN = A16, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[28]) [list PACKAGE_PIN = A17, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[29]) [list PACKAGE_PIN = C17, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[29]) [list PACKAGE_PIN = C18, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[30]) [list PACKAGE_PIN = C15, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[30]) [list PACKAGE_PIN = B15, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[31]) [list PACKAGE_PIN = B16, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[31]) [list PACKAGE_PIN = B17, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
#
set pin(fmc_la_p[32]) [list PACKAGE_PIN = A21, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[32]) [list PACKAGE_PIN = A22, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_p[33]) [list PACKAGE_PIN = B21, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(fmc_la_n[33]) [list PACKAGE_PIN = B22, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]


# -----------------------------------------------------------------------------
# XADC GIO
# -----------------------------------------------------------------------------
#
# Bank 34, VCCO = VADJ (p11 [2])
set pin(xadc_gio[0]) [list PACKAGE_PIN = H15, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(xadc_gio[1]) [list PACKAGE_PIN = R15, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(xadc_gio[2]) [list PACKAGE_PIN = K15, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(xadc_gio[3]) [list PACKAGE_PIN = J15, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]

# ----------------------------------------------------------------------------
# XADC ADC Channels
# ----------------------------------------------------------------------------
#
# Bank 33, VCCO = VADJ (p11 [2])
#
# XADC channel 0
set pin(xadc_ad0_p) [list PACKAGE_PIN = F16, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(xadc_ad0_n) [list PACKAGE_PIN = E16, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
#
# XADC channel 8
set pin(xadc_ad8_p) [list PACKAGE_PIN = D16, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]
set pin(xadc_ad8_n) [list PACKAGE_PIN = D17, IOSTANDARD = $VADJ, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE]

# =============================================================================
# Vivado commands
# =============================================================================
#
# Get the list of ports in the constraints
set ports_allowed [lsort [array names pin]]
#puts "Ports allowed: $ports_allowed"

# Get the list of ports used in the design
# * use concat to add parantheses to ports with indexed names
#   eg., led[0] becomes {led[0]} which matches the
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
			puts "zedboard_pin_constraints.tcl: $portname = $val"
		}

		# Execute the Vivado constraint
		set_property $key $val $port
	}
}