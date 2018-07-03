#-------------------------------------------------------------------------------
#   Project:       Any
#   IP core:       ram_16x8, single-clock single-port block RAM
#
#   Description:   test and study xilinx ip workflow
#-------------------------------------------------------------------------------

set ip_type ram_sc_sp
set ip_name ram_16x8

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
            CONFIG.Write_Depth_A   16
            CONFIG.Write_Width_A    8
            CONFIG.Read_Width_A     8
            CONFIG.Load_Init_File  {true}
            CONFIG.Coe_File        ${cfgDir}/ip/ram_16x8.coe
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

