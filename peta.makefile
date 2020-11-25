SHELL = /bin/bash


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

$(BUILDDIR)/.build: $(BUILDDIR)/.import
	@echo "-- Building Petalinux --"
	cp -r $(CONFIGDIR)/system-user.dtsi $(BUILDDIR)/os/project-spec/meta-user/recipes-bsp/device-tree/files
	cd $(BUILDDIR)/os; \
	petalinux-build
	touch $@

.PHONY: rootfs
rootfs: $(BUILDDIR)/.import
	@echo "-- Configuring Root File System through the GUI --"
	cd $(BUILDDIR)/os; \
	petalinux-config -c rootfs

.PHONY: kernel
kernel: $(BUILDDIR)/.import
	@echo "-- Configuring Kernel through the GUI --"
	cd $(BUILDDIR)/os; \
	petalinux-config -c kernel

.PHONY: import
import: $(BUILDDIR)/os
	@echo "-- Importing .xsa file with GUI stage --"
	cd $(BUILDDIR)/os; \
	petalinux-config --get-hw-description=$(EXPORTDIR)
	touch $(BUILDDIR)/.import

$(BUILDDIR)/.import: $(BUILDDIR)/os
	@echo "-- Importing .xsa file in silent mode --"
	cd $(BUILDDIR)/os; \
	petalinux-config --silentconfig --get-hw-description=$(EXPORTDIR)
	touch $@

$(BUILDDIR)/os:
	@echo "-- Creating petalinux os --"
	mkdir -p $(BUILDDIR)
	cd $(BUILDDIR); \
	petalinux-create -t project -n os --template zynq
	cp -r $(CONFIGDIR)/config $(BUILDDIR)/os/project-spec/configs
	cp -r $(CONFIGDIR)/rootfs_config $(BUILDDIR)/os/project-spec/configs
	touch $@

.PHONY: clean
clean:
	@rm  -rf $(BUILDDIR)

.PHONY: help
help:
	@echo "make -f post_route_status.makefile {all|import|kernel|rootfs|copy|clean|help}"
