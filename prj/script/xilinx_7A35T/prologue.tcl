#--------------------------------------------------------------------------------
#	Project:       Any
#	Platform:      xilinx_7A35T
#
#	Description:   Prologue config script
#--------------------------------------------------------------------------------

puts ""
puts "========================================================================="
puts "prologue.tcl"
puts "========================================================================="

set srcDir [lindex $SRC_DIR 0]
#-----------------------------------

#-----------------------------------
set prologue_debug 1
if {$prologue_debug == 1} {
	puts ""
	puts "--- common part ---"
	puts "PWD:              [pwd]"
	puts "SCRIPT_DIR:       $SCRIPT_DIR"
	puts "SRC_DIR:          $SRC_DIR"
	puts "PRJ_NAME:         $PRJ_NAME"
	puts "BUILD_TOOL:       $BUILD_TOOL"
	
	if {[info exists env(XILINX)]} {
		puts ""
		puts "--- Vivado part ---"
		puts "OUT_CFG_DIR:      $OUT_CFG_DIR"
		puts "TARGET_FILE_NAME: $TARGET_FILE_NAME"
		puts "DEVICE:           $DEVICE"
		puts "LIB_DIR:          $LIB_DIR"
	}
	if {[info exists env(MODEL_TECH)]} {
		puts ""
		puts "--- Questa part ---"
		puts "IncDirs:         $IncDirs"
		puts "SrcDirs:         $SrcDirs"
	}
}

puts ""
puts "========================================================================="
puts ""

#--------------------------------------------------------------------------------
