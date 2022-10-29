# -----------------------------------------------------------------------------
# synth.tcl
#
# 10/29/2022 D. W. Hawkins (dwh@caltech.edu)
#
# Avnet Ultra96 Vivado synthesis script.
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
# The script will create the vwork/ directory, create a project, setup the
# source and constraints, synthesize, and generate the bitstream. The user
# can then use the hardware manager to detect the board, and program it.
#
# -----------------------------------------------------------------------------
# Notes
# -----
#
# 1. Synthesis Tcl script
#
#    This synthesis script was created based on the output from
#    File->Write Project Tcl after manually creating a project.
#    The generated script was rearranged and redundant default
#    settings were eliminated.
#
# 2. Avnet Vivado Board Definition Files
#
#    Vivado can be used to manually construct a project targeting
#    the Ultra96 board after installing the board definition file.
#
#    Avnet Github repo:
#    https://github.com/Avnet/bdf
#
#    The Avnet master branch only contains the Ultra96v2 board.
#    The Ultra96v1 board can be obtained by checking out an
#    older tagged branch using:
#
#    $ git checkout tags/Ultra96v1_2018_2
#
#    When installing board files into Vivado, do not copy all the
#    board files from the repo, since not all versions of Vivado
#    support all boards (and this results in Vivado warning messages).
#
#    Manual project creation can be used to update this script,
#    after writing the project Tcl file to determine any new
#    features supported by Vivado.
#
#    This script does not require the Ultra96 board file to run.
#    The script uses the device details, not the "board_part"
#    Vivado Tcl property.
#
# 3. Vivado synthesis (and hardware download) tests
#
#    5/18/2019: Vivado 2017.4.1
#    5/18/2019: Vivado 2018.2.1
#
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Project close
# -----------------------------------------------------------------------------
#
# Close any open project (including the one created by this script)
catch {close_project}

# Clear existing Tcl project variable settings
if {[info exists project]} {
	unset project
}

# -----------------------------------------------------------------------------
# Board and Project Names
# -----------------------------------------------------------------------------
#
# Board name
# * the Vivado project is named after the board
set project(board) ultra96

# Project name
# * the script checks that project name matches the project folder name
set project(name) blinky_cfgmclk

# -----------------------------------------------------------------------------
# Tool check
# -----------------------------------------------------------------------------
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

# -----------------------------------------------------------------------------
# Location check
# -----------------------------------------------------------------------------
#
# Check the current directory is the project folder
set path [pwd]
set folders [file split $path]
set length [llength $folders]
set dirname [lindex $folders [expr {$length-1}]]
if {[string equal $project(name) $dirname] != 1} {
	puts "Error: please run this script from the $project(name)/ folder!"
	return
}

# -----------------------------------------------------------------------------
# Source locations
# -----------------------------------------------------------------------------
#
# The synthesis script is called from the project folder;
#  * hdl/boards/xilinx/avnet_ultra96/$project(name)/
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
set board       $hdl/boards/xilinx/avnet_ultra96
set constraints $board/constraints

# Project scripts and source
set scripts     $board/$project(name)/scripts
set src         $board/$project(name)/src

# -----------------------------------------------------------------------------
# Project
# -----------------------------------------------------------------------------
#
# Additional project settings
set project(path) vwork
set project(part) xczu3eg-sbva484-1-e

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
set_property target_language    Verilog        $obj
set_property source_mgmt_mode   None           $obj

# -----------------------------------------------------------------------------
# Synthesis HDL
# -----------------------------------------------------------------------------
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
# Top-level design
lappend filenames $src/$project(board).sv

# Add the HDL source to the source fileset
set obj [get_filesets sources_1]
add_files -norecurse -fileset $obj $filenames

# Set the top-level file
set_property top $project(board) $obj

# -----------------------------------------------------------------------------
# Synthesis Constraints
# -----------------------------------------------------------------------------
#
if {[string equal [get_filesets -quiet constrs_1] ""]} {
	create_fileset -constrset constrs_1
}

# Pin constraints
set     filenames {}
#
# Generic board (unmanaged) constraints
#lappend filenames $constraints/kcu105_pin_constraints.tcl
#lappend filenames $constraints/kcu105_timing_constraints.tcl
#lappend filenames $constraints/kcu105_device_constraints.tcl
#
# Project-specific XDC constraints
lappend filenames $scripts/cfgmclk.xdc
#
# Vivado ILA instance
# - none needed for this project

# Add the constraint file to the constraints fileset
set obj [get_filesets constrs_1]
add_files -norecurse -fileset $obj $filenames

# The pin constraints are only used during implementation
foreach filename $filenames {

	# Remove XDC and unmanaged Tcl files from synthesis
	set_property USED_IN_SYNTHESIS  false [get_files $filename]

	# Remove unmanaged Tcl files from simulation
	set ext [file extension $filename]
	if {[string equal $ext .tcl]} {
		set_property USED_IN_SIMULATION false [get_files $filename]
	}
}

# -----------------------------------------------------------------------------
# Synthesis Run
# -----------------------------------------------------------------------------
#
# Flow string
set flow "Vivado Synthesis $toolversion"

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
	create_run -name synth_1 -part $project(part) -flow $flow \
		-strategy "Vivado Synthesis Defaults" -constrset constrs_1
} else {
	set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
	set_property flow $flow [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property part $project(part) $obj

# set the current synth run
current_run -synthesis $obj

# -----------------------------------------------------------------------------
# Implementation Run
# -----------------------------------------------------------------------------
#
# Flow string
set flow "Vivado Implementation $toolversion"

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
	create_run -name impl_1 -part $project(part) -flow $flow \
		-strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
} else {
	set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
	set_property flow $flow [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property part $project(part) $obj

# set the current impl run
current_run -implementation $obj

# -----------------------------------------------------------------------------
# Generate the bitstream
# -----------------------------------------------------------------------------
#
launch_runs impl_1 -to_step write_bitstream -jobs 4

