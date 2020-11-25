SHELL = /bin/bash

# Reference:  https://dev.to/deciduously/how-to-make-a-makefile-1dep

# To do:
# Add a separate export stage that can be run without building.
# Perhaps give the log file a date in the name.
# It would be nice to put the three calls to build.tcl in a loop (see https://makefiletutorial.com).
# Make the script decide any files have changed and export needs to be run or not.  It should work the way linking is done in the above website.

# Debug utility: make print-X prints value of X
print-%: ; @echo $* = $($*)

# The following constants can be overriden at the command line with -e CONSTANT=<whatever>
TOP         = platform
TECHNOLOGY  = xc7z030ffg676-1
VIVADO_MODE = tcl# override at command line with -e VIVADO_MODE=tcl or -e VIVADO_MODE=gui

# Don't touch these unless you understand them :)
mkfile_path := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
mkfile_dir  := $(shell cd $(shell dirname $(mkfile_path)); pwd)
current_dir := $(notdir $(mkfile_dir))
BUILDDIR    := $(abspath $(mkfile_dir)/buildbox)

.PHONY: all
all: $(BUILDDIR)/.write

.PHONY: export
export:  $(BUILDDIR)/.build
	@echo "-- Exporting netlist for Petalinux --"
	vivado -mode $(VIVADO_MODE) -notrace -journal $(BUILDDIR)/vivado.journal -log $(BUILDDIR)/vivado.log -source build.tcl -tclargs -top $(TOP) -technology $(TECHNOLOGY) -project in_memory -sandbox $(BUILDDIR) -stage export

$(BUILDDIR)/.write:  $(BUILDDIR)/.build
	@echo "-- Writing netlist --"
	vivado -mode $(VIVADO_MODE)  -journal $(BUILDDIR)/vivado.journal -log $(BUILDDIR)/vivado.log -source build.tcl -tclargs -top $(TOP) -technology $(TECHNOLOGY) -project in_memory -sandbox $(BUILDDIR) -stage write

$(BUILDDIR)/.build:  $(BUILDDIR)/.synth
	@echo "-- Place & Route --"
	vivado -mode $(VIVADO_MODE)  -journal $(BUILDDIR)/vivado.journal -log $(BUILDDIR)/vivado.log -source build.tcl -tclargs -top $(TOP) -technology $(TECHNOLOGY) -project in_memory -sandbox $(BUILDDIR) -stage build

.PHONY: synth
synth:
	@echo "-- Synthesizing --"
	mkdir -p $(BUILDDIR)
	vivado -mode $(VIVADO_MODE)  -journal $(BUILDDIR)/vivado.journal -log $(BUILDDIR)/vivado.log -source build.tcl -tclargs -top $(TOP) -technology $(TECHNOLOGY) -project in_memory -sandbox $(BUILDDIR) -stage synth

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
	@echo "make -f build.makefile {all|synth|export|vivado|clean|help}"
