SHELL = /bin/bash

# To do:
# Add a separate export stage that can be run without building.
# Perhaps give the log file a date in the name.

# Debug utility: make print-X prints value of X
print-%: ; @echo $* = $($*)

# The following constants can be overriden at the command line with -e CONSTANT=<whatever>
TOP         = platform
TB          = top_tb
TECHNOLOGY  = xc7z030ffg676-1
VIVADO_MODE = tcl# override at command line with -e VIVADO_MODE=tcl or -e VIVADO_MODE=gui
XILINX_LIBS = /media/ian/Toshiba/Vivado/2019.2/xilinx_ibs

# Don't touch these unless you understand them :)
mkfile_path := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
mkfile_dir  := $(shell cd $(shell dirname $(mkfile_path)); pwd)
current_dir := $(notdir $(mkfile_dir))
BUILDDIR    := $(abspath $(mkfile_dir)/buildbox)
SOURCEDIR   := $(abspath $(mkfile_dir)/HW/src/tb)
SOURCES     := $(wildcard $(SOURCEDIR)/*.sv)
OBJ         := $(addprefix $(BUILDDIR)/, $(addsuffix .svo, $(basename $(notdir $(SOURCES)))))
DOFILES     := $(wildcard $(SOURCEDIR)/*.do)
DOLINKS     := $(abspath  $(BUILDDIR)/questa/$(notdir $(DOFILES)))

.PHONY: all
all: $(BUILDDIR)/.export

$(BUILDDIR)/.export:  $(BUILDDIR)/.build
	@echo "-- Exporting --"
	vivado -mode $(VIVADO_MODE) -notrace -journal $(BUILDDIR)/vivado.journal -log $(BUILDDIR)/vivado.log -source build.tcl -tclargs -top $(TOP) -technology $(TECHNOLOGY) -project in_memory -sandbox $(BUILDDIR) -stage export

$(BUILDDIR)/.build:  $(BUILDDIR)/.synth
	@echo "-- P&R --"
	vivado -mode $(VIVADO_MODE)  -journal $(BUILDDIR)/vivado.journal -log $(BUILDDIR)/vivado.log -source build.tcl -tclargs -top $(TOP) -technology $(TECHNOLOGY) -project in_memory -sandbox $(BUILDDIR) -stage build

$(BUILDDIR)/.synth:
	@echo "-- Synthesizing --"
	mkdir -p $(BUILDDIR)
	vivado -mode $(VIVADO_MODE)  -journal $(BUILDDIR)/vivado.journal -log $(BUILDDIR)/vivado.log -source build.tcl -tclargs -top $(TOP) -technology $(TECHNOLOGY) -project in_memory -sandbox $(BUILDDIR) -stage synth

.PHONY: vivado
vivado:
	vivado $(BUILDDIR)/in_memory.xpr -journal $(BUILDDIR)/vivado.journal -log $(BUILDDIR)/vivado.log

.PHONY: clean
clean:
	@rm  -rf $(BUILDDIR)

.PHONY: help
help:
	@echo "make -f build.makefile {all|vivado|clean|help}"