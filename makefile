SHELL = /bin/bash

# To do:
# Add a global interactive argument so that each stage can be run manually.
# Maybe add constants here for the arguments to export.tcl.
# Do a search for the files to compile.

# Use make print-X to print the value of variable X.
print-%: ; @echo $* = $($*)

# The following constants can be overriden at the command line with -e CONSTANT=<whatever>
TOP = PLATFORM
VIVADO = batch# override at command line with -e VIVADO=tcl | -e VIVADO=gui

help:
	@echo "normal use: make export | compile | import | build | package | copy | clean"

export:
	@echo --Exporting Top-Level--
	vivado -mode $(VIVADO) -notrace -nojournal -nolog -source export.tcl -tclargs -top $(TOP) -technology xc7z030ffg676-1 -project in_memory
	$(shell touch $@)
	@echo --Export Top-Level Done--

vivado:
	vivado -nojournal -nolog

compile: export
	@echo --Compiling Top-Level--
	cd ./sandbox/questa; \
	awk '!(/elaborate/&&NF==1 && !/\(\)/) && !(/simulate/&&NF==1 && !/\(\)/) {print $0}' ./$(TOP).sh > ./temp.sh; \
	chmod u+x ./temp.sh; \
	./temp.sh -lib_map_path /media/ian/Toshiba/Vivado/2019.2/xilinx_ibs;
	$(shell touch $@)
	@echo --Compile Top-Level Done--

questa:
	cd ./sandbox/questa; \
	vsim

tb:	compile
	@echo --Compiling Test-Bench--
	cd ./sandbox/questa; \
	vmap $(TOP) questa_lib/msim/xil_defaultlib; \
	vlib tb; \
	vlog -work $(TOP) ../../HW/src/tb/top_tb.sv; \
	@echo --Compile Test-Bench Done--

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

clean:
	@rm -rf export
	@rm -rf sandbox
