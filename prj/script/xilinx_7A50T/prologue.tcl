#-------------------------------------------------------------------------------
#	project:       md5_test
#	cfg:           xilinx_7A50T
#
#	description:   md5 start-up
#-------------------------------------------------------------------------------

puts ""
puts "========================================================================="
puts "prologue.tcl"
puts "========================================================================="

set srcDir [lindex $SRC_DIR 0]
#-----------------------------------
source ${srcDir}/md5.tcl
md5_gen ${srcDir}  "md5_test" "md5_generated" "md5 alg"
puts "md5_generated.pkg created"

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

#-------------------------------------------------------------------------------
