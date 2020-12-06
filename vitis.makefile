SHELL = /bin/bash

# To do:

# Debug utility: make print-X prints value of X
print-%: ; @echo $* = $($*)

# The following constant can be overriden at the command line with -e CONSTANT=<whatever>
TOP = platform

mkfile_path  := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
mkfile_dir   := $(shell cd $(shell dirname $(mkfile_path)); pwd)
current_dir  := $(notdir $(mkfile_dir))
BUILDDIR     := $(abspath  $(mkfile_dir)/vitabox)

.PHONY: all
all:

.PHONY: vitis
vitis: $(BUILDDIR)
	cd $(BUILDDIR); \
	vitis

$(BUILDDIR):
	mkdir -p $(BUILDDIR)
	cd $(BUILDDIR)

.PHONY: clean
clean:
	@rm  -rf $(BUILDDIR)

.PHONY: help
help:
	@echo "make -f vitis.makefile {all|vitis|clean|help}"
