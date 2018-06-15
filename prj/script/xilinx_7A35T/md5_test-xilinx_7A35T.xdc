#-------------------------------------------------------------------------------
#	project:       md5_test
#	cfg:           xilinx_7A35T
#
#	description:   md5 start-up
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

#-------------------------------------------------------------------------------
#    ref_clk
#-------------------------------------------------------------------------------

set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports ref_clk]
set_switching_activity -deassert_resets

#-------------------------------------------------------------------------------
#    dnum
#-------------------------------------------------------------------------------
set_property PACKAGE_PIN T10  [get_ports {dnum[3]}]
set_property PACKAGE_PIN T9   [get_ports {dnum[2]}]
set_property PACKAGE_PIN J5   [get_ports {dnum[1]}]
set_property PACKAGE_PIN H5   [get_ports {dnum[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {dnum}]
#set_property IOB TRUE [get_ports {dnum}]

#-------------------------------------------------------------------------------
#    dout
#-------------------------------------------------------------------------------
set_property PACKAGE_PIN K1   [get_ports {dout[3]}]
set_property PACKAGE_PIN J3   [get_ports {dout[2]}]
set_property PACKAGE_PIN G3   [get_ports {dout[1]}]
set_property PACKAGE_PIN G6   [get_ports {dout[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {dout}]
#set_property IOB TRUE [get_ports {dout}]

#-------------------------------------------------------------------------------
#    sw
#-------------------------------------------------------------------------------
set_property PACKAGE_PIN A10  [get_ports {sw[3]}]
set_property PACKAGE_PIN C10  [get_ports {sw[2]}]
set_property PACKAGE_PIN C11  [get_ports {sw[1]}]
set_property PACKAGE_PIN A8   [get_ports {sw[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {sw}]
