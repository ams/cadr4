PROJECT		= ttl

SIM		= ghdl

GHDLFLAGS	= --work=ttl

SRCS_VHD	= sn74.vhd \
  sn7400.vhd

TB_SRCS_VHD	= sn7400_tb.vhd
TESTBENCHES	= $(basename $(TB_SRCS_VHD))

include ~/hdlmake.mk/hdlmake.mk
