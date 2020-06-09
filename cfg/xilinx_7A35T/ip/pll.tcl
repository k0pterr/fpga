#-------------------------------------------------------------------------------
#   Project:       Any
#   IP core:       pll
#
#   Description:   test and study xilinx ip workflow
#-------------------------------------------------------------------------------

set ip_type pll
set ip_name pll

#-------------------------------------------------------------------------------
if {[info exists env(XILINX)]} {

    source cfg_params.tcl
    source ${IP_LIB_DIR}/${ip_type}/${ip_type}.tcl
    
    #---------------------------------------------------------------------------
    proc ipInfo {} {
    return [dict create isSynth 1 isIp 1 isPacked 0]
    }
    
    #---------------------------------------------------------------------------
    proc ipUserCfg { ipCoreName ipCoreOutDir cfgDir } {
    #puts "\[ipUserCfg\] $ipCoreName $ipCoreOutDir"
    
    global config_params

    set IN_CLK [expr ([getparam CLK_FREQ]/1e6)]
        
    set ipParams {
        CONFIG.PRIM_IN_FREQ                ${IN_CLK}
        CONFIG.CLKOUT1_REQUESTED_OUT_FREQ  125  
        CONFIG.USE_LOCKED                  true
        CONFIG.USE_RESET                   false
        #CONFIG.PRIM_SOURCE                 Differential_clock_capable_pin
        CONFIG.USE_SAFE_CLOCK_STARTUP      true
        #CONFIG.MMCM_COMPENSATION           ZHOLD
    }
    regsub -all {#.*?\n} $ipParams \n ipParams
    set_property -dict [subst $ipParams] [get_ips $ipCoreName]
    #report_property [get_ips $ipCoreName]
    }
    #---------------------------------------------------------------------------
}
if {[info exists env(MODEL_TECH)]} {
    
    source ${IP_LIB_DIR}/${ip_type}/compile_simlib.do
    
}
#-------------------------------------------------------------------------------

