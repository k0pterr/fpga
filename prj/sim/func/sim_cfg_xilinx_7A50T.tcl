#-------------------------------------------------------------------------------
#	Project:       Any
#	Platform:      xilinx_7A50T
#
#	description:   md5 start-up
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
set REF_DIR        "../../..";
set SCRIPT_DIR     "${REF_DIR}/script"

#-------------------------------------------------------------------------------
set CfgName        "xilinx_7A50T"
set DesignName     "top_tb"

#set TimeResolution "10ps"
set WorkLib        "wlib"

#-------------------------------------------------------------------------------
set Src  [ list                                   \
	       "${REF_DIR}/prj/src"                   \
	       "${REF_DIR}/prj/src/slon"              \
	       "${REF_DIR}/prj/src/slon/slonick"      \
	     ]
set Lib  [ list                                   \
	       "${REF_DIR}/lib"                       \
	     ]
set Sim  [ list                                   \
	       "${REF_DIR}/prj/sim/func/src"          \
	     ]

#-------------------------------------------------------------------------------
source ${SCRIPT_DIR}/questa_sim.tcl
