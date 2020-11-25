.PHONY: build
build:
	make -f build.makefile

.PHONY: peta
peta:
	make -f peta.makefile

.PHONY: simulate
simulate:
	make -f sim.makefile

.PHONY: wave
wave:
	make -f sim.makefile wave

.PHONY: copy
copy:
	make -f peta.makefile copy

.PHONY: help
help:
	@echo "make {build|peta|simulate|wave|copy|help}"
