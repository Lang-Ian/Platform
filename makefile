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

.PHONY: all clean help

# Debug utility: use make print-X to print the value of variable X.
print-%: ; @echo $* = $($*)

# Recursive Wildcard Search
rwildcard=$(foreach d,$(wildcard $(1:=/*)),$(call rwildcard,$d,$2) $(filter $(subst *,%,$2),$d))

# The following constants can be overriden at the command line with -e CONSTANT=<whatever>
TOP         = platform
TB          = top_tb
TECHNOLOGY  = xc7z030ffg676-1
VIVADO_MODE = batch# override at command line with -e VIVADO_MODE=tcl or -e VIVADO_MODE=gui
XILINX_LIBS = /media/ian/Toshiba/Vivado/2019.2/xilinx_ibs

OBJDIR    = ./sandbox# max one deep
SOURCEDIR = ./HW/src/tb
SOURCES   := $(call rwildcard, ./HW/src/tb, *.sv)
OBJ       := $(patsubst %.sv, %.svo, $(SOURCES))

all: $(OBJDIR)/.wave

.PHONY: $(OBJDIR)/.wave
$(OBJDIR)/.wave: $(OBJDIR)/.sim
	cd $(OBJDIR)/questa; \
	vsim -view vsim.wlf -do "source ../../wave.do"

$(OBJDIR)/.sim: $(OBJDIR)/.optimize
	@echo -- Running Simulation --
	cd $(OBJDIR)/questa; \
	vsim -c -do "vsim -voptargs=+acc $(TOP).$(TB)_opt; source ../../wave.do;  run 5 us;  exit;"
	touch $@

$(OBJDIR)/.optimize: $(OBJ)
	@echo -- Optimizing --
	cd $(OBJDIR)/questa; \
	cat elaborate.do | sed 's/xil_defaultlib.$(TOP)/$(TOP).$(TB)/; s/$(TOP)_opt/$(TB)_opt/' > ./temp2.sh; \
	chmod u+x ./temp2.sh; \
	./temp2.sh
	touch $@

$(OBJ):  $(SOURCES) $(OBJDIR)/.vmap
	@echo -- Compiling Test Bemch Files --
	cd $(OBJDIR)/questa; \
	vlog  -work $(TOP) ../../$<
#	vlog -modelsimini $(OBJDIR)/questa/modelsim.ini -work $(TOP) $<
	touch $@

$(OBJDIR)/.vmap:	$(OBJDIR)/.compile
	@echo -- Mapping Work Library --
	cd $(OBJDIR)/questa; \
	vmap $(TOP) questa_lib/msim/xil_defaultlib;
	touch $@

$(OBJDIR)/.compile: $(OBJDIR)/.export
	@echo -- Compiling Exported DUT Top Level --
	cd $(OBJDIR)/questa; \
	awk '!(/elaborate/&&NF==1 && !/\(\)/) && !(/simulate/&&NF==1 && !/\(\)/) {print $0}' ./$(TOP).sh > ./temp1.sh; \
	chmod u+x ./temp1.sh; \
	./temp1.sh -lib_map_path $(XILINX_LIBS);
	touch $@

$(OBJDIR)/.export:
	@echo -- Exporting DUT Top Level --
	vivado -mode $(VIVADO_MODE) -notrace -nojournal -nolog -source export.tcl -tclargs -top $(TOP) -technology $(TECHNOLOGY) -project in_memory
	touch $@

.PHONY: vivado
vivado:
	vivado $(OBJDIR)/in_memory.xpr -nojournal -nolog

.PHONY: questa
questa:
	cd $(OBJDIR)/questa; \
	vsim

clean:
	@rm  -rf $(OBJDIR)

help:
	@echo "normal use: make {.export | compile | import | build | package | copy | clean{} 1>&2 && false"




#SOURCES_ABSOLUTE := $(patsubst $(SOURCEDIR)/%.sv, $(shell pwd)/$(SOURCEDIR)/%.sv, $(RAW))
#current_dir = $(shell pwd)

#	vmap $(TOP) questa_lib/msim/xil_defaultlib  ???




## I think this needs a directory change.
#./HW/src/tb/top_tb.svo: ./HW/src/tb/top_tb.sv
#	vlog -work $(TOP) $<
#	touch $@

#./HW/src/tb/eth_tb.svo: ./HW/src/tb/eth_tb.sv
#	cp $< $@







#we're on p78 of the make book


#COME BACK TO THIS
#COME BACK TO THIS VPATH = ./HW/src/tb
#COME BACK TO THIS objects := $(patsubst %.sv, %.svo, $(wildcard *.sv) )
#COME BACK TO THIS $(objects): %.svo: %.sv
#COME BACK TO THIS 	cp $< $@
#COME BACK TO THIS
#COME BACK TO THIS all: $(objects)


#tb:
#	cd $(OBJDIR)/questa; \
#	cat elaborate.do | sed 's/xil_defaultlib.$(TOP)/$(TOP).$(TB)/; s/$(TOP)_opt/$(TB)_opt/' > ./temp2.sh; \
#	chmod u+x ./temp2.sh; \
#	./temp2.sh
#	@echo --Compile Test-Bench Done--
#
#
#import:
#	cd ./PX/os; \
#	petalinux-config --get-hw-description=..
#
#build:
#	cd ./PX/os; \
#	petalinux-build
#
#package:
#	cd ./PX/os/images/linux; \
#	petalinux-package --boot --fsbl zynq_fsbl.elf --fpga system.bit --uboot --force
#
#copy:
#	cd ./PX/os/images/linux; \
#	cp BOOT.BIN /media/ian/BOOT; \
#	cp image.ub /media/ian/BOOT; \
#	cp system.dtb /media/ian/BOOT; \
#	umount /media/ian/BOOT; \
#	umount /media/ian/ROOT_FS;
#
#clean:
#	@rm -rf export
#	@rm -rf sandbox



#	echo $<
#	touch ./HW/src/tb/$@.svo

#./HW/src/tb/*.sv : ./HW/src/tb/*.o


#	vlog -dirpath "$(OBJDIR)/questa" -work $(TOP) ./HW/src/tb/top_tb.sv
#	vlog -dirpath "$(OBJDIR)/questa" -work $(TOP) ./HW/src/tb/eth_tb.sv


#	vlog -dirpath "$(OBJDIR)/questa" -work $(TOP) $( eval python3 ./tbfiles.py )

#	echo $(tbfiles)

#	vlog -work $(TOP) $(tbfiles); \
#	cat elaborate.do | sed 's/xil_defaultlib.$(TOP)/$(TOP).$(TB)/; s/$(TOP)_opt/$(TB)_opt/' > ./temp2.sh; \

#	python3 ./tbfiles.py


#	echo $(tb_files)

#	$(info $(tb_files) $(origin tb_files))
#	echo $(tb_files)
#	$(shell ls)
#	cd $(OBJDIR)/questa; \
#	vmap $(TOP) questa_lib/msim/xil_defaultlib; \
#	vlog -work $(TOP) $(tb_files); \
#	cat elaborate.do | sed 's/xil_defaultlib.$(TOP)/$(TOP).$(TB)/; s/$(TOP)_opt/$(TB)_opt/' > ./temp2.sh; \
#	chmod u+x ./temp2.sh; \
##	./temp2.sh
#	@echo --Compile Test-Bench Done--
## (echo "import os"; echo "print(os.path.relpath('$(destination_dir)', '$(current_dir)'))" ) | python
##	tb_files := ./test.py;



#testy:
#	MY_VAR := $(shell python -c 'import sys; print int(sys.version_info >= (2,5))')

#all:
#	@echo MY_VAR IS $(MY_VAR)

#CURRENTLY != date
#tb_files=$(shell python -c 'import os; print("hello big boy")')
#tb_files=$(shell python -c 'for root, directories, files in os.walk( "./HW/src/tb" )
#	for name in files:
#		print(os.path.join(root, name))')
#tb_files=$(shell python ./test.py)


#tbfiles = $( python3 ./tbfiles.py )
