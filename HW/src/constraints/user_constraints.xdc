# GTE Clock
create_clock -period 6.400 -name X1_MGT_CLK_1_P -waveform {0.000 3.200} [get_ports X1_MGT_CLK_1_P]

# RGMII
#create_clock -period 8.000 -name X2_1_110 -waveform {0.000 4.000} [get_ports X2_1_110]
set_property SLEW FAST [get_ports X2_1_107]
set_property SLEW FAST [get_ports X2_1_106]
set_property SLEW FAST [get_ports X2_1_104]
set_property SLEW FAST [get_ports X2_1_103]
set_property SLEW FAST [get_ports X2_1_105]
set_property SLEW FAST [get_ports X2_1_108]

# MDIO

# I2C

# False path constraints to async inputs coming directly to synchronizer
set_false_path -to [get_pins -of [get_cells -hier -filter { name =~  *idelayctrl_reset_gen/*reset_sync* }] -filter {REF_PIN_NAME ==PRE }]

# After I changed the top-level name, I had a timing violation here.  So I fixed it:
#set_false_path -from [ get_pins i_dgrm_wrapper/dgrm_i/processing_system7_0/inst/ENET1_MDIO_MDC ]
