# GTE Clock
create_clock -period 6.400 -name X1_MGT_CLK_1_P -waveform {0.000 3.200} [get_ports X1_MGT_CLK_1_P]


# I2C

# False path constraints to async inputs coming directly to synchronizer
set_false_path -to [get_pins -of [get_cells -hier -filter { name =~  *idelayctrl_reset_gen/*reset_sync* }] -filter {REF_PIN_NAME ==PRE }]

# After I changed the top-level name, I had a timing violation here.  So I fixed it:
#set_false_path -from [ get_pins i_dgrm_wrapper/dgrm_i/processing_system7_0/inst/ENET1_MDIO_MDC ]

#set_false_path -from [get_pins aurora_0/slave_2/inst/aurora_64b66b_6_wrapper_i/u_cdc_gt_cplllock_i/s_level_out_d5_reg/C] -to [get_pins {i_dgrm_wrapper/dgrm_i/gp/general_0/U0/aurora_status_retimed_reg[1][6][4]/D}]
#set_false_path -from [get_pins aurora_0/slave_1/inst/aurora_64b66b_5_wrapper_i/u_cdc_gt_cplllock_i/s_level_out_d5_reg/C] -to [get_pins {i_dgrm_wrapper/dgrm_i/gp/general_0/U0/aurora_status_retimed_reg[1][5][4]/D}]
#set_false_path -from [get_pins aurora_0/slave_3/inst/aurora_64b66b_7_wrapper_i/u_cdc_gt_cplllock_i/s_level_out_d5_reg/C] -to [get_pins {i_dgrm_wrapper/dgrm_i/gp/general_0/U0/aurora_status_retimed_reg[1][7][4]/D}]
#set_false_path -from [get_pins aurora_0/master_0/inst/aurora_64b66b_4_core_i/aurora_64b66b_4_wrapper_i/txresetfsm_i/MMCM_RESET_reg/C] -to [get_pins {i_dgrm_wrapper/dgrm_i/gp/general_0/U0/aurora_status_retimed_reg[1][4][4]/D}]

#set_false_path -from [get_pins aurora_0/master_0/inst/aurora_64b66b_4_core_i/aurora_64b66b_4_wrapper_i/u_cdc_gt_cplllock_i/s_level_out_d5_reg/C] -to [get_pins {i_dgrm_wrapper/dgrm_i/gp/general_0/U0/aurora_status_retimed_reg[1][4][4]/D}]
#set_false_path -from [get_pins aurora_0/slave_3/inst/aurora_64b66b_7_wrapper_i/txresetfsm_i/MMCM_RESET_reg/C] -to [get_pins {i_dgrm_wrapper/dgrm_i/gp/general_0/U0/aurora_status_retimed_reg[1][7][4]/D}]
#set_false_path -from [get_pins aurora_0/slave_2/inst/aurora_64b66b_6_wrapper_i/txresetfsm_i/MMCM_RESET_reg/C] -to [get_pins {i_dgrm_wrapper/dgrm_i/gp/general_0/U0/aurora_status_retimed_reg[1][6][4]/D}]



set_false_path -from [get_clocks -of_objects [get_pins aurora_0/generate_69M44/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks clk_fpga_2]

create_clock -period 6.400 -name X1_2_110 -waveform {0.000 3.200} [get_ports X1_2_110]

set_output_delay -clock [get_clocks dgrm_gmii2rgmii_1_0_rgmii_tx_clk] -max -1.000 [get_ports {X2_1_107, X2_1_106, X2_1_104, X2_1_103, X2_1_108}]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/U0/i_gmii_to_rgmii_block/dgrm_gmii2rgmii_1_0_core/i_gmii_to_rgmii/i_gmii_to_rgmii/rgmii_rxc_0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_rxd[0]} {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_rxd[1]} {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_rxd[2]} {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_rxd[3]} {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_rxd[4]} {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_rxd[5]} {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_rxd[6]} {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_rxd[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_rx_er]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_rx_dv]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/U0/i_gmii_to_rgmii_block/gmii_tx_clk]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 8 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_txd[0]} {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_txd[1]} {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_txd[2]} {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_txd[3]} {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_txd[4]} {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_txd[5]} {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_txd[6]} {i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_txd[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 1 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list i_dgrm_wrapper/dgrm_i/ethernet/gmii2rgmii_1/gmii_tx_er]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_1_gmii_tx_clk]
