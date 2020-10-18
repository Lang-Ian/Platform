SHELL = /bin/bash

# To do:
# Add a global interactive argument so that each stage can be run manually.
# Maybe add constants here for the arguments to export.tcl.
# Do a search for the files to compile.

LIBRARY = PLATFORM

help:
	@echo "	normal use: make export | compile | import | build | package | copy | clean"

export:
	@echo --Exporting Top-Level--
	vivado -mode tcl -notrace -nojournal -nolog -source export.tcl -tclargs -top platform -technology xc7z030ffg676-1 -project in_memory
	$(shell touch $@)
	@echo --Export Top-Level Done--

compile: export
	@echo --Compiling Top-Level--
	cd ./sandbox/questa; \
	awk '!(/elaborate/&&NF==1 && !/\(\)/) && !(/simulate/&&NF==1 && !/\(\)/) {print $0}' ./platform.sh > ./temp.sh; \
	chmod u+x ./temp.sh; \
	./temp.sh -lib_map_path /media/ian/Toshiba/Vivado/2019.2/xilinx_ibs
	$(shell touch $@)
	@echo --Compile Top-Level Done--

tb:	compile
	@echo --Compiling Test-Bench--
	cd ./sandbox/questa; \
	vmap $(LIBRARY) questa_lib/msim/xil_defaultlib; \
	vlib tb; \
	vlog -work $(LIBRARY) ../../HW/src/tb/top_tb.sv; \
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
