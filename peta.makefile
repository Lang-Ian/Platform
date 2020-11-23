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

.PHONY: all
# change to $(BUILDDIR)/.package
all:  $(BUILDDIR)/.import

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
	cd $(BUILDDIR)/os; \
	petalinux-build
	touch $@

$(BUILDDIR)/.import: $(BUILDDIR)/.create
	@echo "-- Importing Vivado zip file --"
	cd $(BUILDDIR)/os; \
	petalinux-config --silentconfig --get-hw-description=$(EXPORTDIR)
	touch $@

$(BUILDDIR)/.create:
	@echo "-- Creating petalinux os --"
	mkdir -p $(BUILDDIR)
	cd $(BUILDDIR); \
	petalinux-create -t project -n os --template zynq
	touch $@

.PHONY: clean
clean:
	@rm  -rf $(BUILDDIR)

.PHONY: help
help:
	@echo "make -f post_route_status.makefile {import|build|package|copy|clean|help}"
