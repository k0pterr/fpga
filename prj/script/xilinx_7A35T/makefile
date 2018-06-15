#-------------------------------------------------------------------------------
#	project:       slon5_test
#	cfg:           xilinx_7A35T
#
#	description:   slon5 start-up
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# REF_DIR    - top level dir (attention please!)
#-------------------------------------------------------------------------------

DEVICE     := xc7a35ticsg324-1L
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

SDC := xilinx_7A35T.sdc \
       xilinx_7A35T.xdc

#CFG_IP := ram_16x8 fifo_1024x8 fifo_512x8 fifo_256x8 pll

TRG_BOARD  := "Digilent/210319A28CB4A"
TRG_DEVICE := "xc7a35t_0"

#-------------------------------------------------------------------------------
BUILD_TOOL := VIVADO

include $(REF_DIR)/script/xilinx.mk
