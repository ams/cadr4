PROJECT		= dip
VCDFORMAT	= vcd
WORK		= dip

GHDLSTD			= 08
GHDLOPTIONS		= -v -g -P../ttl
GHDLSIMOPTIONS	= --backtrace-severity=warning
#GHDLSIMOPTIONS	+= --assert-level=warning

DIP_SOURCES = dip_16dummy.vhd \
              dip_2147.vhd \
              dip_25ls2519.vhd \
              dip_25s07.vhd \
              dip_25s09.vhd \
              dip_25s10.vhd \
              dip_5600.vhd \
              dip_5610.vhd \
              dip_7428.vhd \
              dip_74ls109.vhd \
              dip_74ls14.vhd \
              dip_74ls244.vhd \
              dip_74s00.vhd

DIP_TESTBENCHES = $(patsubst %.vhd,%_tb,$(DIP_SOURCES))

SRCS = dip.vhd $(DIP_SOURCES)

include ../ghdl.mk

TESTBENCHES = $(DIP_TESTBENCHES)

# Overriding the default tb rule from ghdl.mk to handle dependencies correctly
#tb: $(patsubst %,tb-%,$(DIP_TESTBENCHES))
#.PHONY: tb

# Generate specific tb-<testbench> rules
#define TB_RULE
#tb-$(1): $(WORK)/$(1).cf
#	$$(call SIM_CMD, $$<, vcd/$$*.$(VCDFORMAT))
#endef

#$(foreach tb,$(DIP_TESTBENCHES),$(eval $(call TB_RULE,$(tb))))

#$(WORK)/dip_16dummy_tb.cf: dip_16dummy_tb.vhd $(WORK)/dip_16dummy.o
#$(WORK)/dip_2147_tb.cf: dip_2147_tb.vhd $(WORK)/dip_2147.o
#$(WORK)/dip_25ls2519_tb.cf: dip_25ls2519_tb.vhd $(WORK)/dip_25ls2519.o
#$(WORK)/dip_25s07_tb.cf: dip_25s07_tb.vhd $(WORK)/dip_25s07.o
#$(WORK)/dip_25s09_tb.cf: dip_25s09_tb.vhd $(WORK)/dip_25s09.o
$(WORK)/dip_25s10_tb.cf: dip_25s10_tb.vhd $(WORK)/dip_25s10.o
$(WORK)/dip_5600_tb.cf: dip_5600_tb.vhd $(WORK)/dip_5600.o
$(WORK)/dip_5610_tb.cf: dip_5610_tb.vhd $(WORK)/dip_5610.o
$(WORK)/dip_7428_tb.cf: dip_7428_tb.vhd $(WORK)/dip_7428.o
$(WORK)/dip_74ls109_tb.cf: dip_74ls109_tb.vhd $(WORK)/dip_74ls109.o
$(WORK)/dip_74ls14_tb.cf: dip_74ls14_tb.vhd $(WORK)/dip_74ls14.o
$(WORK)/dip_74ls244_tb.cf: dip_74ls244_tb.vhd $(WORK)/dip_74ls244.o
$(WORK)/dip_74s00_tb.cf: dip_74s00_tb.vhd $(WORK)/dip_74s00.o
