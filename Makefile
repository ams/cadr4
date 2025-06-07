.SUFFIXES: 

# ghdl cannot work with parallel runs
.NOTPARALLEL:

BUILDDIR		= build
VCDFORMAT		= vcd
GHDL			= ghdl
GHDLSTD			= 08
GHDLOPTIONS		= -v -g
GHDLSIMOPTIONS	= --backtrace-severity=warning
#GHDLSIMOPTIONS	+= --assert-level=warning

UNSORTED_SRCS = ic_16dummy.vhd

SN74_SRCS = sn7400.vhd \
			sn7402.vhd \
			sn7404.vhd \
			sn7408.vhd \
			sn7410.vhd \
			sn7411.vhd \
			sn7420.vhd \
			sn7428.vhd \
			sn7432.vhd \
			sn7437.vhd \
			sn7451.vhd \
			sn7486.vhd \
			sn74260.vhd \
			sn74240.vhd	\
			sn74109.vhd	\
			sn74133.vhd	\
			sn74138.vhd	\
			sn74139.vhd	\
			sn7414.vhd \
			sn74151.vhd	\
			sn74153.vhd	\
			sn74157.vhd	\
			sn74169.vhd	\
			sn74174.vhd	\
			sn74175.vhd	\
			sn74181.vhd	\
			sn74182.vhd	\
			sn74194.vhd	\
			sn74241.vhd	\
			sn74244.vhd	\
			sn74258.vhd	\
			sn74280.vhd	\
			sn74283.vhd	\
			sn74373.vhd	\
			sn74374.vhd	\
			sn7464.vhd \
			sn7474.vhd

OTHER_SRCS = td25.vhd \
			 td50.vhd \
			 td100.vhd \
			 td250.vhd \
			 am93s48.vhd \
			 am93425a.vhd \
			 am2147.vhd	\
			 am2507.vhd \
			 am2509.vhd \
			 am2510.vhd \
			 am252519.vhd \
			 im5600.vhd	\
			 dm9328.vhd	\
			 dm8221.vhd	\
			 dm9346.vhd	\
			 dm942.vhd \
			 dm74472.vhd\
			 til309.vhd	\
			 res20.vhd \
			 sip220_330_8.vhd \
			 sip330_470_8.vhd

MISC_SRCS = latch_rs.vhd \
			ff_jk.vhd \
			ff_jkpc.vhd \
			ff_d.vhd \
			ff_dc.vhd \
			timedelay.vhd

TTL_SRCS = $(MISC_SRCS) $(OTHER_SRCS) $(SN74_SRCS) $(UNSORTED_SRCS)

DIP_SRCS = dip_16dummy.vhd \
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
		   dip_74s00.vhd \
		   dip_74s02.vhd \
		   dip_74s04.vhd \
		   dip_74s08.vhd \
		   dip_74s10.vhd \
		   dip_74s11.vhd \
		   dip_74s11o.vhd \
		   dip_74s133.vhd \
		   dip_74s138.vhd \
		   dip_74s139.vhd \
		   dip_74s151.vhd \
		   dip_74s153.vhd \
		   dip_74s157.vhd \
		   dip_74s169.vhd \
		   dip_74s174.vhd \
		   dip_74s175.vhd \
		   dip_74s181.vhd \
		   dip_74s182.vhd \
		   dip_74s194.vhd \
		   dip_74s20.vhd \
		   dip_74s20o.vhd \
		   dip_74s240.vhd \
		   dip_74s241.vhd \
		   dip_74s258.vhd \
		   dip_74s260.vhd \
		   dip_74s280.vhd \
		   dip_74s283.vhd \
		   dip_74s32.vhd \
		   dip_74s32o.vhd \
		   dip_74s32w.vhd \
		   dip_74s37.vhd \
		   dip_74s373.vhd \
		   dip_74s472.vhd

PKG_SRCS = ttl/misc.vhd ttl/other.vhd ttl/sn74.vhd ttl/unsorted.vhd dip/dip.vhd

TTL_SRCS := $(addprefix ttl/, $(TTL_SRCS)) 
TTL_TB_SRCS := $(wildcard ttl/*_tb.vhd)

DIP_SRCS := $(addprefix dip/, $(DIP_SRCS)) 
DIP_TB_SRCS := $(wildcard dip/*_tb.vhd)

SRCS := $(TTL_SRCS) $(DIP_SRCS)
TB_SRCS := $(TTL_TB_SRCS) $(DIP_TB_SRCS)

OBJS := $(patsubst %.vhd,%.o,$(SRCS))
TB_EXES := $(patsubst %.vhd,%,$(TB_SRCS))

.DEFAULT_GOAL := all

work-obj$(GHDLSTD).cf: $(SRCS) $(TB_SRCS) $(PKG_SRCS)
	mkdir -p $(BUILDDIR)
	$(GHDL) import $(GHDLOPTIONS) --std=$(GHDLSTD) --workdir=$(BUILDDIR) $^

# -b means bind only, in other words don't link, so create only object file
%.o: %.vhd work-obj$(GHDLSTD).cf
	mkdir -p $(BUILDDIR)
	$(GHDL) make --std=$(GHDLSTD) --workdir=$(BUILDDIR) -o $(BUILDDIR)/$(notdir $@) -b $(basename $(notdir $@))

%: %.vhd work-obj$(GHDLSTD).cf
	mkdir -p $(BUILDDIR)
	$(GHDL) make --std=$(GHDLSTD) --workdir=$(BUILDDIR) -o $(BUILDDIR)/$(notdir $@) $(notdir $@)

.PHONY: all syntax check clean books

all: $(OBJS) $(TB_EXES)

syntax:
	$(GHDL) syntax $(GHDLOPTIONS) --std=$(GHDLSTD) $(SRCS) $(TB_SRCS)

check: $(TB_EXES)
	$(foreach TB_EXE, $(TB_EXES), $(GHDL) run $(GHDLOPTIONS) $(TB_EXE) ;)

clean:
	rm -rf $(BUILDDIR)

books:
	make -C soap clean
	make -C soap all
	sh ./make-books.sh
