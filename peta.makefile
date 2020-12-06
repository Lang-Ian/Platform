SHELL = /bin/bash

# To do:
# Add the git commands for cloning u-boot and linux.
# Add the unpacking of Ubuntu onto the SD Card.

# Debug utility: make print-X prints value of X
print-%: ; @echo $* = $($*)

# The following constant can be overriden at the command line with -e CONSTANT=<whatever>
TOP = platform

# Don't touch these unless you understand them :)
mkfile_path  := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
mkfile_dir   := $(shell cd $(shell dirname $(mkfile_path)); pwd)
current_dir  := $(notdir $(mkfile_dir))
EXPORTDIR    := $(abspath  $(mkfile_dir)/buildbox)
BUILDDIR     := $(abspath  $(mkfile_dir)/petabox)
SOURCE       := $(abspath  $(EXPORTDIR)/$(TOP).xsa)
CONFIGDIR    := $(abspath  $(mkfile_dir)/PX)

.PHONY: all
all:  $(BUILDDIR)/.package

.PHONY: copy
copy: $(BUILDDIR)/.package
	cp $(BUILDDIR)/os/images/linux/BOOT.BIN -r /media/ian/BOOT
	cp $(BUILDDIR)/os/images/linux/image.ub -r /media/ian/BOOT
	cp $(BUILDDIR)/os/images/linux/system.dtb -r /media/ian/BOOT
	umount /media/ian/BOOT; \
	umount /media/ian/ROOT_FS; \

$(BUILDDIR)/.package: $(BUILDDIR)/.build
	cd $(BUILDDIR)/os/images/linux; \
	petalinux-package --boot --fsbl zynq_fsbl.elf --fpga system.bit --uboot --force
	touch $@

.PHONY: export
export:  $(BUILDDIR)/.build
	@echo "-- Exporting for Vitis --"
	cd $(BUILDDIR)/os; \
	petalinux-build --sdk

$(BUILDDIR)/.build: $(BUILDDIR)/.import
	@echo "-- Building Petalinux --"
	cp -f $(CONFIGDIR)/system-user.dtsi $(BUILDDIR)/os/project-spec/meta-user/recipes-bsp/device-tree/files
	cd $(BUILDDIR)/os; \
	petalinux-build
	touch $@

.PHONY: rootfs
rootfs: $(BUILDDIR)/.import
	@echo "-- Configuring Root File System through the GUI --"
	cd $(BUILDDIR)/os; \
	petalinux-config -c rootfs
	cp -f $(BUILDDIR)/os/project-spec/configs/rootfs_config $(CONFIGDIR)/rootfs_config

.PHONY: kernel
kernel: $(BUILDDIR)/.import
	@echo "-- Configuring Kernel through the GUI --"
	cd $(BUILDDIR)/os; \
	petalinux-config -c kernel
	cp -f $(BUILDDIR)/os/build/tmp/work/plnx_zynq7-xilinx-linux-gnueabi/linux-xlnx/4.19-xilinx-v2019.2+git999-r0/linux-xlnx-4.19-xilinx-v2019.2+git999/.config $(CONFIGDIR)/.config

.PHONY: import
import: $(BUILDDIR)/os
	@echo "-- Importing .xsa file with GUI stage --"
	cd $(BUILDDIR)/os; \
	petalinux-config --get-hw-description=$(EXPORTDIR)
	cp -f $(BUILDDIR)/os/project-spec/configs/config $(CONFIGDIR)/config
	touch $(BUILDDIR)/.import

$(BUILDDIR)/.import: $(BUILDDIR)/os
	@echo "-- Importing .xsa file in silent mode --"
	cd $(BUILDDIR)/os; \
	petalinux-config --silentconfig --get-hw-description=$(EXPORTDIR)
	cp -f $(BUILDDIR)/os/project-spec/configs/config $(CONFIGDIR)/config
	touch $@

$(BUILDDIR)/os:
	@echo "-- Creating petalinux os --"
	mkdir -p $(BUILDDIR)
	cd $(BUILDDIR); \
	petalinux-create -t project -n os --template zynq
	cp -f $(CONFIGDIR)/config $(BUILDDIR)/os/project-spec/configs/config
	cp -f $(CONFIGDIR)/rootfs_config $(BUILDDIR)/os/project-spec/configs/rootfs_config
	mkdir -p $(BUILDDIR)/os/build/tmp/work/plnx_zynq7-xilinx-linux-gnueabi/linux-xlnx/4.19-xilinx-v2019.2+git999-r0/linux-xlnx-4.19-xilinx-v2019.2+git999
	cp -f $(CONFIGDIR)/.config $(BUILDDIR)/os/build/tmp/work/plnx_zynq7-xilinx-linux-gnueabi/linux-xlnx/4.19-xilinx-v2019.2+git999-r0/linux-xlnx-4.19-xilinx-v2019.2+git999/.config

.PHONY: clean
clean:
	@rm  -rf $(BUILDDIR)

.PHONY: help
help:
	@echo "make -f peta.makefile {all|import|export|kernel|rootfs|copy|clean|help}"
