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
all:  $(BUILDDIR)/.sysroot

.PHONY: copy
copy: $(BUILDDIR)/.package
	cp $(BUILDDIR)/os/images/linux/BOOT.BIN -r /media/ian/BOOT
	cp $(BUILDDIR)/os/images/linux/image.ub -r /media/ian/BOOT
	cp $(BUILDDIR)/os/images/linux/system.dtb -r /media/ian/BOOT
	umount /media/ian/BOOT; \
	umount /media/ian/ROOT_FS; \

# Test this change before checking in!!!
# It comes from here:  https://forums.xilinx.com/t5/Embedded-Linux/Where-is-the-quot-linux-sysroot-path-quot/td-p/874525
# It says that "This will generate sysroots in <plnx_proj>/images/linux/sdk/sysroots"
# which is probably worth leaving here permanently, since it is needed for setting up Vitis.
# I'm wondering if file #include <linux/gpio/driver.h> will become visible if I do this.
# See time 32:48 of https://www.youtube.com/watch?v=lQRCDl0tFiQ&t=2200s.
#
#Install defaults
#  $ petalinux-package --sysroot
#  It will install <PROJECT>/images/linux/sdk.sh to <PROJECT>/images/linux/sdk

$(BUILDDIR)/.sysroot: $(BUILDDIR)/.export
	cd $(BUILDDIR)/os; \
	petalinux-package --sysroot
	touch $@

.PHONY: export
export:  $(BUILDDIR)/.package
	@echo "-- Generating sdk for Vitis --"
	cd $(BUILDDIR)/os; \
	petalinux-build --sdk
	$(BUILDDIR)/.export

$(BUILDDIR)/.export:  $(BUILDDIR)/.package
	@echo "-- Generating sdk for Vitis --"
	cd $(BUILDDIR)/os; \
	petalinux-build --sdk
	touch $@

$(BUILDDIR)/.package: $(BUILDDIR)/.build
	cd $(BUILDDIR)/os/images/linux; \
	petalinux-package --boot --fsbl zynq_fsbl.elf --fpga system.bit --uboot --force
	touch $@

$(BUILDDIR)/.build: $(BUILDDIR)/.import
	@echo "-- Building Petalinux --"
	ln -f $(CONFIGDIR)/system-user.dtsi $(BUILDDIR)/os/project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi
	cd $(BUILDDIR)/os; \
	petalinux-build
	touch $@

.PHONY: config
config: $(BUILDDIR)/.import
	@echo "-- Configuring Petalinux through the GUI --"
	cd $(BUILDDIR)/os; \
	petalinux-config
	cp -f $(BUILDDIR)/os/project-spec/configs/config $(CONFIGDIR)/config

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

# I haven't tested this yet.
.PHONY: ubuntu
ubuntu: $(BUILDDIR)/clones
	cd $(BUILDDIR)/clones; \
	sudo tar xfvp ./*-*-*-armhf-*/armhf-rootfs-*.tar -C /media/ian/ROOT_FS ; \
  sudo chown root:root /media/ian/ROOT_FS; \
  sudo chmod 755 /media/ian/ROOT_FS
	# see https://onedrive.live.com/redir?resid=41F8604A6AF2BA!208661&page=Edit&wd=target(My%201st%20Good%20Project.one%7C819e5301-889f-499b-8794-d821d327db7d/Installing%20Ubuntu%20on%20Xilinx%20ZYNQ-7000%20AP%20SoC%20Using%20%7C93621aeb-f818-49c9-8118-51d4cea3116e/)

.PHONY: clone
clone: $(BUILDDIR)
	rm -rf    $(BUILDDIR)/clones
	mkdir -p $(BUILDDIR)/clones
	cd $(BUILDDIR)/clones; \
	git clone https://github.com/Xilinx/u-boot-xlnx.git; \
	git clone https://github.com/Xilinx/device-tree-xlnx.git; \
	git clone --branch xlnx_rebase_v4.19 https://github.com/Xilinx/linux-xlnx.git; \
	wget -c https://rcn-ee.com/rootfs/eewiki/minfs/ubuntu-16.04.2-minimal-armhf-2017-06-18.tar.xz; \
	tar xf ubuntu-16.04.2-minimal-armhf-2017-06-18.tar.xz;

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

.PHONY: clean
clean:
	@rm  -rf $(BUILDDIR)

.PHONY: help
help:
	@echo "make -f peta.makefile {all|import|export|kernel|rootfs|clone|ubuntu|copy|clean|help}"
