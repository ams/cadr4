.SUFFIXES:

include Makefile.config

ifeq ($(CADR4_HDLCOMPILER),ghdl)
include Makefile.ghdl
else ifeq ($(CADR4_HDLCOMPILER),nvc)
include Makefile.nvc
else 
	$(error "Unsupported HDL compiler: $(CADR4_HDLCOMPILER)")
endif

include Makefile.common