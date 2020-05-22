# These constraints were taken from PG160.  Not all were relevant, but many were.
# Vivado Design SuiteThese constraints should be placed in an XDC file at the top level of the design.
# The example of the constraint text shown in the following paragraphs is based on the port names of the GMII to RGMII core.
# If these ports are mapped to FPGA pin names that are different, the FPGA pin names should be submitted for the port names in the following example.



# Clock Period Constraints
create_clock -period 8.000 -name rgmii_rxc -add [get_ports X2_1_110]


#False path constraints to async inputs coming directly to synchronizer
set_false_path -to [get_pins -hier -filter {name =~ *idelayctrl_reset_gen/*reset_sync*/PRE }]
set_false_path -to [get_pins -of [get_cells -hier -filter { name =~ *i_MANAGEMENT/SYNC_*/data_sync* }] -filter { name =~ *D }]
set_false_path -to [get_pins -hier -filter {name =~ *reset_sync*/PRE }]


#False path constraints from Control Register outputs
set_false_path -from [get_pins -hier -filter {name =~ *i_MANAGEMENT/DUPLEX_MODE_REG*/C }]
set_false_path -from [get_pins -hier -filter {name =~ *i_MANAGEMENT/SPEED_SELECTION_REG*/C }]
set_false_path -to [get_pins -hier -filter {name =~ *reset_sync*/PRE }]


# constraint valid if parameter C_EXTERNAL_CLOCK = 0
set_case_analysis 0 [get_pins -hier -filter {name =~ *i_bufgmux_gmii_clk/CE0}]
set_case_analysis 0 [get_pins -hier -filter {name =~ *i_bufgmux_gmii_clk/S0}]
set_case_analysis 1 [get_pins -hier -filter {name =~ *i_bufgmux_gmii_clk/CE1}]
set_case_analysis 1 [get_pins -hier -filter {name =~ *i_bufgmux_gmii_clk/S1}]


# I'm going to remove this consraint to see if I can get rid of the following message when I try to build he FPGA with a MIG in it!
# [DRC PLIDC-1] IDELAYCTRL missing from group with assigned IODELAYs: IODELAY cells have been found to be associated with IODELAY_GROUP 'gpr1', but there is no IDELAYCTRL associated with this IODELAY_GROUP.
# Note also the following answer record (https://forums.xilinx.com/t5/Virtex-Family-FPGAs-Archived/idelayctrl-with-iodelay-group-example/td-p/320793):
# Re: idelayctrl with iodelay_group example
# The IODELAY_GROUP is to associate a specific IODELAYCTRL with a bunch of IODELAYs. This is only necessary when there is some reason for the IODELAYCTRL for one bunch of IODELAYs to be different from others. If your goal is to have all IODELAYCTRLs
#   - clocked by the same clock (at 200MHz)
#   - reset by the same reset signal
#   - have only a single combined ready signal
# then you don't need to specify multiple IODELAY_GROUPs. Simply instantiate one IODELAYCTRL (with no IODELAY_GROUP) and do not set the IODELAY_GROUP of the IODELAYs, and the tool will automatically replicate the one (and only one) IODELAYCTRL into the three required banks.
# If you did want a different group for each of the three banks then you would
#   - instantiate three IODELAYCTRLs each with a different IODELAY_GROUP
#   - for each of the three IODELAYs in a particular bank, us the same IODELAY_GROUP as one of the IODELAYCTRLs
#     - the three in the same bank must use the same IODELAY_GROUP
# But again - this isn't necessary most of the time... Just instantiate one IODELAYCTRL with no IODELAY_GROUP.
# Avrum
#To Adjust GMII Tx Input Setup/Hold Timing
# set_property IDELAY_VALUE 16 [get_cells -hier -filter {name =~ *delay_rgmii_rxd*}]
# set_property IODELAY_GROUP gpr1 [get_cells -hier -filter {name =~ *delay_rgmii_rxd*}]


# Use these constraints to modify output delay on RGMII signals if 2ns delay is added by external PHY
set_output_delay -clock [get_clocks dgrm_gmii2rgmii_1_0_rgmii_tx_clk] -max -1.0 [get_ports {X2_1_107, X2_1_106, X2_1_104, X2_1_103, X2_1_108}]
set_output_delay -clock [get_clocks dgrm_gmii2rgmii_1_0_rgmii_tx_clk] -min -2.6 [get_ports {X2_1_107, X2_1_106, X2_1_104, X2_1_103, X2_1_108}] -add_delay
set_output_delay -clock [get_clocks dgrm_gmii2rgmii_1_0_rgmii_tx_clk] -clock_fall -max -1.0 [get_ports {X2_1_107, X2_1_106, X2_1_104, X2_1_103, X2_1_108}]
set_output_delay -clock [get_clocks dgrm_gmii2rgmii_1_0_rgmii_tx_clk] -clock_fall -min -2.6 [get_ports {X2_1_107, X2_1_106, X2_1_104, X2_1_103, X2_1_108}]




# From here:  http://ethernetfmc.com/rgmii-interface-timing-considerations/, I have chosen to do:
# TX clock skew must be DISABLED in the PHY
# RX clock skew must be ENABLED in the PHY

# If the option is selected to provide 2 ns skew to RGMII TXC in devices supporting HPIO banks, these constraints can be added to fine tune the delay:
# To adjust RGMII TXC delay when 2 ns skew option is selected

# Use these constraints to modify input delay on RGMII signals

# Use these constraints to modify output delay on RGMII signals if 2ns delay is added by the core

#The MMCM can be used to generate GMII clocks when C_EXTERNAL_CLOCK is set to 0.
#For more information, see Figure 3-5.
#The MMCM settings are based on the CLKIN1 pin of the MMCM, which has the frequency of 200 MHz for Zynq-7000 and 3745 MHz for Zynq Ultrascale+ MPSoC.
#If any other frequencies are used, update using the following constraints. Use the following example for Zynq Ultrascale+ MPSoC.
#set_property DIVCLK_DIVIDE {1} [get_cells -hier -regexp -nocase {.*gmii.*mmcm.*}]
#set_property CLKIN1_PERIOD {2.667} [get_cells -hier -regexp -nocase {.*gmii.*mmcm.*}]
#set_property CLKFBOUT_MULT_F {8.000} [get_cells -hier -regexp -nocase {.*gmii.*mmcm.*}]
#set_property CLKOUT1_DIVIDE {40} [get_cells -hier -regexp -nocase {.*gmii.*mmcm.*}]
#set_property CLKOUT2_DIVIDE {40} [get_cells -hier -regexp -nocase {.*gmii.*mmcm.*}]

