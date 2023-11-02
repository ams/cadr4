PROJECT		= ttl

SIM		= ghdl

GHDLFLAGS	= --std=08 --work=ttl

VCDVIEWER	= vcd

SN74_SRCS	=				\
sn7400.vhd					\
sn7402.vhd					\
sn7404.vhd					\
sn7408.vhd					\
sn7410.vhd					\
sn7411.vhd					\
sn7420.vhd					\
sn7428.vhd					\
sn7432.vhd					\
sn7437.vhd					\
sn7451.vhd					\
						\
sn7486.vhd					\
sn74260.vhd					\
sn74240.vhd

SRCS_VHD	=				\
misc.vhd					\
other.vhd					\
sn74.vhd					\
$(SN74_SRCS)

TB_SRCS_VHD	= $(addsuffix _tb.vhd, $(basename $(SN74_SRCS)))
TESTBENCHES	= $(basename $(TB_SRCS_VHD))

include ~/hdlmake.mk/hdlmake.mk
