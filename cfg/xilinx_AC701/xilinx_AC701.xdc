#-------------------------------------------------------------------------------
#   project:       slon5_test
#   cfg:           xilinx_AC701
#
#   description:   slon5 start-up
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

#-------------------------------------------------------------------------------
#    Clocks
#-------------------------------------------------------------------------------

#set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports ref_clk]
set_property PACKAGE_PIN R3 [get_ports ref_clk_p]
set_property PACKAGE_PIN P3 [get_ports ref_clk_n]
set_property IOSTANDARD LVDS_25 [get_ports ref_clk_p]
set_property IOSTANDARD LVDS_25 [get_ports ref_clk_n]

# EMCCLK
#set_property PACKAGE_PIN P16 [get_ports emcclk]
#set_property IOSTANDARD LVCMOS33 [get_ports emcclk]


set_switching_activity -deassert_resets

#-------------------------------------------------------------------------------
#    dnum: mapped to user leds
#-------------------------------------------------------------------------------
set_property PACKAGE_PIN R26   [get_ports {dnum[3]}]
set_property PACKAGE_PIN T25   [get_ports {dnum[2]}]
set_property PACKAGE_PIN T24   [get_ports {dnum[1]}]
set_property PACKAGE_PIN M26   [get_ports {dnum[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {dnum}]
#set_property IOB TRUE [get_ports {dnum}]

#-------------------------------------------------------------------------------
#    dout: mapped to PMOD header
#-------------------------------------------------------------------------------
set_property PACKAGE_PIN T23   [get_ports {dout[3]}]
set_property PACKAGE_PIN R22   [get_ports {dout[2]}]
set_property PACKAGE_PIN T22   [get_ports {dout[1]}]
set_property PACKAGE_PIN P26   [get_ports {dout[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {dout}]
#set_property IOB TRUE [get_ports {dout}]

#-------------------------------------------------------------------------------
#    sw
#-------------------------------------------------------------------------------
set_property PACKAGE_PIN R6   [get_ports {sw[3]}]
set_property PACKAGE_PIN R7   [get_ports {sw[2]}]
set_property PACKAGE_PIN P8   [get_ports {sw[1]}]
set_property PACKAGE_PIN R8   [get_ports {sw[0]}]

set_property IOSTANDARD SSTL15 [get_ports {sw}]

set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN DIV-1 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
