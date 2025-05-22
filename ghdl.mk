# ghdl.mk --- simulation using GHDL

PROJECT		?= $(error PROJECT: variable not set)

TESTBENCHES	?= $(PROJECT)_tb
TESTBENCH	?= $(firstword $(TESTBENCHES))
TB_SRCS_VHD	?=

SRCS_VHD	?= $(PROJECT).vhd

VHDSTND		?= 93
GHDL		?= ghdl 

GHDLFLAGS		?=
GHDLMAKEFLAGS 	?=
GHDLRUNFLAGS  	?=

ifneq ($(VCDFORMAT),ghw)
GHWOPT_FILE	= $(wildcard $(TESTBENCH).ghwopt)
endif

$(PROJECT)-obj$(VHDSTND).cf: $(SRCS_VHD)
	$(GHDL) import --std=$(VHDSTND) $(GHDLFLAGS) --work=$(PROJECT) $^

work-obj$(VHDSTND).cf: $(TB_SRCS_VHD) $(TESTBENCH).vhd
	$(GHDL) import --std=$(VHDSTND) $(GHDLFLAGS) --work=work $^

$(TESTBENCHES): $$@.vhd work-obj$(VHDSTND).cf $(PROJECT)-obj$(VHDSTND).cf
	$(GHDL) make --std=$(VHDSTND) $(GHDLFLAGS) $(GHDLMAKEFLAGS) -P$(PROJECT) $@

$(TESTBENCH).fst:
	$(GHDL) run $(GHDLFLAGS) $(TESTBENCH) --fst=$(TESTBENCH).fst $(GHDLRUNFLAGS)

$(TESTBENCH).ghw:
	$(GHDL) run $(GHDLFLAGS) $(TESTBENCH) --wave=$(TESTBENCH).ghw $(if $(GHWOPT_FILE), --read-wave-opt=$(GHWOPT_FILE)) $(GHDLRUNFLAGS)

$(TESTBENCH).vcd:
	$(GHDL) run $(GHDLFLAGS) $(TESTBENCH) --vcd=$(TESTBENCH).vcd $(GHDLRUNFLAGS)

.PHONY: tb
tb: $(TESTBENCH) $(TESTBENCH).$(VCDFORMAT)

.PHONY: vcd
vcd: tb
ifeq ($(VCDFORMAT),vcd)
	cat $(TESTBENCH).vcd | vcd
else
	gtkwave $(TESTBENCH).$(VCDFORMAT) $(wildcard $(TESTBENCH).gtkw)
endif

.PHONY: clean-ghdl
clean-ghdl:
	rm -f $(TESTBENCHES)
	rm -f *_tb
	rm -f *.ghw *.vcd *.fst
	rm -f *.o
	rm -f *.cf

# ghdl.mk ends here.
