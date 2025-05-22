# hdlmake.mk --- HDL build system

HDLMAKE_DIR	:= $(dir $(lastword $(MAKEFILE_LIST)))

SIM		?= icarus
FORMAL		?= none
VENDOR		?= none
PROGRAMMER	?= none
VCDFORMAT	?= ghw

EMACS		?= emacs

.DEFAULT: all

.PHONY: all
.PHONY: clean
.PHONY: check

all::
clean::
check::

ifneq ($(SIM),none)
.SECONDEXPANSION:
all:: $$(TESTBENCHES)
clean:: clean-$(SIM)

tb-%:;  TESTBENCH=$* $(MAKE) tb
vcd-%:; TESTBENCH=$* $(MAKE) vcd
check::; @$(MAKE) $(addprefix tb-,$(TESTBENCHES))

include $(HDLMAKE_DIR)/$(SIM).mk
endif

ifneq ($(FORMAL),none)
include $(HDLMAKE_DIR)/$(FORMAL).mk
endif

ifneq (,$(wildcard $(TOPLEVEL)_sim.cpp))
all:: $$(PROJECT)
clean:: clean-verilator

include $(HDLMAKE_DIR)/verilator.mk
endif

ifneq ($(VENDOR),none)
include $(HDLMAKE_DIR)/$(VENDOR).mk
clean:: clean-$(VENDOR)

# No point in including this if we have no way to synthesize.
ifneq ($(PROGRAMMER),none)
include $(HDLMAKE_DIR)/fpgaprog.mk
endif
endif

.PHONY: indent
indent:
	@test "$(SRCS_V)" || ( echo "error: SRCS_V: required variable is empty" 1>&2; exit 1 )
	@test "$(TB_SRCS_V)" || ( echo "warning: TB_SRCS_V: variable is empty" 1>&2 )
	$(EMACS) -batch $(SRCS_V) $(TB_SRCS_V) -f verilog-batch-indent -f verilog-batch-auto

.PHONY: help
help:
	@echo "Available targets:"
	@echo "	all		Compiles all test-benches and simulation (if any)."
	@echo "	info		Show current configuration."
	@echo "	check		Runs all test-benches (if any)."
	@echo "	clean		Cleans up any build artifacts."
	@echo "	help		Prints out a help message."
	@echo "	indent		Format code using verilog-mode and GNU Emacs."
ifneq (,$(wildcard $(TOPLEVEL)_sim.cpp)) # Verilator
	@echo "	sim		Runs top-level simulation."
endif
ifneq ($(FORMAL),none)
	@echo "	formal		Does a formal verification of the project."
endif
ifneq ($(SIM),none)
	@echo "	tb		Runs the default test-bench."
	@echo "	vcd		Same as above, but starts a VCD viewer."
	@echo "	tb-TB		Runs the test-bench TB."
	@echo "	vcd-TB		Same as above, but starts a VCD viewer."
endif
ifneq ($(VENDOR),none)
	@echo "	syn		Synthesis current project."
ifneq ($(PROGRAMMER),none)
	@echo "	prog		Programs target."
endif
endif
ifneq ($(VENDOR),none)
	@$(MAKE) -s help-$(VENDOR)
endif

.PHONY: info
info:
ifneq ($(SIM),none)
	@echo "Simulator: $(SIM)"
	@echo "Available test-benches:"
	@echo "	$(TESTBENCHES)" | fmt
endif
ifneq ($(VENDOR),none)
	@$(MAKE) -s info-$(VENDOR)
endif

# hdlmake.mk ends here.
