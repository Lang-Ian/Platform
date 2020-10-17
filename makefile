SHELL = /bin/bash

# I want to add a global interactive argument to this whole makefile that I can pass into the sub-stages.
# Maybe add constants here for the arguments to export.tcl.

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
	./platform.sh -lib_map_path /media/ian/Toshiba/Vivado/2019.2/xilinx_ibs
	#source compile.do 2>&1 | tee -a compile.log
	@echo --Compile Top-Level Done--

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
