SHELL = /bin/bash

# To do:
# Install the TCF agent.
# Set up TCF agent so that it runs at power up.

# Debug utility: make print-X prints value of X
print-%: ; @echo $* = $($*)

# The following constant can be overriden at the command line with -e CONSTANT=<whatever>
#TOP = platform

# Don't touch these unless you understand them :)
#mkfile_path  := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
#mkfile_dir   := $(shell cd $(shell dirname $(mkfile_path)); pwd)
#current_dir  := $(notdir $(mkfile_dir))
#EXPORTDIR    := $(abspath  $(mkfile_dir)/buildbox)
#BUILDDIR     := $(abspath  $(mkfile_dir)/petabox)
#SOURCE       := $(abspath  $(EXPORTDIR)/$(TOP).xsa)
#CONFIGDIR    := $(abspath  $(mkfile_dir)/PX)

.PHONY: all
all:

.PHONY: clean
clean:

tcfagent:
	git clone git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git
	cd org.eclipse.tcf.agent/
	cd agent/
	cp -R machine/arm machine/armv6l
	make NO_SSL=1 NO_UUID=1

.PHONY: help
help:
	@echo "make -f post_route_status.makefile {all|tcfagent|clean|help}"
