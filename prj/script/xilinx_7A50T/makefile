#-------------------------------------------------------------------------------
#	project:       md5_test
#	cfg:           xilinx_7A50T
#
#	description:   md5 start-up
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# REF_DIR    - top level dir (attention please!)
#-------------------------------------------------------------------------------

DEVICE   := xc7a50tftg256-1
PRJ_NAME := md5_test
REF_DIR  := ../../..
SRC_DIR  := ../../src
SYN_DIR  := ..

#-------------------------------------------------------------------------------
INC := $(SRC_DIR)/md5.svh

SRC := $(SRC_DIR)/md5_test.sv      \
       $(SRC_DIR)/md5.sv           \
       $(SRC_DIR)/slon01.v         \
       $(SRC_DIR)/slon/slon11.v    \
       $(SRC_DIR)/slon/slon12.sv   \
       $(SRC_DIR)/slon/slonick/slon21.v
       
#LIB := pf.sv

SDC := md5_test-xilinx_7A50T.sdc \
       md5_test-xilinx_7A50T.xdc

#CFG_IP := ram_16x8 fifo_1024x8 fifo_512x8 fifo_256x8 pll

TRG_BOARD  := "Digilent/210251991273"
TRG_DEVICE := "xc7a50t_0"

#-------------------------------------------------------------------------------
BUILD_TOOL := VIVADO

include $(REF_DIR)/script/xilinx.mk
