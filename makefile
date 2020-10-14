SHELL = /bin/bash

# I want to add a global interactive argument to this whole makefile that I can pass into the sub-stages.

help:
	@echo "	normal use: make export | import | build | package | copy | clean"


export:
	@echo --Exporting Block Diagram--
	vivado -mode tcl -notrace -source export.tcl -tclargs -top platform -technology xc7z030ffg676-1 -project in_memory
	$(shell touch $@)
	@echo --Export Block Diagram Done--


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
	umount /media/ian/ROOT_FS; \

clean:
	@rm -rf export
	@rm -rf sandbox
