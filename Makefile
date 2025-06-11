.SUFFIXES: 

# ghdl cannot work with parallel runs
.NOTPARALLEL:

GHDL		= ghdl
GHDLSTD		= 08
GHDLWAVEFORMAT		= ghw
GHDLIMPORTOPTIONS	= -v -g
GHDLMAKEOPTIONS		= -v -g 
GHDLVERSION			= $(ghdl --version | head -1 | cut -f2 -d' ')
ifeq ($(GHDLVERSION),"6.0.0-dev")
   	GHDLMAKEOPTIONS += -Wc,-Werror
endif
GHDLRUNOPTIONS		= -v -g
GHDLSIMOPTIONS		= --backtrace-severity=warning --assert-level=warning

# fix params
BUILDDIR	  := build
.DEFAULT_GOAL := all

OS := $(shell uname -s)

ifeq ($(OS),Darwin)
    SEDOPTIONS := -i ''
else
    SEDOPTIONS := -i
endif

# sources are found by wildcard
# source files are *.vhd
# test bench source files are *_tb.vhd
# test bench executables are *_tb under build directory

TTL_SRCS := $(wildcard ttl/*.vhd)
DIP_SRCS := $(wildcard dip/*.vhd)
CADR_SRCS := $(wildcard cadr/*.vhd)
MAIN_SRCS := $(wildcard *.vhd)

TTL_EXES := $(patsubst %.vhd,$(BUILDDIR)/%,$(notdir $(wildcard ttl/*_tb.vhd)))
MAIN_EXES := $(patsubst %.vhd,$(BUILDDIR)/%,$(wildcard *_tb.vhd))

SRCS := $(TTL_SRCS) $(DIP_SRCS) $(CADR_SRCS) $(MAIN_SRCS)
EXES := $(TTL_EXES) $(MAIN_EXES)

# ghdl import and make works weird, all the build process is weird
# there is no sane way to build object files manually in this way
# building (and linking) a tb will build object files, less worries like this
# all objects and _tb executables are build into $(BUILDDIR)

$(BUILDDIR)/work-obj$(GHDLSTD).cf: $(SRCS)
	mkdir -p $(BUILDDIR)
	$(GHDL) import $(GHDLIMPORTOPTIONS) --std=$(GHDLSTD) --workdir=$(BUILDDIR) $^

# %_tb has no %.vhd etc. dependency because these are resolved in cf
# ghdl make is like an extra layer over make build system

$(BUILDDIR)/%_tb: $(BUILDDIR)/work-obj$(GHDLSTD).cf
	mkdir -p $(BUILDDIR)
	$(GHDL) make $(GHDLMAKEOPTIONS) --std=$(GHDLSTD) --workdir=$(BUILDDIR) -o $@ $(notdir $@)

.PHONY: all ttl-check run-tb vcd-% vcd-tb clean help suds

all: $(EXES)

ttl-check: $(TTL_EXES)
	for TB_EXE in $^; do TB=$$TB_EXE make run-tb || exit; done

# --workdir does not work below with ghdl run, we should cd and dont use --workdir
run-tb: $(TB)
	$< $(GHDLSIMOPTIONS)

vcd-%: build/%_tb
	TB=$< make vcd-tb

ifeq ($(GHDLWAVEFORMAT),ghw)
ifneq ("$(wildcard $(notdir $(TB)).opt)","")
GHDLWAVEOPTIONS := --vcd=$(BUILDDIR)/$(notdir $(TB)).ghw --read-wave-opt=$(notdir $(TB)).opt
else
GHDLWAVEOPTIONS := --vcd=$(BUILDDIR)/$(notdir $(TB)).ghw #--write-wave-opt=$(notdir $(TB)).opt
endif
else
GHDLWAVEOPTIONS := --vcd=$(BUILDDIR)/$(notdir $(TB)).vcd
endif

vcd-tb: $(TB)
	$< $(GHDLSIMOPTIONS) $(GHDLWAVEOPTIONS) --disp-time
	surfer $(BUILDDIR)/$(notdir $(TB)).$(GHDLWAVEFORMAT)

clean:
	rm -rf $(BUILDDIR)

help: 
	@echo "make all: build all testbenches"
	@echo "make suds: re-creates suds sources from drw files (warning: overwrites existing cadr/*_suds.vhd files)"
	@echo "make ttl-check: run all ttl testbenches"
	@echo "make vcd-X: run testbench X (build/X_tb) and view the vcd file with surfer"
	@echo "make clean: clean build directory"
	@echo "make help: show this help"

CADR_BOOK := actl alatch alu0 alu1 aluc4 amem0 amem1 apar bcpins bcterm caps clockd contrl cpins \
dram0 dram1 dram2 dspctl flag ior ipar ireg iwr l lc lcc lpc mctl md mds mf mlatch mmem mo0 mo1 \
mskg4 npc opcd pdl0 pdl1 pdlctl pdlptr platch q qctl shift0 shift1 smctl source spc spclch spcpar \
spcw spy1 spy2 trap vctl1 vctl2 vma vmas vmem0 vmem1 vmem2 vmemdr

ICMEM_BOOK := clock1 clock2 debug icaps ictl iwrpar mbcpin mcpins olord1 olord2 opcs pctl prom0 prom1 \
iram00 iram01 iram02 iram03 iram10 iram11 iram12 iram13 iram20 iram21 iram22 iram23 iram30 \
iram31 iram32 iram33 spy0 spy4 stat

$(BUILDDIR)/soap: soap/soap.c soap/unpack.c
	mkdir -p $(BUILDDIR)
	$(CC) -std=gnu99 -Wall -Wextra -O0 -ggdb3 -o $@ -g $^

suds: $(BUILDDIR)/soap
# generate _suds.vhd files
	for NAME in $(CADR_BOOK); do $(BUILDDIR)/soap -n doc/ai/cadr/$${NAME}.drw > cadr/cadr_$${NAME}_suds.vhd || exit; done
	for NAME in $(ICMEM_BOOK); do $(BUILDDIR)/soap -n doc/ai/cadr/$${NAME}.drw > cadr/cadr_$${NAME}_suds.vhd || exit; done
# fix aliases, simply replace
	for FILE in cadr/*_suds.vhd; do sed $(SEDOPTIONS) 's/dip_74s00o/dip_74s00/g' $${FILE} || exit; done
	for FILE in cadr/*_suds.vhd; do sed $(SEDOPTIONS) 's/dip_74s02o/dip_74s02/g' $${FILE} || exit; done
	for FILE in cadr/*_suds.vhd; do sed $(SEDOPTIONS) 's/dip_74s04a/dip_74s04/g' $${FILE} || exit; done
	for FILE in cadr/*_suds.vhd; do sed $(SEDOPTIONS) 's/dip_74s08o/dip_74s08/g' $${FILE} || exit; done
	for FILE in cadr/*_suds.vhd; do sed $(SEDOPTIONS) 's/dip_74s10o/dip_74s10/g' $${FILE} || exit; done
	for FILE in cadr/*_suds.vhd; do sed $(SEDOPTIONS) 's/dip_74s32o/dip_74s32/g' $${FILE} || exit; done
	for FILE in cadr/*_suds.vhd; do sed $(SEDOPTIONS) 's/dip_74s32w/dip_74s32/g' $${FILE} || exit; done
	for FILE in cadr/*_suds.vhd; do sed $(SEDOPTIONS) 's/dip_74s133o/dip_74s133/g' $${FILE} || exit; done
	for FILE in cadr/*_suds.vhd; do sed $(SEDOPTIONS) 's/dip_74ls240/dip_74s240/g' $${FILE} || exit; done
# modify olord2_1a19 port map
	sed $(SEDOPTIONS) 's/olord2_1a19.*/olord2_1a19: dip_16dummy port map (p1 => vcc, p12 => \\@1a20,p1\\, p13 => \\-boot2\\, p14 => \\-boot1\\, p15 => hi2, p16 => hi1);/g' cadr/cadr_olord2_suds.vhd
# modify one instance of olord2_1a20 port map to connect its p1 to olord2_1a19 p12
	sed $(SEDOPTIONS) 's/olord2_1a20 : dip_74ls14 port map (p2 => \\@1a20,p9\\);/olord2_1a20 : dip_74ls14 port map (p1 => \\@1a19,p12\\, p2 => \\@1a20,p9\\);/g' cadr/cadr_olord2_suds.vhd
# fix _suds.vhd files	
	for FILE in cadr/*_suds.vhd; do python3 cadr/fix-suds.py -v $${FILE} || exit; done
# modify clock1 to wire -tpw60 to -tpdone, this is done after fix-suds.py because it may modify or get confused with these additions
ifeq ($(OS),Darwin)
	sed $(SEDOPTIONS) 's/^architecture.*/&\'$$'\nsignal \\\\-tpdone\\\\ : std_logic;/' cadr/cadr_clock1_suds.vhd
	sed $(SEDOPTIONS) 's/^begin.*/&\'$$'\n\\\\-tpdone\\\\ <= \\\\-tpw60\\\\;/' cadr/cadr_clock1_suds.vhd
else
	sed $(SEDOPTIONS) 's/^architecture.*/&\nsignal \\-tpdone\\ : std_logic;/' cadr/cadr_clock1_suds.vhd
	sed $(SEDOPTIONS) 's/^begin.*/&\n\\-tpdone\\ <= \\-tpw60\\;/' cadr/cadr_clock1_suds.vhd
endif