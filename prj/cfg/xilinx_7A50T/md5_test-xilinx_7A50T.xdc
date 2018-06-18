#-------------------------------------------------------------------------------
#   project:       slon5_test
#   cfg:           xilinx_7A50T
#
#   description:   slon5 start-up
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

#-------------------------------------------------------------------------------
#    ref_clk
#-------------------------------------------------------------------------------

set_property -dict {PACKAGE_PIN N11 IOSTANDARD LVCMOS33} [get_ports ref_clk]
set_switching_activity -deassert_resets

#-------------------------------------------------------------------------------
#    dnum
#-------------------------------------------------------------------------------
set_property PACKAGE_PIN M1  [get_ports {dnum[3]}]
set_property PACKAGE_PIN N1  [get_ports {dnum[2]}]
set_property PACKAGE_PIN M2  [get_ports {dnum[1]}]
set_property PACKAGE_PIN N2  [get_ports {dnum[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {dnum}]
#set_property IOB TRUE [get_ports {dnum}]

#-------------------------------------------------------------------------------
#    dout
#-------------------------------------------------------------------------------
set_property PACKAGE_PIN N3  [get_ports {dout[3]}]
set_property PACKAGE_PIN M4  [get_ports {dout[2]}]
set_property PACKAGE_PIN L4  [get_ports {dout[1]}]
set_property PACKAGE_PIN L5  [get_ports {dout[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {dout}]
#set_property IOB TRUE [get_ports {dout}]

#-------------------------------------------------------------------------------
#    sw
#-------------------------------------------------------------------------------
set_property PACKAGE_PIN N4  [get_ports {sw[3]}]
set_property PACKAGE_PIN R2  [get_ports {sw[2]}]
set_property PACKAGE_PIN R1  [get_ports {sw[1]}]
set_property PACKAGE_PIN R3  [get_ports {sw[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {sw}]
