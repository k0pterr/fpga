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

CFG_DIR        := $(CURDIR)
REF_DIR        := ../../..
LIB_DIR        := $(REF_DIR)/lib
SRC_DIR        := ../../src
CFG_IP_DIR     := $(CFG_DIR)/ip

SIM_WLIB_NAME := wlib

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
       $(SRC_DIR)/slon/slonick/slon21.v\
       $(SRC_DIR)/config.v         \
       $(LIB_DIR)/pf.sv


#-----------------------------------------------------------
#
#    Constraints
#
SDC := xilinx_7A50T.sdc \
       xilinx_7A50T.xdc

#-----------------------------------------------------------
#
#    IP cores
#
CFG_IP := pll pll200 fifo_1024x16 fifo_512x32 ram_16x8

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

SIM_INC_DIRS := $(CFG_DIR) $(SRC_DIR) $(LIB_DIR)

#-----------------------------------------------------------
#
#    Options
#
VLOG_FLAGS := -O5
VOPT_FLAGS := -O5 -L unifast_ver -L unisims_ver 

#-------------------------------------------------------------------------------

include $(REF_DIR)/script/xilinx.mk

#-------------------------------------------------------------------------------

