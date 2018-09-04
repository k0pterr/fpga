#-------------------------------------------------------------------------------
#   project:       slon5_test
#   cfg:           xilinx_AC701
#
#   description:   slon5 start-up
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
create_clock -name ref_clk_p -period 5.0  [get_ports ref_clk_p]
create_generated_clock -name ref_clk -source [get_pins diff_clk_200/O] -multiply_by 1 [get_nets ref_clk]

#create_generated_clock -name clk -source [get_ports ref_clk]
#get_clocks -of_objects [get_ports ref_clk]
