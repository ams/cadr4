PROJECT		= cadr4

SIM		= ghdl
GHDLFLAGS	= --std=08 -Pttl
VCDVIEWER	= vcd

SRCS_VHD	=				\
utilities.vhd					\
cadr4.vhd

include ~/hdlmake.mk/hdlmake.mk
