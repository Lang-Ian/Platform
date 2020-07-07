# Elektrobit Austria
# Ian.Lang@elektrobit.com
# TO Do
# Send journal and log files to /dev/nul
# Do a proper search for include directories.
# Put a makefile in the prbs directory and do a hierarchical compilation.
# Add PART = "xcku040-ffva1156-2-i"
# Add a checkpoint instead of having export4debug.
# Include FPGA build - constraints, configurations, synthesise, P&R, net-list...
# Parameterise everything that is fixed to the mta3g_decoder.
# Add a check before the move to delete the old library, it it is still there.
# Maybe make "make vivado" default to internal simulator as Questa can now be run externally.


SHELL = /bin/bash


.SUFFIXES:
.SUFFIXES: .v .sv .vhd


rwildcard=$(foreach d,$(wildcard $(1:=/*)),$(call rwildcard,$d,$2) $(filter $(subst *,%,$2),$d))


QUESTA=C:/questasim64_2019.1/win64
LIBRARY  = MTA3G_DECODER


axiincdirs = $(VIVADO_ROOT)/data/xilinx_vip/include
#axi      = $(wildcard $(VIVADO_ROOT)/data/xilinx_vip/hdl/*.sv) It would be better like this, but I can't get it to work.  Revisit.
#axi = \
#$(VIVADO_ROOT)/data/xilinx_vip/hdl/xil_common_vip_pkg.sv \
#$(VIVADO_ROOT)/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv \
#$(VIVADO_ROOT)/data/xilinx_vip/hdl/axi4stream_vip_if.sv \
#$(VIVADO_ROOT)/data/xilinx_vip/hdl/axi_vip_axi4pc.sv \
#$(VIVADO_ROOT)/data/xilinx_vip/hdl/axi_vip_pkg.sv \
#$(VIVADO_ROOT)/data/xilinx_vip/hdl/axi_vip_if.sv \
#$(VIVADO_ROOT)/data/xilinx_vip/hdl/clk_vip_if.sv \
#$(VIVADO_ROOT)/data/xilinx_vip/hdl/rst_vip_if.sv \


#incdirs  = $(dir $(headers) )                          # Fix the searching for include directory!!!
svheaders  := ./tb
vheaders   := ./tb
vfiles     := $(call rwildcard,.,*.v)
svfiles    := ./tb/prbs_pkg.sv $(call rwildcard,./tb,*.sv)
#$(call rwildcard,./in_memory.srcs/sources_1,*.sv)
vhdlfiles  := $(call rwildcard,.,*.vhd)


help:
	@echo "	normal use: make export | compile | sim | wave | netlist"
	@echo "	debugging:  make vivado | questa"


# Usage of this rule:  make print-<variable name>
# See https://blog.jgc.org/2015/04/the-one-line-you-should-add-to-every.html
print-%  : ; @echo $* = $($*)


./tb/sim/wave.do:
	$(shell touch $@)


# It would be good to pass the part number in here.
export:
	@echo "$--Exporting Block Diagram--"
	$(VIVADO_ROOT)\settings64.bat
	C:\Xilinx\Vivado\2018.2\bin\vivado -mode batch -notrace -source export.tcl -tclargs in_memory
	$(shell touch $@)
	@echo --Export Block Diagram Done--


compile: export
	@echo --Compiling Block Diagram--
	cd ./in_memory.srcs/sources_1/bd/mta3g_decoder_th_sim/questa; \
	mkdir ./questa_lib; \
	$(QUESTA)/vsim.exe -c -do ./compile.do -do ../../../../../exit.do
	$(shell touch $@)
	@echo --Compile Block Diagram Done--


map: compile
	@echo --Mapping Xilinx Libraries--
	cd ./in_memory.srcs/sources_1/bd/mta3g_decoder_th_sim/questa; \
	$(QUESTA)/vmap unisim C:/questasim64_2019.1/questa_simlib/unisim
	cd ./in_memory.srcs/sources_1/bd/mta3g_decoder_th_sim/questa; \
	$(QUESTA)/vmap unifast C:/questasim64_2019.1/questa_simlib/unifast
	cd ./in_memory.srcs/sources_1/bd/mta3g_decoder_th_sim/questa; \
	$(QUESTA)/vmap secureip C:/questasim64_2019.1/questa_simlib/secureip
	cd ./in_memory.srcs/sources_1/bd/mta3g_decoder_th_sim/questa; \
	$(QUESTA)/vmap unimacro C:/questasim64_2019.1/questa_simlib/unimacro
	cd ./in_memory.srcs/sources_1/bd/mta3g_decoder_th_sim/questa; \
	$(QUESTA)/vmap unisims_ver C:/questasim64_2019.1/questa_simlib/unisims_ver
	cd ./in_memory.srcs/sources_1/bd/mta3g_decoder_th_sim/questa; \
	$(QUESTA)/vmap unifast_ver C:/questasim64_2019.1/questa_simlib/unifast_ver
	cd ./in_memory.srcs/sources_1/bd/mta3g_decoder_th_sim/questa; \
	$(QUESTA)/vmap unimacro_ver C:/questasim64_2019.1/questa_simlib/unimacro_ver
	cd ./in_memory.srcs/sources_1/bd/mta3g_decoder_th_sim/questa; \
	$(QUESTA)/vmap $(LIBRARY)  questa_lib/msim/xil_defaultlib 
	$(shell touch $@)
	@echo --Map Xilinx Libraries Done--


move: map
	mv .\in_memory.srcs\sources_1\bd\mta3g_decoder_th_sim\questa\questa_lib .
	mv .\in_memory.srcs\sources_1\bd\mta3g_decoder_th_sim\questa\modelsim.ini .
	$(shell touch $@)
	

#axi: NO LONGER NEEDED
#	$(QUESTA)/vlog.exe -work $(LIBRARY) +incdir+$(axiincdirs) $(axi)
#	$(shell touch $@)


sv: $(svfiles) $(svheaders) move
	@echo --Compiling SystemVerilog Files--
	$(QUESTA)/vlog.exe -work $(LIBRARY) +incdir+$(svheaders) $(svfiles) -L xilinx_vip
	$(QUESTA)/vopt -64 +acc -l elaborate.log -L xilinx_vip -L xil_defaultlib -L xpm -L axis_infrastructure_v1_1_0 -L axis_protocol_checker_v1_2_3 -L axi4stream_vip_v1_1_3 -L axi_infrastructure_v1_1_0 -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L axi4stream_vip_v1_1_3 -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -work xil_defaultlib xil_defaultlib.mta3g_decoder_tb xil_defaultlib.glbl -o mta3g_decoder_tb_opt
	$(shell touch $@)
	@echo --Compile SystemVerilog Files Done--


v: $(vfiles) $(svheaders) move
	@echo --Compiling Verilog Files--
#	$(QUESTA)/vlog.exe -work $(LIBRARY) +incdir+$(vheaders) $(vfiles)
	$(shell touch $@)
	@echo --Compile Verilog Files Done--


vhdl: $(vhdlfiles) move
	@echo --Compiling VHDL Files--
#	$(QUESTA)/vcom.exe -work $(LIBRARY) $(vhdlfiles)
	$(shell touch $@)
	@echo --Compile VHDL Files Done--


sim:  ./tb/sim/wave.do sv v vhdl
	@echo --Running Simulation--
#	$(shell touch wave.do)  NOT CHECKED BUT BETTER THAN HAVING A RULE FOR IT.  ALSO novopt might cause problems...BEWARE!
#	$(QUESTA)/vsim.exe -c -do "vsim -novopt -voptargs=+acc $(LIBRARY).top; source wave.do; run -all"
	$(QUESTA)/vsim.exe -c -do "vsim -voptargs=+acc MTA3G_DECODER.mta3g_decoder_tb_opt; source ./tb/sim/wave.do;  run -all; "
	$(shell touch $@)
	@echo --Simulation Done--


wave: sim
	$(QUESTA)/vsim.exe -view vsim.wlf -do "source ./tb/sim/wave.do"


netlist:
	@echo --Not yet available--


.PHONY: all clean	
clean:
	@rm -rf modelsim.ini
	@rm -rf $(LIBRARY)
#	@rm -rf vsim.wlf
	@rm -rf export compile sim wave netlist v sv vhdl map move
	@rm -rf in_memory* questa_lib
	@rm  *.jou *.log


# To build hierarchically, call this.
all:  bench netlist
	@echo --$(LIBRARY) successfully built--
		
	
#----INTERACTIVE DEBUG BELOW THIS LINE----------------


# To check the project interactively, use this.
vivado:
	$(VIVADO_ROOT)\settings64.bat
	C:\Xilinx\Vivado\2018.2\bin\vivado -mode tcl   -notrace -source export.tcl -tclargs on_disk


questa: move ./tb/sim/wave.do
	$(QUESTA)/vsim.exe -modelsimini modelsim.ini


