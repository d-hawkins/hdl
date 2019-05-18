# -----------------------------------------------------------------
# synth.tcl
#
# 11/26/2016 D. W. Hawkins (dwh@caltech.edu)
#
# Digilent Arty C.0 'blinky' Vivado synthesis script.
#
# Script execution;
#
# 1. Start Vivado
#
# 2. Change directory to the project folder
#
# 3. Source the synthesis script, eg.,
#
#    tcl> source scripts/synth.tcl
#
# The script will create the vwork/ directory, create a project,
# and setup the source and constraints.
#
# The user can then synthesize the design, generate the bit-file,
# and then configure the board. For example, once the Vivado GUI
# for the project opens, click "Generate Bitstream" and when that
# completes, use the hardware manager to detect the board, and
# program it.
#
# -----------------------------------------------------------------
# Notes
# -----
#
# 1. Synthesis Tcl script
#
#    This synthesis script was created based on the output from
#    "File->Project->Write Tcl", or "File->Write Project Tcl" on
#    older tool versions, after manually creating a project.
#    The generated script was rearranged and redundant default
#    settings were eliminated.
#
# 2. Digilent Vivado Board Files
#
#    Vivado can be used to manually construct a project targeting
#    the Arty board after installing the Digilent board file
#    for the Arty board.
#
#    Digilent Github repo:
#    https://github.com/Digilent/vivado-boards
#
#    There are several Arty versions:
#    https://store.digilentinc.com/arty
#
#    This script targets the Arty Revision C.0 hardware:
#    https://github.com/Digilent/vivado-boards/tree/master/new/board_files/arty/C.0
#
#    Check out the repo and copy the board file into the
#    Vivado installation folder:
#    C:\software\Xilinx\Vivado\<version>\data\boards\board_files
#
#    Do not copy all the board files from the repo, since not
#    all versions of Vivado support all boards.
#
#    Manual project creation can be used to update this script,
#    after writing the project Tcl file to determine any new
#    features supported by Vivado.
#
#    This script does not require the Arty board file to run.
#    The script uses the device details, not the "board_part"
#    Vivado Tcl property.
#
# 3. Vivado synthesis (and hardware download) tests
#
#    5/18/2019: Vivado 2017.4.1
#    5/18/2019: Vivado 2018.2.1
#
# -----------------------------------------------------------------
# References
# ----------
#
# [1] Digilent, "Arty", Revisions A-C reference documentation.
#     https://reference.digilentinc.com/reference/programmable-logic/arty/start
#
# -----------------------------------------------------------------

# -----------------------------------------------------------------
# Tool check
# -----------------------------------------------------------------
#
# Check the tool is Vivado
set toolname [file rootname [file tail [info nameofexecutable]]]
if {![string equal $toolname "vivado"]} {
	error "Error: unexpected tool name '$toolname'!"
}

# Vivado version
set toolversion [lindex [split [version -short] .] 0]
if {![string length $toolversion]} {
	error "Error: tool version could not be detected!"
}

# -----------------------------------------------------------------
# Location check
# -----------------------------------------------------------------
#
# Check the current directory is the project folder
set path [pwd]
set folders [file split $path]
set length [llength $folders]
set dirname [lindex $folders [expr {$length-1}]]
if {[string equal blinky $dirname] != 1} {
	puts "Error: please run this script from the blinky/ folder!"
	return
}

# -----------------------------------------------------------------
# Source locations
# -----------------------------------------------------------------
#
# The synthesis script is called from the blinky project folder;
#  * hdl/boards/xilinx/digilent_arty/blinky/
#
# The following paths are defined relative to the github basename
# (which is typically hdl, but could be renamed).
#
set path [file split [pwd]]
set len  [llength $path]
set hdl  [file join {*}[lrange $path 0 [expr {$len - 5}]]]

# Library source
set lib         $hdl/lib

# Board and common constraints
set board       $hdl/boards/xilinx/digilent_arty
set constraints $board/constraints

# Project source
set src         $board/blinky/src

# -----------------------------------------------------------------
# Project
# -----------------------------------------------------------------
#
# Project settings
set project(name) blinky
set project(path) vwork
set project(part) xc7a35ticsg324-1L

# Close any open project
catch {close_project}

# Create project
# * project commands; create_project, get_projects, current_project
create_project $project(name) $project(path) -part $project(part) -force

# Set project properties
# * to see the project properties, write out a Tcl file and
#   check the option to "Write all properties"
set obj [get_projects $project(name)]
set_property default_lib        work           $obj
set_property part               $project(part) $obj
set_property simulator_language Mixed          $obj
set_property target_language    VHDL           $obj
set_property source_mgmt_mode   None           $obj

# -----------------------------------------------------------------
# Synthesis HDL
# -----------------------------------------------------------------
#
# The following implements the minimal set of constraints.
# The individual files in a file set can have additional
# properties set, eg., whether the file is used for
# synthesis and simulation.

# Create synth_src fileset
if {[string equal [get_filesets -quiet sources_1] ""]} {
	create_fileset -srcset sources_1
}

# HDL source list
set filenames {}
#
# Library components
# (none for this project)
#
# Top-level design
lappend filenames $src/arty.vhd

# Add the HDL source to the source fileset
set obj [get_filesets sources_1]
add_files -norecurse -fileset $obj $filenames

# Set the top-level file
set_property top arty $obj

# -----------------------------------------------------------------
# Synthesis Constraints
# -----------------------------------------------------------------
#
if {[string equal [get_filesets -quiet constrs_1] ""]} {
	create_fileset -constrset constrs_1
}

# Pin constraints
set     filenames {}
lappend filenames $constraints/arty_pin_constraints.tcl
lappend filenames $constraints/arty_timing_constraints.tcl
lappend filenames $constraints/arty_device_constraints.tcl

# Add the constraint file to the constraints fileset
set obj [get_filesets constrs_1]
add_files -norecurse -fileset $obj $filenames

# The pin constraints are only used during implementation
foreach filename $filenames {
	set_property used_in_synthesis  false [get_files $filename]
	set_property used_in_simulation false [get_files $filename]
}

# -----------------------------------------------------------------
# Synthesis Run
# -----------------------------------------------------------------
#
# Flow string
set flow "Vivado Synthesis $toolversion"

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
  create_run -name synth_1 -part $project(part) -flow $flow -strategy "Vivado Synthesis Defaults" -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow $flow [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property part $project(part) $obj

# set the current synth run
current_run -synthesis $obj

# -----------------------------------------------------------------
# Implementation Run
# -----------------------------------------------------------------
#
# Flow string
set flow "Vivado Implementation $toolversion"

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
  create_run -name impl_1 -part $project(part) -flow $flow -strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow $flow [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property part $project(part) $obj

# set the current impl run
current_run -implementation $obj

# -----------------------------------------------------------------
# Generate the bitstream
# -----------------------------------------------------------------
#
launch_runs impl_1 -to_step write_bitstream -jobs 4

