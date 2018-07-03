#--------------------------------------------------------------------------------
#       Project:         Any
#       Configuration:   xilinx_7A35T
#
#       Description:   Project parameters
#--------------------------------------------------------------------------------

#--------------------------------------------------------------------------------
set USE_PLL           0
set USE_MEM_IP_CORES  0

set CLK_FREQ       100000000
set DOUT_WIDTH             4
set DNUM_WIDTH             4

set TABLE_ID               0
set DNUM_POLARITY          1

#--------------------------------------------------------------------------------
puts $prjDefFile [format "`define CLK_FREQ         %s"   $CLK_FREQ];
puts $prjDefFile [format "`define CLK_PERIOD       %sns" [expr 1000/($CLK_FREQ/1e6)]];
puts $prjDefFile [format "`define CLK_HALF_PERIOD  %sns" [expr 1000/($CLK_FREQ/1e6)/2]];
puts $prjDefFile [format "`define DOUT_WIDTH       %s"   $DOUT_WIDTH];
puts $prjDefFile [format "`define DNUM_WIDTH       %s"   $DNUM_WIDTH];
puts $prjDefFile [format "`define TABLE_ID         %s"   $TABLE_ID];
puts $prjDefFile [format "`define DNUM_POLARITY    %s"   $DNUM_POLARITY];


#--------------------------------------------------------------------------------
if {$USE_PLL == 1} {
        puts $prjDefFile [format "`define USE_PLL"];
}

if {$USE_MEM_IP_CORES == 1} {
        puts $prjDefFile [format "`define USE_MEM_IP_CORES"];
}
#--------------------------------------------------------------------------------






