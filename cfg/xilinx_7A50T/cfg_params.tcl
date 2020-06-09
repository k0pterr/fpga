#--------------------------------------------------------------------------------
#       Project:         Any
#       Configuration:   xilinx_AC701
#
#       Description:   Project parameters
#--------------------------------------------------------------------------------

source ${SCRIPT_DIR}/helpers/param_utils.tcl

set config_params [list]
                      

#defparam DIFF_REFCLK       ""
defparam CLK_FREQ          200000000
defparam CLK_PRDIOD        [expr 1000/([getparam CLK_FREQ]/1e6)]ns;
defparam CLK_HALF_PERIOD   [expr 1000/([getparam CLK_FREQ]/1e6)/2]ns
defparam WIDTH             4

#--------------------------------------------------------------------------------






