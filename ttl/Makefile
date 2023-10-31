PROJECT		= ttl

SIM		= ghdl

GHDLFLAGS	= --work=ttl

VCDVIEWER = vcd

SRCS_VHD	= sn74.vhd			\
		  sn7400.vhd			\
		  sn7402.vhd			\
		  sn7404.vhd			\
		  sn7408.vhd			\
		  sn7410.vhd			\
		  sn7411.vhd			\
		  sn7420.vhd			\
		  sn74260.vhd			\
		  sn7432.vhd			\
		  sn7451.vhd			\
		  sn7486.vhd			\
		  sn74244.vhd \
		  sn7414.vhd \
		  sn7437.vhd

TB_SRCS_VHD	= sn7400_tb.vhd
TESTBENCHES	= $(basename $(TB_SRCS_VHD))

include ~/hdlmake.mk/hdlmake.mk
