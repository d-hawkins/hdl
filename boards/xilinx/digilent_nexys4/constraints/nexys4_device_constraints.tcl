# -----------------------------------------------------------------
# nexys4_device_constraints.tcl
#
# 12/21/2016 D. W. Hawkins (dwh@caltech.edu)
#
# Digilent Nexys-4 device constraints file.
#
# -----------------------------------------------------------------
# References
# ----------
#
# [1] Xilinx, "UG470: 7 Series FPGAs Configuration User Guide",
#     version 1.11, September, 2016.
#
# [2] Digilent, "Nexys-4 schematic", rev B.1, 2013.
#
# -----------------------------------------------------------------

# -----------------------------------------------------------------
# Constraints script message
# -----------------------------------------------------------------
#
puts "nexys4_device_constraints.tcl: Running the device constraints file!"

# -----------------------------------------------------------------
# Configuration Voltage
# -----------------------------------------------------------------
#
# Suppress Implementation Warning Message
#
# Configuration bank voltage select (CFGBVS) (see p13 [1])
#  * GND  = 1.5/1.8V
#  * VCCO = 2.5/3.3V
# The Nexys-4 board has CFGBVS tied to VCCO = 3.3V (see p8 [2])
#
set_property CFGBVS         VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3  [current_design]

# -----------------------------------------------------------------
# Configuration mode
# -----------------------------------------------------------------
#
# list_property_value CONFIG_MODE [current_design]
# SPIx1 SPIx2 SPIx4 M_SERIAL S_SERIAL BPI8 BPI16 S_SELECTMAP S_SELECTMAP16 S_SELECTMAP32 B_SCAN M_SELECTMAP M_SELECTMAP16

