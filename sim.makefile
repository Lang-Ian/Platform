SHELL = /bin/bash

# Reference:  https://dev.to/deciduously/how-to-make-a-makefile-1dep

# To do:
# Organise this list, because it is out of date.
# Add a global interactive argument so that each stage can be run manually.
# Maybe add constants here for the arguments to export.tcl.
# Do a search for the files to compile.
# Understanding this makefile:  https://dev.to/deciduously/how-to-make-a-makefile-1dep
# Maybe configure the simulation length.  Add a constant.
# Combine temp1 and temp2 and put them in the sandbox.
# Pass BUILDDIR into export script.
# Add a hard link to wave.do. DONE
# Figure out how to compile tb without optimizing.  It might need another stage.  DONE
# Add a constant so that you can control the text editor in Vivado.
# Maybe pass the name of the file to be touched into export.tcl.
# Decide when to call export based upon when a file has changed.
# Write out .do files for working interactively?  Or make the makefile work from anywhere.
# Replace the .. with named directory.
# Make waveforms start in background.  Only start it if it isn't already running.
# Add the sandbox to .gitignore.
# Get the makefile to run from inside Modelsim. NO BUT THE SCRIPTS DO
# Don't attempt to cat simulate.do unless there is a directory there.
# Edit the auto-generated .do files so that they still work.
# It should be possible to run the simulation again - perhaps with a different test.
# Update the RTL version number each build.
# Sort out a way to re-run the simulation.  I think as it stands, it probably doesn't work without modifying a source file.

# Debug utility: make print-X prints value of X
print-%: ; @echo $* = $($*)

# The following constants can be overriden at the command line with -e CONSTANT=<whatever>
TOP         = platform
TB          = top_tb
TECHNOLOGY  = xc7z030ffg676-1
VIVADO_MODE = batch# override at command line with -e VIVADO_MODE=tcl or -e VIVADO_MODE=gui
XILINX_LIBS = /media/ian/Toshiba/Vivado/2019.2/xilinx_ibs

# Don't touch these unless you understand them :)
mkfile_path := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
mkfile_dir  := $(shell cd $(shell dirname $(mkfile_path)); pwd)
current_dir := $(notdir $(mkfile_dir))
BUILDDIR    := $(abspath $(mkfile_dir)/sandbox)
SOURCEDIR   := $(abspath $(mkfile_dir)/HW/src/tb)
SOURCES     := $(wildcard $(SOURCEDIR)/*.sv)
OBJ         := $(addprefix $(BUILDDIR)/, $(addsuffix .svo, $(basename $(notdir $(SOURCES)))))
DOFILES     := $(wildcard $(SOURCEDIR)/*.do)
DOLINKS     := $(addprefix $(BUILDDIR)/questa/, $(addsuffix .do, $(basename $(notdir $(DOFILES)))))

.PHONY: all
all: $(BUILDDIR)/.sim

.PHONY: wave
wave: $(BUILDDIR)/.sim
	cd $(BUILDDIR)/questa; \
	vsim -view vsim.wlf -do $(lastword $(DOLINKS))

$(BUILDDIR)/.sim: $(DOLINKS) $(BUILDDIR)/.optimize
	@echo -- Running Simulation --
	cd $(BUILDDIR)/questa; \
	vsim -c -do "vsim -voptargs=+acc $(TOP).$(TB)_opt -wlf vsim.wlf; source $(lastword $(DOLINKS));  run 41 us;  exit;"
	touch $@

$(DOLINKS):  $(BUILDDIR)/questa/%.do : $(SOURCEDIR)/%.do  $(BUILDDIR)/.optimize
	@echo -- Linking Do Files --
	ln -f $< $@

$(BUILDDIR)/.optimize: $(OBJ)
	@echo -- Optimizing --
	cd $(BUILDDIR)/questa; \
	cat elaborate.do | sed 's/xil_defaultlib.$(TOP)/$(TOP).$(TB)/; s/$(TOP)_opt/$(TB)_opt/' > ./temp2.sh; \
	chmod u+x ./temp2.sh; \
	./temp2.sh
	touch $@

.PHONY: compile
compile: $(OBJ)

$(OBJ): $(BUILDDIR)/%.svo : $(SOURCEDIR)/%.sv $(BUILDDIR)/.vmap
	@echo -- Compiling $< --
	cd $(BUILDDIR)/questa; \
	vlog  -work $(TOP) $<
	touch $@
	@echo compiling

$(BUILDDIR)/.vmap:	$(BUILDDIR)/.compile
	@echo -- Mapping Work Library --
	cd $(BUILDDIR)/questa; \
	vmap $(TOP) questa_lib/msim/xil_defaultlib;
	touch $@

$(BUILDDIR)/.compile: $(BUILDDIR)/.export
	@echo -- Compiling Exported DUT --
	cd $(BUILDDIR)/questa; \
	awk '!(/elaborate/&&NF==1 && !/\(\)/) && !(/simulate/&&NF==1 && !/\(\)/) {print $0}' ./$(TOP).sh > ./temp1.sh; \
	chmod u+x ./temp1.sh; \
	./temp1.sh -lib_map_path $(XILINX_LIBS);
	touch $@

.PHONY: export
export:
	@echo -- Exporting DUT Top Level --
	vivado -mode $(VIVADO_MODE) -notrace -nojournal -nolog -source export.tcl -tclargs -top $(TOP) -technology $(TECHNOLOGY) -project in_memory -sandbox $(BUILDDIR)

$(BUILDDIR)/.export:
	@echo -- Exporting DUT Top Level --
	vivado -mode $(VIVADO_MODE) -notrace -nojournal -nolog -source export.tcl -tclargs -top $(TOP) -technology $(TECHNOLOGY) -project in_memory -sandbox $(BUILDDIR)

.PHONY: vivado
vivado:
	vivado $(BUILDDIR)/in_memory.xpr -nojournal -nolog

.PHONY: questa
questa:
	cd $(BUILDDIR)/questa; \
	rm ./simulate.do; \
	echo "vsim -voptargs=+acc $(TOP).$(TB)_opt" > ./simulate.do; \
	vsim

.PHONY: clean
clean:
	@rm  -rf $(BUILDDIR)

.PHONY: help
help:
	@echo "make -f sim.makefile {all|export|wave|questa|vivado|clean|help}"
