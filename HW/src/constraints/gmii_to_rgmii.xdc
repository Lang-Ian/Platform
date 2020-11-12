
############################################################
# Clock Period Constraints                                 #
############################################################

create_clock -add -name clkin -period 5.000 [get_ports clkin]


#create_clock -period 8.000 -name rgmii_rxc -waveform {0.000 4.000} [get_ports X2_1_110]


set_property slew FAST [get_ports [list {X2_1_107} {X2_1_106} {X2_1_104} {X2_1_103} X2_1_105 X2_1_108]]


#-----------------------------------------------------------
# To Adjust GMII Rx Input Setup/Hold Timing                -
# These IDELAY Tap values are given for illustration       -
# prupose. Please modify as per design requirements        -
#-----------------------------------------------------------
#set_property IDELAY_VALUE  "16"   [get_cells -hier -filter {name =~ *gmii_to_rgmii_1_core/*delay_rgmii_rx_ctl          }]
#set_property IDELAY_VALUE  "16"   [get_cells -hier -filter {name =~ *gmii_to_rgmii_1_core/*delay_rgmii_rxd*            }]
#set_property IODELAY_GROUP "gpr1" [get_cells -hier -filter {name =~ *gmii_to_rgmii_1_core/*delay_rgmii_rx_ctl          }]
#set_property IODELAY_GROUP "gpr1" [get_cells -hier -filter {name =~ *gmii_to_rgmii_1_core/*delay_rgmii_rxd*            }]
#set_property IODELAY_GROUP "gpr1" [get_cells -hier -filter {name =~ *i_gmii_to_rgmii_1_idelayctrl}]
