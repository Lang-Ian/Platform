Ths project is compatible with Xilinx 2019.2 tools.

# Platform
Reference project for the following combination of boards:

  KRM-3Z7030        https://www.knowres.com/product/krm-3z7030/
  
  KRC3701           https://www.knowres.com/product/krc3701/
  
  HTG-FMC-x4-SFP    http://www.hitechglobal.com/FMCModules/FMC_4SFP+_Module.htm
  
  KR_LAN_A1

This is a project that I am using to improve my skills at building an embedded system based a Zynq SoC.  My aims are manifold.  Principal amongst them are the following:

1)  Linux
2)  Ethernet
3)  DMA
4)  Serial Tansceivers
5)  Linux Drivers
6)  Linux Interrupts

To build the project:

  git clone https://github.com/Lang-Ian/Platform.git
  
  cd Platform/HW/
  
  vivado -mode tcl -source Platform.tcl -tclargs --project_name TEST_PROJECT
  
  start_gui

Current status:

  Zynq runs
  
  Ethernet runs on KR_LAN_A1
  
  Aurora runs

In due course, I will be adding a Petalinux build, maybe some homemade drivers plus...whatever else I decide to experiment with.

Make another change to see how it looks in GitFiend.
