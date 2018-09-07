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

    source ${IP_LIB_DIR}/${ip_type}/${ip_type}.tcl
    
    #---------------------------------------------------------------------------
    proc ipInfo {} {
    return [dict create isSynth 1 isIp 1 isPacked 0]
    }
    
    #---------------------------------------------------------------------------
    proc ipUserCfg { ipCoreName ipCoreOutDir cfgDir } {
    #puts "\[ipUserCfg\] $ipCoreName $ipCoreOutDir"
    
    set ipParams {
        CONFIG.PRIM_IN_FREQ                200
        CONFIG.CLKOUT1_REQUESTED_OUT_FREQ  100  
        CONFIG.USE_LOCKED                  true
        CONFIG.USE_RESET                   false
        CONFIG.MMCM_COMPENSATION           ZHOLD
    }
    set_property -dict [subst $ipParams] [get_ips $ipCoreName]
    #report_property [get_ips $ipCoreName]
    }
    #---------------------------------------------------------------------------
}
if {[info exists env(MODEL_TECH)]} {
    
    source ${IP_LIB_DIR}/${ip_type}/compile_simlib.do
    
}
#-------------------------------------------------------------------------------

