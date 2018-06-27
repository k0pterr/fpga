#-------------------------------------------------------------------------------
#	Project:        Any
#	Configuration:  xilinx_7A35T
#
#	Description:    Project settings file
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# REF_DIR    - top level dir (attention please!)
#-------------------------------------------------------------------------------

DEVICE         := xc7a35ticsg324-1L
TOP_NAME       := slon5_test
TBENCH_NAME    := slon5_tb

CFG_DIR        := $(CURDIR)
REF_DIR        := ../../..
LIB_DIR        := $(REF_DIR)/lib
SRC_DIR        := ../../src
CFG_IP_DIR     := $(CFG_DIR)/ip

SIM_WLIB_NAME  := wlib

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
       $(LIB_DIR)/pf.sv


#-----------------------------------------------------------
#
#    Constraints
#
SDC := xilinx_7A35T.sdc \
       xilinx_7A35T.xdc

#-----------------------------------------------------------
#
#    IP cores
#
CFG_IP := pll mmcm

#-----------------------------------------------------------
#
#    Target hardware
#
TRG_BOARD  := "Digilent/210319A28CB4A"
TRG_DEVICE := "xc7a35t_0"

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
VOPT_FLAGS := -O5 -L unisims_ver

#-------------------------------------------------------------------------------

include $(REF_DIR)/script/xilinx.mk

#-------------------------------------------------------------------------------

