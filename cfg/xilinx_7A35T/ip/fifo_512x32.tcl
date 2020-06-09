#-------------------------------------------------------------------------------
#   Project:       Any
#   IP core:       fifo_1024x16 - single-clock FIFO
#
#   Description:   test and study xilinx ip workflow
#-------------------------------------------------------------------------------

set ip_type fifo_sc
set ip_name fifo_512x32

#-------------------------------------------------------------------------------
if {[info exists env(XILINX)]} {

    source ${IP_LIB_DIR}/${ip_type}/${ip_type}.tcl

    #---------------------------------------------------------------------------
    proc ipInfo {} {
        return [dict create isSynth 1 isIp 1 isPacked 0]
    }

    #---------------------------------------------------------------------------
    proc ipUserCfg { ipCoreName ipCoreOutDir cfgDir } {
        puts "\[ipUserCfg\] $ipCoreName $ipCoreOutDir"

        set ipParams {
                CONFIG.Input_Data_Width 32
                CONFIG.Input_Depth      512
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

