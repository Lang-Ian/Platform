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
# change to $(BUILDDIR)/.package
all:  $(BUILDDIR)/.build

copy: $(BUILDDIR)/.package
	cd $(BUILDDIR)/os/images/linux; \
	cp BOOT.BIN /media/ian/BOOT; \
	cp image.ub /media/ian/BOOT; \
	cp system.dtb /media/ian/BOOT; \
	umount /media/ian/BOOT; \
	umount /media/ian/ROOT_FS; \

$(BUILDDIR)/.package: $(BUILDDIR)/.build
	cd $(BUILDDIR)/os/images/linux; \
	petalinux-package --boot --fsbl zynq_fsbl.elf --fpga system.bit --uboot --force
	touch $@

$(BUILDDIR)/.build: $(BUILDDIR)/.import
	@echo "-- Building Petalinux --"
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
	cp -r $(CONFIGDIR)/system-user.dtsi $(BUILDDIR)/os/project-spec/meta-user/recipes-bsp/device-tree/files

.PHONY: clean
clean:
	@rm  -rf $(BUILDDIR)

.PHONY: help
help:
	@echo "make -f post_route_status.makefile {import|kernel|rootfs|build|all|sdcopy|clean|help}"
