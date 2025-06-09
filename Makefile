.SUFFIXES: 

# ghdl cannot work with parallel runs
.NOTPARALLEL:

VCDFORMAT	= vcd
GHDL		= ghdl
GHDLSTD		= 08
GHDLIMPORTOPTIONS	= -v -g
GHDLMAKEOPTIONS		= -v -g -Wc,-Werror
GHDLRUNOPTIONS		= -v -g
GHDLSIMOPTIONS		= --backtrace-severity=warning --assert-level=warning

# fix params
BUILDDIR	  := build
.DEFAULT_GOAL := all

# sources are found by wildcard
# source files are *.vhd
# test bench source files are *_tb.vhd
# test bench executables are *_tb under build directory

TTL_SRCS := $(wildcard ttl/*.vhd)
DIP_SRCS := $(wildcard dip/*.vhd)
CADR_SRCS := $(wildcard cadr/*.vhd)
TTL_EXES := $(patsubst %.vhd,$(BUILDDIR)/%,$(notdir $(wildcard ttl/*_tb.vhd)))

SRCS := $(TTL_SRCS) $(DIP_SRCS) #$(CADR_SRCS)
EXES := $(TTL_EXES)

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

.PHONY: all check run-tb clean help suds

all: $(EXES)

check: $(EXES)
	for TB_EXE in $^; do TB=$$TB_EXE make run-tb || exit; done

# --workdir does not work below with ghdl run, we should cd and dont use --workdir
run-tb: $(TB)
	cd $(BUILDDIR); $(GHDL) run $(GHDLRUNOPTIONS) --std=$(GHDLSTD) $(notdir $(TB)) $(GHDLSIMOPTIONS)

clean:
	rm -rf $(BUILDDIR)

help: 
	@echo "make all: build all testbenches"
	@echo "make suds: build suds sources from drw files"
	@echo "make check: run all testbenches"
	@echo "make run-tb: run a testbench"
	@echo "make clean: clean build directory"
	@echo "make help: show this help"

# generate %_suds.vhd source file from drw

CADR_BOOK := actl alatch alu0 alu1 aluc4 amem0 amem1 apar bcpins bcterm caps clockd contrl cpins \
dram0 dram1 dram2 dspctl flag ior ipar ireg iwr l lc lcc lpc mctl md mds mf mlatch mmem mo0 mo1 \
mskg4 npc opcd pdl0 pdl1 pdlctl pdlptr platch q qctl shift0 shift1 smctl source spc spclch spcpar \
spcw spy1 spy2 trap vctl1 vctl2 vma vmas vmem0 vmem1 vmem2 vmemdr

ICMEM_BOOK := clock1 clock2 debug icaps ictl iwrpar mbcpin mcpins olord1 olord2 opcs pctl prom0 prom1 \
iram00 iram01 iram02 iram03 iram10 iram11 iram12 iram13 iram20 iram21 iram22 iram23 iram30 \
iram31 iram32 iram33 spy0 spy4 stat

SUDS_SRCS := $(addprefix cadr/, $(addsuffix _suds.vhd, $(CADR_BOOK) $(ICMEM_BOOK)))

cadr/%_suds.vhd: doc/ai/cadr/%.drw $(BUILDDIR)/soap
	$(BUILDDIR)/soap -n $< > $@

$(BUILDDIR)/soap: soap/soap.c soap/unpack.c
	mkdir -p $(BUILDDIR)
	$(CC) -std=gnu99 -Wall -Wextra -O0 -ggdb3 -o $@ -g $^

suds: $(BUILDDIR)/soap $(SUDS_SRCS)