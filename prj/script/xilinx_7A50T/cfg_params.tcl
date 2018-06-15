#-------------------------------------------------------------------------------
#	project:       md5_test
#	cfg:           xilinx_7A50T
#
#	description:   md5 start-up
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
set USE_PLL           0
set USE_MEM_IP_CORES  0

set CLK_FACTOR   100_000_000
set DOUT_WIDTH             4
set DNUM_WIDTH             4

set TABLE_ID               1
set DNUM_POLARITY          1

#-------------------------------------------------------------------------------
puts $prjDefFile [format "`define CLK_FACTOR    %s" $CLK_FACTOR];
puts $prjDefFile [format "`define DOUT_WIDTH    %s" $DOUT_WIDTH];
puts $prjDefFile [format "`define DNUM_WIDTH    %s" $DNUM_WIDTH];
puts $prjDefFile [format "`define TABLE_ID      %s" $TABLE_ID];
puts $prjDefFile [format "`define DNUM_POLARITY %s" $DNUM_POLARITY];

#-------------------------------------------------------------------------------
if {$USE_PLL == 1} {
	puts $prjDefFile [format "`define USE_PLL"];
}

if {$USE_MEM_IP_CORES == 1} {
	puts $prjDefFile [format "`define USE_MEM_IP_CORES"];
}






