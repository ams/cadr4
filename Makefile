PROJECT		= cadr4

SIM		= ghdl
VCDFORMAT	= vcd

SRCS_VHD	=				\
cadr4.vhd					\
utilities.vhd					\
cpu.vhd

include ~/hdlmake.mk/hdlmake.mk
