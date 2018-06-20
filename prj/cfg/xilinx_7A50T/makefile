#-------------------------------------------------------------------------------
#	Project:        Any
#	Configuration:  xilinx_7A50T
#
#	Description:    Project settings file
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# REF_DIR    - top level dir (attention please!)
#-------------------------------------------------------------------------------

DEVICE        := xc7a50tftg256-1
TOP_NAME      := slon5_test
TBENCH_NAME   := slon5_tb

REF_DIR       := ../../..
CFG_DIR       := $(CURDIR)
SRC_DIR       := ../../src
INC_DIR       := $(REF_DIR)/lib
BUILD_DIR     := ../../../build

SIM_WLIB_NAME := wlib

SIM_INC_DIRS  := $(CFG_DIR) $(SRC_DIR) $(INC_DIR)

#-------------------------------------------------------------------------------
#
#    Synthesis
#
#-----------------------------------------------------------
#
#    Sources
#
INC := $(SRC_DIR)/slon5.svh

SRC := $(SRC_DIR)/slon5_test.sv    \
       $(SRC_DIR)/slon5.sv         \
       $(SRC_DIR)/slon01.v         \
       $(SRC_DIR)/slon/slon11.v    \
       $(SRC_DIR)/slon/slon12.sv   \
       $(SRC_DIR)/slon/slonick/slon21.v

#LIB := pf.sv

#-----------------------------------------------------------
#
#    Constraints
#
SDC := xilinx_7A50T.sdc \
       xilinx_7A50T.xdc

#CFG_IP := ram_16x8 fifo_1024x8 fifo_512x8 fifo_256x8 pll

#-----------------------------------------------------------
#
#    Target hardware
#
TRG_BOARD  := "Digilent/210251991273"
TRG_DEVICE := "xc7a50t_0"

#-------------------------------------------------------------------------------
#
#    Simulator
#
#-----------------------------------------------------------
#
#    Sources
#
SRC_SIM := $(SRC)\
           $(SRC_DIR)/sim/func/top_tb.sv\
           $(SRC_DIR)/sim/func/slon5_tb.sv

#-----------------------------------------------------------
#
#    Options
#
VLOG_FLAGS := -O5
VOPT_FLAGS := -O5

#-------------------------------------------------------------------------------

include $(REF_DIR)/script/xilinx.mk

#-------------------------------------------------------------------------------

