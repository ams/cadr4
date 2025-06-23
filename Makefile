.SUFFIXES: 

# ghdl cannot work with parallel runs
.NOTPARALLEL:

GHDL		= ghdl
GHDLSTD		= 08
GHDLIMPORTOPTIONS	= -v -g
GHDLMAKEOPTIONS		= -v -g -Wno-delayed-checks
GHDLRUNOPTIONS		= -v -g
GHDLSIMOPTIONS		= --backtrace-severity=warning #--assert-level=warning

CADR4_TILONCONSOLE ?= 1

# fix params
BUILDDIR	  := build
DRWDIR	  	  := doc/ai/cadr
.DEFAULT_GOAL := all
FIXSUDSPY     := scripts/fix-suds.py
CREATESETSPY  := scripts/create-sets.py

OS := $(shell uname -s)

# this is required to support sed both on Linux and macOS
ifeq ($(OS),Darwin)
    SEDOPTIONS := -i ''
else
    SEDOPTIONS := -i
endif

# ttl and dip sources are found by wildcard, all *.vhd files under ttl and dip including _tb testbenches and packages
TTL_SRCS := $(wildcard ttl/*.vhd)
DIP_SRCS := $(wildcard dip/*.vhd)

# cadr sources are found specifically from the lists below
# packages (cadr_book.vhd, icmem_book.vhd) are explicitly added to CADR_SRCS below

# these are removed from the original list bcpins caps cpins
CADR_BOOK := actl alatch alu0 alu1 aluc4 amem0 amem1 apar clockd contrl \
dram0 dram1 dram2 dspctl flag ior ipar ireg iwr l lc lcc lpc mctl md mds mf mlatch mmem mo0 mo1 \
mskg4 npc opcd pdl0 pdl1 pdlctl pdlptr platch q qctl shift0 shift1 smctl source spc spclch spcpar \
spcw spy1 spy2 trap vctl1 vctl2 vma vmas vmem0 vmem1 vmem2 vmemdr

# these are removed from the original list icaps mbcpin mcpins
ICMEM_BOOK := clock1 clock2 debug ictl iwrpar olord1 olord2 opcs pctl prom0 prom1 \
iram00 iram01 iram02 iram03 iram10 iram11 iram12 iram13 iram20 iram21 iram22 iram23 iram30 \
iram31 iram32 iram33 spy0 spy4 stat

CADR_SRCS := $(patsubst %,cadr/cadr_%.vhd, $(CADR_BOOK) $(ICMEM_BOOK)) cadr/cadr_book.vhd cadr/icmem_book.vhd 
SUDS_SRCS := $(patsubst %,cadr/cadr_%_suds.vhd, $(CADR_BOOK) $(ICMEM_BOOK))

# cadrio sources are found specifically from the lists below
# package (cadrio_book.vhd) is explicitly added to CADRIO_SRCS below
CADRIO_BOOK := iobcsr

CADRIO_SRCS := $(patsubst %,cadrio/cadrio_%.vhd, $(CADRIO_BOOK)) cadrio/cadrio_book.vhd

CREATESETS_OUTPUTDIR	:= set
CREATESETS_PACKAGENAME  := set
CREATESETS_ENTITYFILE	:= set/entity_list.txt
CREATESETS_BUSFILE		:= set/bus_list.txt
CREATESETS_VHDLFILES	:= cadr/cadr_book.vhd cadr/icmem_book.vhd cadrio/cadrio_book.vhd helper/helper.vhd
CREATESETS_CACHEFILE 	:= set/set.cache
CREATESETS_PACKAGEFILE 	:= set/set.vhd
CREATESETS_TBFILE 		:= set/set_tb.vhd
CREATESETS_ENABLELOG	:= 1
CREATESETS_LOGFILE		:= set/set.log

SETS := $(shell cut -f1 -d' ' $(CREATESETS_ENTITYFILE))
SET_SRCS := $(patsubst %,set/%.vhd, $(SETS)) $(CREATESETS_PACKAGEFILE) $(CREATESETS_TBFILE)

HELPER_SRCS := helper/helper.vhd helper/helper_required_signals.vhd

TB_SRCS  := # tb/cadr_tb.vhd # $(wildcard tb/*_tb.vhd)

# exes mean these are testbenches so these will be compiled into executables also
TTL_EXES  := $(patsubst %.vhd,$(BUILDDIR)/%,$(notdir $(wildcard ttl/*_tb.vhd)))
TB_EXES   := $(patsubst set/%.vhd,build/%,$(CREATESETS_TBFILE)) # $(patsubst %.vhd,$(BUILDDIR)/%,$(notdir $(wildcard tb/*_tb.vhd)))

# all sources and executables
SRCS := $(TTL_SRCS) $(DIP_SRCS) $(CADR_SRCS) $(SUDS_SRCS) $(CADRIO_SRCS) $(SET_SRCS) $(HELPER_SRCS) $(TB_SRCS)
EXES := $(TTL_EXES) $(TB_EXES)

# ghdl import and make works weird, all the build process is weird
# there is no sane way to build object files manually in this way
# building (and linking) a tb will build object files, less worries like this
# all objects and _tb executables are build into $(BUILDDIR)
# because SRCS includes SUDS_SRCS, this will trigger building of cadr/cadr_*_suds.vhd files

$(BUILDDIR)/work-obj$(GHDLSTD).cf: $(SRCS)
	mkdir -p $(BUILDDIR)
	$(GHDL) import $(GHDLIMPORTOPTIONS) --std=$(GHDLSTD) --workdir=$(BUILDDIR) $^

# %_tb has no %.vhd etc. dependency because these are resolved in cf
# ghdl make is like an extra layer over make build system

$(BUILDDIR)/%_tb: $(BUILDDIR)/work-obj$(GHDLSTD).cf
	mkdir -p $(BUILDDIR)
	$(GHDL) make $(GHDLMAKEOPTIONS) --std=$(GHDLSTD) --workdir=$(BUILDDIR) -o $@ $(notdir $@)

# soap is used to generate _suds.vhd files
$(BUILDDIR)/soap: soap/soap.c soap/unpack.c
	mkdir -p $(BUILDDIR)
	$(CC) -std=gnu99 -Wall -Wextra -O0 -ggdb3 -o $@ -g $^

ifeq ($(CREATESETS_ENABLELOG),1)
CREATESETS_LOGOPTION_NEW 	:= -v > $(CREATESETS_LOGFILE)
CREATESETS_LOGOPTION_APPEND := -v >> $(CREATESETS_LOGFILE)
else
CREATESETS_LOGOPTION_NEW 	:=
CREATESETS_LOGOPTION_APPEND :=
endif

$(CREATESETS_CACHEFILE): $(CREATESETSPY) $(CREATESETS_ENTITYFILE) $(CREATESETS_BUSFILE) $(CREATESETS_VHDLFILES)
	$(info The process below will take some seconds, please wait...)
	python3 $(CREATESETSPY) \
	-e $(CREATESETS_ENTITYFILE) \
	-b $(CREATESETS_BUSFILE) \
	--vhdl-files $(CREATESETS_VHDLFILES) \
	-o $(CREATESETS_OUTPUTDIR) \
	-p $(CREATESETS_PACKAGENAME) \
	--generate cache $(CREATESETS_LOGOPTION_NEW)

set/%_set.vhd: $(CREATESETS_CACHEFILE)
	python3 $(CREATESETSPY) \
	-u \
	-o $(CREATESETS_OUTPUTDIR) \
	-p $(CREATESETS_PACKAGENAME) \
	--generate entity \
	--entity $(patsubst %_set.vhd,%_set,$(notdir $@)) $(CREATESETS_LOGOPTION_APPEND)

$(CREATESETS_PACKAGEFILE): $(CREATESETS_CACHEFILE)
	python3 $(CREATESETSPY) \
	-u \
	-o $(CREATESETS_OUTPUTDIR) \
	-p $(CREATESETS_PACKAGENAME) \
	--generate package $(CREATESETS_LOGOPTION_APPEND)

$(CREATESETS_TBFILE): $(CREATESETS_CACHEFILE)
	python3 $(CREATESETSPY) \
	-u \
	-o $(CREATESETS_OUTPUTDIR) \
	-p $(CREATESETS_PACKAGENAME) \
	--generate tb $(CREATESETS_LOGOPTION_APPEND)

# this is the basic method of generating a _suds.vhd file
# however, a few particular _suds.vhd require special handling and they are handled with specific targets below
cadr/cadr_%_suds.vhd: $(DRWDIR)/%.drw $(BUILDDIR)/soap $(FIXSUDSPY) Makefile dip/dip.vhd
	$(BUILDDIR)/soap -n $< > $@
	python3 $(FIXSUDSPY) -v $@

# modify bcterm components, soap emits dip names without @, so there are mistakes, 1b15 is used twice etc.
cadr/cadr_bcterm_suds.vhd: $(DRWDIR)/bcterm.drw $(BUILDDIR)/soap $(FIXSUDSPY) Makefile dip/dip.vhd
	$(BUILDDIR)/soap -n $< > $@
	sed $(SEDOPTIONS) 's/bcterm_1b15 : dip_sip220_330_8 port map (p2 => mem0/bcterm_1b15_1 : dip_sip220_330_8 port map (p2 => mem0/' $@
	sed $(SEDOPTIONS) 's/bcterm_1b15 : dip_sip220_330_8 port map (p2 => mem6/bcterm_1b15_2 : dip_sip220_330_8 port map (p2 => mem6/' $@
	sed $(SEDOPTIONS) 's/bcterm_1b20 : dip_sip220_330_8 port map (p2 => mem12/bcterm_1b20_1 : dip_sip220_330_8 port map (p2 => mem12/' $@
	sed $(SEDOPTIONS) 's/bcterm_1b20 : dip_sip220_330_8 port map (p2 => mem18/bcterm_1b20_2 : dip_sip220_330_8 port map (p2 => mem18/' $@
	sed $(SEDOPTIONS) 's/bcterm_1b25 : dip_sip220_330_8 port map (p2 => mem24/bcterm_1b25_1 : dip_sip220_330_8 port map (p2 => mem24/' $@
	sed $(SEDOPTIONS) 's/bcterm_1b25 : dip_sip220_330_8 port map (p2 => mem30/bcterm_1b25_2 : dip_sip220_330_8 port map (p2 => mem30/' $@
	python3 $(FIXSUDSPY) -v $@

# modify clock1 to alias -tpdone to -tpw60, this is a simple wire in the schematics
# this is done after fix-suds.py because it may modify it or get confused with these additions
cadr/cadr_clock1_suds.vhd: $(DRWDIR)/clock1.drw $(BUILDDIR)/soap $(FIXSUDSPY) Makefile dip/dip.vhd
	$(BUILDDIR)/soap -n $< > $@
ifeq ($(OS),Darwin)
	sed $(SEDOPTIONS) 's/^architecture.*/&\'$$'\nalias \\\\-tpdone\\\\ : std_logic is \\\\-tpw60\\\\;/' $@
else
	sed $(SEDOPTIONS) 's/^architecture.*/&\nalias \\-tpdone\\ : std_logic is \\-tpw60\\;/' $@
endif
	python3 $(FIXSUDSPY) -v $@

# modify clock2_1c10, change \machruna l\ to \-machruna\
# this seems to be a mistake in drw, in wlr the 1c10 is connected to -machruna
cadr/cadr_clock2_suds.vhd: $(DRWDIR)/clock2.drw $(BUILDDIR)/soap $(FIXSUDSPY) Makefile dip/dip.vhd
	$(BUILDDIR)/soap -n $< > $@
	sed $(SEDOPTIONS) 's/\\machruna l\\/\\-machruna\\/g' $@
	python3 $(FIXSUDSPY) -v $@

# add rom file
cadr/cadr_dspctl_suds.vhd: $(DRWDIR)/dspctl.drw $(BUILDDIR)/soap $(FIXSUDSPY) Makefile dip/dip.vhd
	$(BUILDDIR)/soap -n $< > $@
	sed $(SEDOPTIONS) -E 's/^([[:space:]]*([^[:space:]]+)[[:space:]]*:[[:space:]]*dip_5610)[[:space:]]+port map/\1 generic map (fn => "rom\/\2.hex") port map/' $@
	python3 $(FIXSUDSPY) -v $@

# add rom files
cadr/cadr_mskg4_suds.vhd: $(DRWDIR)/mskg4.drw $(BUILDDIR)/soap $(FIXSUDSPY) Makefile dip/dip.vhd
	$(BUILDDIR)/soap -n $< > $@
	sed $(SEDOPTIONS) -E 's/^([[:space:]]*([^[:space:]]+)[[:space:]]*:[[:space:]]*dip_5600)[[:space:]]+port map/\1 generic map (fn => "rom\/\2.hex") port map/' $@
	python3 $(FIXSUDSPY) -v $@
\
# modify olord2_1a19 port map
# remove two inverters from @1a19,p12 to -power reset, -power reset is directly driven by @1a19,p12
cadr/cadr_olord2_suds.vhd: $(DRWDIR)/olord2.drw $(BUILDDIR)/soap $(FIXSUDSPY) Makefile dip/dip.vhd
	$(BUILDDIR)/soap -n $< > $@
	sed $(SEDOPTIONS) 's/olord2_1a19.*/olord2_1a19 : dip_16dummy port map (p12 => \\-power reset\\, p13 => \\-boot2\\, p14 => \\-boot1\\, p15 => hi2, p16 => hi1);/g' $@
	sed $(SEDOPTIONS) '/olord2_1a20 : dip_74ls14 port map (p2 => \\@1a20,p9\\);/d' $@
	sed $(SEDOPTIONS) '/olord2_1a20 : dip_74ls14 port map (p8 => \\-power reset\\, p9 => \\@1a20,p2\\);/d' $@
	python3 $(FIXSUDSPY) -v $@

# replace til309 components with 5x_til309 component
cadr/cadr_pctl_suds.vhd: $(DRWDIR)/pctl.drw $(BUILDDIR)/soap $(FIXSUDSPY) Makefile dip/dip.vhd
	$(BUILDDIR)/soap -n $< > $@
ifeq ($(CADR4_TILONCONSOLE),1)
	sed $(SEDOPTIONS) '/pctl_1f16.*/d' $@
	sed $(SEDOPTIONS) '/pctl_1f17.*/d' $@
	sed $(SEDOPTIONS) '/pctl_1f18.*/d' $@
	sed $(SEDOPTIONS) '/pctl_1f19.*/d' $@
	sed $(SEDOPTIONS) 's/pctl_1f20.*/pctl_5x_til309 : dip_5x_til309 port map (p14 => pc13, p13 => pc12, p12 => pc11, p11 => pc10, p10 => pc9, p9 => pc8, p8 => pc7, p7 => pc6, p6 => pc5, p5 => pc4, p4 => pc3, p3 => pc2, p2 => pc1, p1 => pc0, p15 => promenable, p16 => ipe, p17 => dpe, p18 => tilt0, p19 => tilt1);/g' $@	
endif	
	python3 $(FIXSUDSPY) -v $@

# add rom files	
cadr/cadr_prom0_suds.vhd: $(DRWDIR)/prom0.drw $(BUILDDIR)/soap $(FIXSUDSPY) Makefile dip/dip.vhd
	$(BUILDDIR)/soap -n $< > $@
	sed $(SEDOPTIONS) -E 's/^([[:space:]]*prom0_([^[:space:]]+)[[:space:]]*:[[:space:]]*dip_74s472)[[:space:]]+port map/\1 generic map (fn => "rom\/promh9.\2.hex") port map/' $@
	python3 $(FIXSUDSPY) -v $@

# add rom files
# all prom1 chips point to prom.00.hex but prom1_1b20
# prom1_1b20 (providing the last byte) points to prom.80.hex (because it contains the parity bit)
cadr/cadr_prom1_suds.vhd: $(DRWDIR)/prom1.drw $(BUILDDIR)/soap $(FIXSUDSPY) Makefile dip/dip.vhd
	$(BUILDDIR)/soap -n $< > $@	
	sed $(SEDOPTIONS) -E 's/^([[:space:]]*[^[:space:]]+[[:space:]]*:[[:space:]]*dip_74s472)[[:space:]]+port map/\1 generic map (fn => "rom\/prom.00.hex") port map/' $@
	sed $(SEDOPTIONS) -E 's/^([[:space:]]*prom1_1b20[[:space:]]*:[[:space:]]*dip_74s472)[[:space:]]+generic map \(fn => "rom\/prom\.00\.hex"\)/\1 generic map (fn => "rom\/prom.80.hex")/' $@
	python3 $(FIXSUDSPY) -v $@	

.PHONY: all ttl-check check run-% run-tb wf-% wf-tb clean dist-clean help

all: $(EXES)

ttl-check: $(TTL_EXES)
	for TB_EXE in $^; do TB=$$TB_EXE make run-tb || exit; done

check: $(EXES)
	for EXE in $^; do TB=$$EXE make run-tb || exit; done

# below is smart handling of wave opt file
# if file does not exist, it is not used
# if file exists
## if first line is "recreate", then it is deleted and recreated
## else if first line is "ignore", then it is ignored
## else it is used

WAVEOPTFILE := $(patsubst %.vhd,%.opt,$(shell find . -name "$(notdir $(TB)).vhd"))
#$(info wave opt file: $(WAVEOPTFILE))
WAVEFILE := $(BUILDDIR)/$(notdir $(TB)).ghw
ifneq ("$(wildcard $(WAVEOPTFILE))","")
WAVEOPTCONTENTS := $(shell head -1 $(WAVEOPTFILE))
ifeq ("$(WAVEOPTCONTENTS)","recreate")
$(info recreating wave opt file: $(WAVEOPTFILE))
WAVEOPTFILERECREATE := 1
GHDLWAVEOPTIONS := --wave=$(WAVEFILE) --write-wave-opt=$(WAVEOPTFILE)
else ifeq ("$(WAVEOPTCONTENTS)","ignore")
$(info ignoring wave opt file: $(WAVEOPTFILE))
GHDLWAVEOPTIONS := --wave=$(WAVEFILE)
else
$(info using wave opt file: $(WAVEOPTFILE))
GHDLWAVEOPTIONS := --wave=$(WAVEFILE) --read-wave-opt=$(WAVEOPTFILE)
endif
else
GHDLWAVEOPTIONS := --wave=$(WAVEFILE)
endif

run-%: $(BUILDDIR)/%_tb
	TB=$< make run-tb

# --workdir does not work for this purpose with ghdl run
run-tb: $(TB)
	$< $(GHDLSIMOPTIONS)

wf-%: $(BUILDDIR)/%_tb
	TB=$< make wf-tb

wf-tb: $(TB)
ifeq ($(WAVEOPTFILERECREATE),1)	
	$(RM) $(WAVEOPTFILE)
endif
	$< $(GHDLSIMOPTIONS) $(GHDLWAVEOPTIONS) --stop-time=10us

surfer-%: $(BUILDDIR)/%_tb
	TB=$< make surfer-tb

surfer-tb: $(TB)
	TB=$(TB) make wf-tb
	surfer $(WAVEFILE)

clean:
	$(RM) -rf $(BUILDDIR)

dist-clean: clean
	$(RM) -f cadr/cadr_*_suds.vhd
	$(RM) -f set/*_set.vhd $(CREATESETS_PACKAGEFILE) $(CREATESETS_TBFILE)
	$(RM) -f $(CREATESETS_CACHEFILE)

help: 
	@echo "make all: build all testbenches"
	@echo "make check: run all testbenches"
	@echo "make ttl-check: run all ttl testbenches"
	@echo "make run-X: run testbench X (build/X_tb)"
	@echo "make wf-X: run testbench X (build/X_tb) to create waveforms"
	@echo "make surfer-X: same as wf-X but also runs surfer with the waveform file"
	@echo "make clean: clean build directory"
	@echo "make dist-clean: clean and also remove suds and set files"
	@echo "make help: show this help"