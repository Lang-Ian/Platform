sim:
	make -f makefile.sim

build:
	make -f makefile.build

peta:
	make -f makefile.peta

.PHONY: help
help:
	@echo "make {-f makefile.sim | -f makefile.build | -f makefile.peta | help}"
