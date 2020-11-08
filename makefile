SHELL = /bin/bash

# To do:
# Add a global interactive argument so that each stage can be run manually.
# Maybe add constants here for the arguments to export.tcl.
# Do a search for the files to compile.

# Debug: use make print-X to print the value of variable X.
print-%: ; @echo $* = $($*)

# The following constants can be overriden at the command line with -e CONSTANT=<whatever>
TOP = platform
TB = top_tb
#tbfiles = $(wildcard ./HW/src/tb/*.sv)
TECHNOLOGY = xc7z030ffg676-1
VIVADO_MODE = batch# override at command line with -e VIVADO_MODE=tcl or -e VIVADO_MODE=gui
XILINX_LIBS = /media/ian/Toshiba/Vivado/2019.2/xilinx_ibs

help:
	@echo "normal use: make export | compile | import | build | package | copy | clean"

export:
	@echo --Exporting Top-Level--
	vivado -mode $(VIVADO_MODE) -notrace -nojournal -nolog -source export.tcl -tclargs -top $(TOP) -technology $(TECHNOLOGY) -project in_memory
	@echo --Export Top-Level Done--

.PHONY: vivado
vivado:
	vivado ./sandbox/in_memory.xpr -nojournal -nolog

compile: export
	@echo --Compiling Top-Level--
	cd ./sandbox/questa; \
	awk '!(/elaborate/&&NF==1 && !/\(\)/) && !(/simulate/&&NF==1 && !/\(\)/) {print $0}' ./$(TOP).sh > ./temp1.sh; \
	chmod u+x ./temp1.sh; \
	./temp1.sh -lib_map_path $(XILINX_LIBS);
	$(shell touch $@)
	@echo --Compile Top-Level Done--

.PHONY: questa
questa:
	cd ./sandbox/questa; \
	vsim

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

vmap:	compile
	@echo --Compiling Test-Bench--
	cd ./sandbox/questa; \
	vmap $(TOP) questa_lib/msim/xil_defaultlib
	$(shell touch $@)


all: ./HW/src/tb/top_tb.svo ./HW/src/tb/eth_tb.svo

./HW/src/tb/top_tb.svo: ./HW/src/tb/top_tb.sv
	vlog -work $(TOP) $<
	touch $@

./HW/src/tb/eth_tb.svo: ./HW/src/tb/eth_tb.sv
	cp $< $@


we're on p78 of the make book


#COME BACK TO THIS
#COME BACK TO THIS VPATH = ./HW/src/tb
#COME BACK TO THIS objects := $(patsubst %.sv, %.svo, $(wildcard *.sv) )
#COME BACK TO THIS $(objects): %.svo: %.sv
#COME BACK TO THIS 	cp $< $@
#COME BACK TO THIS
#COME BACK TO THIS all: $(objects)




#	echo $<
#	touch ./HW/src/tb/$@.svo

#./HW/src/tb/*.sv : ./HW/src/tb/*.o


#	vlog -dirpath "./sandbox/questa" -work $(TOP) ./HW/src/tb/top_tb.sv
#	vlog -dirpath "./sandbox/questa" -work $(TOP) ./HW/src/tb/eth_tb.sv


#	vlog -dirpath "./sandbox/questa" -work $(TOP) $( eval python3 ./tbfiles.py )

#	echo $(tbfiles)

#	vlog -work $(TOP) $(tbfiles); \
#	cat elaborate.do | sed 's/xil_defaultlib.$(TOP)/$(TOP).$(TB)/; s/$(TOP)_opt/$(TB)_opt/' > ./temp2.sh; \

#	python3 ./tbfiles.py


#	echo $(tb_files)

#	$(info $(tb_files) $(origin tb_files))
#	echo $(tb_files)
#	$(shell ls)
#	cd ./sandbox/questa; \
#	vmap $(TOP) questa_lib/msim/xil_defaultlib; \
#	vlog -work $(TOP) $(tb_files); \
#	cat elaborate.do | sed 's/xil_defaultlib.$(TOP)/$(TOP).$(TB)/; s/$(TOP)_opt/$(TB)_opt/' > ./temp2.sh; \
#	chmod u+x ./temp2.sh; \
##	./temp2.sh
#	@echo --Compile Test-Bench Done--
## (echo "import os"; echo "print(os.path.relpath('$(destination_dir)', '$(current_dir)'))" ) | python
##	tb_files := ./test.py;

import:
	cd ./PX/os; \
	petalinux-config --get-hw-description=..

build:
	cd ./PX/os; \
	petalinux-build

package:
	cd ./PX/os/images/linux; \
	petalinux-package --boot --fsbl zynq_fsbl.elf --fpga system.bit --uboot --force

copy:
	cd ./PX/os/images/linux; \
	cp BOOT.BIN /media/ian/BOOT; \
	cp image.ub /media/ian/BOOT; \
	cp system.dtb /media/ian/BOOT; \
	umount /media/ian/BOOT; \
	umount /media/ian/ROOT_FS;

.PHONY: clean
clean:
	@rm -rf export
	@rm -rf sandbox
