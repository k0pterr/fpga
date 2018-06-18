#-------------------------------------------------------------------------------
#	Project:        Any
#	Configuration:  xilinx_7A50T
#
#	Description:   project start-up
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# REF_DIR    - top level dir (attention please!)
#-------------------------------------------------------------------------------

DEVICE     := xc7a50tftg256-1
TOP_NAME   := slon5_test
REF_DIR    := ../../..
SRC_DIR    := ../../src
BUILD_DIR  := ../../../build

SIM_DIR    := $(BUILD_DIR)/sim

#-------------------------------------------------------------------------------
INC := $(SRC_DIR)/slon5.svh

SRC := $(SRC_DIR)/slon5_test.sv    \
       $(SRC_DIR)/slon5.sv         \
       $(SRC_DIR)/slon01.v         \
       $(SRC_DIR)/slon/slon11.v    \
       $(SRC_DIR)/slon/slon12.sv   \
       $(SRC_DIR)/slon/slonick/slon21.v
       
SRC_SIM := $SRC 
       
#LIB := pf.sv

SDC := xilinx_7A50T.sdc \
       xilinx_7A50T.xdc

#CFG_IP := ram_16x8 fifo_1024x8 fifo_512x8 fifo_256x8 pll

TRG_BOARD  := "Digilent/210251991273"
TRG_DEVICE := "xc7a50t_0"

#-------------------------------------------------------------------------------
BUILD_TOOL := VIVADO

include $(REF_DIR)/script/xilinx.mk
