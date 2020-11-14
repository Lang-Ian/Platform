SHELL = /bin/bash

# To do:
# Add a global interactive argument so that each stage can be run manually.
# Maybe add constants here for the arguments to export.tcl.
# Do a search for the files to compile.
# Understanding this makefile:  https://dev.to/deciduously/how-to-make-a-makefile-1dep
# Maybe configure the simulation length.
# Combine temp1 and temp2 and put them in the sandbox.
# Pass OBJDIR into export script.
# Add a hard link to wave.do.
# Figure out how to compile tb without optimizing.  It might need another stage.
# Add a constant so that you can control the text editor in Vivado.
# Maybe pass the name of the file to be touched into export.tcl.
# Decide when to call export based upon when a file has changed.
# Write out .do files for working interactively?  Or make the makefile work from anywhere.

# Debug utility: use make print-X to print the value of variable X.
print-%: ; @echo $* = $($*)

# Recursive Wildcard Search
rwildcard=$(foreach d, $(wildcard $(1:=/*)), $(call rwildcard,$d,$2) $(filter $(subst *,%,$2),$d))

# The following constants can be overriden at the command line with -e CONSTANT=<whatever>
TOP         = platform
TB          = top_tb
TECHNOLOGY  = xc7z030ffg676-1
VIVADO_MODE = batch# override at command line with -e VIVADO_MODE=tcl or -e VIVADO_MODE=gui
XILINX_LIBS = /media/ian/Toshiba/Vivado/2019.2/xilinx_ibs
OBJDIR     := ./sandbox# max one deep

# Don't touch these unless you understand them :)
SOURCES    := $(call rwildcard, ./HW/src/tb, *.sv)
OBJ        := $(addprefix $(OBJDIR)/, $(addsuffix .svo, $(basename $(notdir $(SOURCES)))))
#OBJ        := $(abspath $(OBJDIR)/$(notdir $(patsubst %.sv, %.svo, $(SOURCES))))
DOFILES    := $(call rwildcard, ./HW/src/tb, *.do)
DOLINKS    := $(abspath  $(OBJDIR)/questa/$(notdir $(DOFILES)))

.PHONY: all
all: $(OBJDIR)/.wave

$(OBJDIR)/.wave: $(OBJDIR)/.sim
	cd $(OBJDIR)/questa; \
	vsim -view vsim.wlf -do "source $(DOLINKS)"

.PHONY: simulate
simulate: $(OBJDIR)/.sim

$(OBJDIR)/.sim: $(DOFILES) $(OBJDIR)/.optimize
	@echo -- Running Simulation --
	cd $(OBJDIR)/questa; \
	vsim -c -do "vsim -voptargs=+acc $(TOP).$(TB)_opt -wlf vsim.wlf; source $(firstword $(DOLINKS));  run 41 us;  exit;"
	touch $@

.PHONY: dofiles
dofiles: $(DOLINKS)

$(DOLINKS):
	@echo -- Linking Do Files --
	mkdir -p $(dir $(DOLINKS))
	ln  $(DOFILES) $(DOLINKS)

$(OBJDIR)/.optimize: $(OBJ)
	@echo -- Optimizing --
	cd $(OBJDIR)/questa; \
	cat elaborate.do | sed 's/xil_defaultlib.$(TOP)/$(TOP).$(TB)/; s/$(TOP)_opt/$(TB)_opt/' > ./temp2.sh; \
	chmod u+x ./temp2.sh; \
	./temp2.sh
	touch $@

.PHONY: compile
compile: $(OBJ)

$(OBJ):  $(SOURCES) $(OBJDIR)/.vmap
	@echo -- Compiling Test Bench --
	cd $(OBJDIR)/questa; \
	vlog  -work $(TOP) ../../$?
	touch $@
	@echo compiling

$(OBJDIR)/.vmap:	$(OBJDIR)/.compile
	@echo -- Mapping Work Library --
	cd $(OBJDIR)/questa; \
	vmap $(TOP) questa_lib/msim/xil_defaultlib;
	touch $@

$(OBJDIR)/.compile: $(OBJDIR)/.export
	@echo -- Compiling Exported DUT --
	cd $(OBJDIR)/questa; \
	awk '!(/elaborate/&&NF==1 && !/\(\)/) && !(/simulate/&&NF==1 && !/\(\)/) {print $0}' ./$(TOP).sh > ./temp1.sh; \
	chmod u+x ./temp1.sh; \
	./temp1.sh -lib_map_path $(XILINX_LIBS);
	touch $@

.PHONY: export
export: $(OBJDIR)/.export

$(OBJDIR)/.export:
	@echo -- Exporting DUT Top Level --
	vivado -mode $(VIVADO_MODE) -notrace -nojournal -nolog -source export.tcl -tclargs -top $(TOP) -technology $(TECHNOLOGY) -project in_memory

.PHONY: vivado
vivado:
	vivado $(OBJDIR)/in_memory.xpr -nojournal -nolog

.PHONY: questa
questa:
	cd $(OBJDIR)/questa; \
	vsim

.PHONY: clean
clean:
	@rm  -rf $(OBJDIR)

.PHONY: help
help:
	@echo "make {export|compile|simulate|all|questa|vivado|clean|help}"
