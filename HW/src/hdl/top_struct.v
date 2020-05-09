//
// Module aurora4.top.struct
//
// Created:
//          by - iala270035.UNKNOWN (ATL00049)
//          at - 18:06:42 12.04.2020
//
// Generated by Mentor Graphics' HDL Designer(TM) 2020.1 Built on 20 Jan 2020 at 19:37:36
//

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 01/23/2019 06:51:06 PM
// Design Name:
// Module Name: top
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:  https://www.xilinx.com/support/packagefiles/z7packages/xc7z030ffg676pkg.txt
//
//////////////////////////////////////////////////////////////////////////////////


//`include "krc3600_pkg.svh"
//import krc3600_pkg::*;
module top(
   // Port Declarations
   // KRM3Z730 dedicated LEDs
   output  wire    [3:0]   LED,
   // I/O Groups
   inout   wire            X1_1_311,
   // I/O Groups
   inout   wire            X1_1_310,
   // I/O Groups
   inout   wire            X1_1_309,
   // I/O Groups
   inout   wire            X1_1_308,
   // I/O Groups
   inout   wire            X1_1_307,
   // I/O Groups
   inout   wire            X1_1_306,
   // I/O Groups
   inout   wire            X1_1_305,
   // I/O Groups
   inout   wire            X1_1_304,
   // I/O Groups
   inout   wire            X1_1_303,
   // I/O Groups
   inout   wire            X1_1_302,
   // I/O Groups
   inout   wire            X1_1_301,
   // I/O Groups
   inout   wire            X1_1_300,
   inout   wire            X1_1_211,
   inout   wire            X1_1_210,
   inout   wire            X1_1_209,
   inout   wire            X1_1_208,
   inout   wire            X1_1_207,
   inout   wire            X1_1_206,
   inout   wire            X1_1_205,
   inout   wire            X1_1_204,
   inout   wire            X1_1_203,
   inout   wire            X1_1_202,
   inout   wire            X1_1_201,
   inout   wire            X1_1_200,
   inout   wire            X1_1_111,
   inout   wire            X1_1_110,
   inout   wire            X1_1_109,
   inout   wire            X1_1_108,
   inout   wire            X1_1_107,
   inout   wire            X1_1_106,
   inout   wire            X1_1_105,
   inout   wire            X1_1_104,
   inout   wire            X1_1_103,
   inout   wire            X1_1_102,
   inout   wire            X1_1_101,
   inout   wire            X1_1_100,
   inout   wire            X1_1_011,
   inout   wire            X1_1_010,
   inout   wire            X1_1_009,
   inout   wire            X1_1_008,
   inout   wire            X1_1_007,
   inout   wire            X1_1_006,
   inout   wire            X1_1_005,
   inout   wire            X1_1_004,
   inout   wire            X1_1_003,
   inout   wire            X1_1_002,
   inout   wire            X1_1_001,
   inout   wire            X1_1_000,
   inout   wire            X1_2_311,
   inout   wire            X1_2_310,
   inout   wire            X1_2_309,
   inout   wire            X1_2_308,
   inout   wire            X1_2_307,
   inout   wire            X1_2_306,
   inout   wire            X1_2_305,
   inout   wire            X1_2_304,
   inout   wire            X1_2_303,
   inout   wire            X1_2_302,
   inout   wire            X1_2_301,
   inout   wire            X1_2_300,
   inout   wire            X1_2_211,
   inout   wire            X1_2_210,
   inout   wire            X1_2_209,
   inout   wire            X1_2_208,
   inout   wire            X1_2_207,
   inout   wire            X1_2_206,
   inout   wire            X1_2_205,
   inout   wire            X1_2_204,
   inout   wire            X1_2_203,
   inout   wire            X1_2_202,
   inout   wire            X1_2_201,
   inout   wire            X1_2_200,
   inout   wire            X1_2_109,
   inout   wire            X1_2_108,
   inout   wire            X1_2_107,
   inout   wire            X1_2_106,
   inout   wire            X1_2_105,
   inout   wire            X1_2_104,
   inout   wire            X1_2_103,
   inout   wire            X1_2_102,
   inout   wire            X1_2_101,
   inout   wire            X1_2_100,
   inout   wire            X1_2_011,
   inout   wire            X1_2_010,
   inout   wire            X1_2_009,
   inout   wire            X1_2_008,
   inout   wire            X1_2_007,
   inout   wire            X1_2_006,
   inout   wire            X1_2_005,
   inout   wire            X1_2_004,
   inout   wire            X1_2_003,
   inout   wire            X1_2_002,
   inout   wire            X1_2_001,
   inout   wire            X1_2_000,
   inout   wire            X2_1_311,
   inout   wire            X2_1_310,
   inout   wire            X2_1_309,
   inout   wire            X2_1_308,
   inout   wire            X2_1_307,
   inout   wire            X2_1_306,
   inout   wire            X2_1_305,
   inout   wire            X2_1_304,
   inout   wire            X2_1_303,
   inout   wire            X2_1_302,
   inout   wire            X2_1_301,
   inout   wire            X2_1_300,
   inout   wire            X2_1_211,
   inout   wire            X2_1_210,
   inout   wire            X2_1_209,
   inout   wire            X2_1_208,
   inout   wire            X2_1_207,
   inout   wire            X2_1_206,
   inout   wire            X2_1_205,
   inout   wire            X2_1_204,
   inout   wire            X2_1_203,
   inout   wire            X2_1_202,
   inout   wire            X2_1_201,
   inout   wire            X2_1_200,
   inout   wire            X2_1_111,
   inout   wire            X2_1_110,
   inout   wire            X2_1_109,
   inout   wire            X2_1_108,
   inout   wire            X2_1_107,
   inout   wire            X2_1_106,
   inout   wire            X2_1_105,
   inout   wire            X2_1_104,
   inout   wire            X2_1_103,
   inout   wire            X2_1_102,
   inout   wire            X2_1_101,
   inout   wire            X2_1_100,
   inout   wire            X2_1_011,
   inout   wire            X2_1_010,
   inout   wire            X2_1_009,
   inout   wire            X2_1_008,
   inout   wire            X2_1_007,
   inout   wire            X2_1_006,
   inout   wire            X2_1_005,
   inout   wire            X2_1_004,
   inout   wire            X2_1_003,
   inout   wire            X2_1_002,
   inout   wire            X2_1_001,
   inout   wire            X2_1_000,
   inout   wire            X2_2_311,
   inout   wire            X2_2_310,
   inout   wire            X2_2_309,
   inout   wire            X2_2_308,
   inout   wire            X2_2_307,
   inout   wire            X2_2_306,
   inout   wire            X2_2_305,
   inout   wire            X2_2_304,
   inout   wire            X2_2_303,
   inout   wire            X2_2_302,
   inout   wire            X2_2_301,
   inout   wire            X2_2_300,
   inout   wire            X2_2_211,
   inout   wire            X2_2_210,
   inout   wire            X2_2_209,
   inout   wire            X2_2_208,
   inout   wire            X2_2_207,
   inout   wire            X2_2_206,
   inout   wire            X2_2_205,
   inout   wire            X2_2_204,
   inout   wire            X2_2_203,
   inout   wire            X2_2_202,
   inout   wire            X2_2_201,
   inout   wire            X2_2_200,
   inout   wire            X2_2_111,
   inout   wire            X2_2_110,
   inout   wire            X2_2_109,
   inout   wire            X2_2_108,
   inout   wire            X2_2_107,
   inout   wire            X2_2_106,
   inout   wire            X2_2_105,
   inout   wire            X2_2_104,
   inout   wire            X2_2_103,
   inout   wire            X2_2_102,
   inout   wire            X2_2_101,
   inout   wire            X2_2_100,
   inout   wire            X2_2_011,
   inout   wire            X2_2_010,
   inout   wire            X2_2_009,
   inout   wire            X2_2_008,
   inout   wire            X2_2_007,
   inout   wire            X2_2_006,
   inout   wire            X2_2_005,
   inout   wire            X2_2_004,
   inout   wire            X2_2_003,
   inout   wire            X2_2_002,
   inout   wire            X2_2_001,
   inout   wire            X2_2_000,
   // Transceiver Connections
   //	inout wire t_mgtgroup1 X1_MGT1,
   inout   wire            X1_MGT_RX_04_P,
   // Transceiver Connections
   //	inout wire t_mgtgroup1 X1_MGT1,
   inout   wire            X1_MGT_RX_04_N,
   // Transceiver Connections
   //	inout wire t_mgtgroup1 X1_MGT1,
   inout   wire            X1_MGT_RX_05_P,
   // Transceiver Connections
   //	inout wire t_mgtgroup1 X1_MGT1,
   inout   wire            X1_MGT_RX_05_N,
   // Transceiver Connections
   //	inout wire t_mgtgroup1 X1_MGT1,
   inout   wire            X1_MGT_RX_06_P,
   // Transceiver Connections
   //	inout wire t_mgtgroup1 X1_MGT1,
   inout   wire            X1_MGT_RX_06_N,
   // Transceiver Connections
   //	inout wire t_mgtgroup1 X1_MGT1,
   inout   wire            X1_MGT_RX_07_P,
   // Transceiver Connections
   //	inout wire t_mgtgroup1 X1_MGT1,
   inout   wire            X1_MGT_RX_07_N,
   input   wire            X1_MGT_CLK_1_P,
   input   wire            X1_MGT_CLK_1_N,
   // PS DDR Connections
   inout   wire    [14:0]  DDR_addr,
   inout   wire    [2:0]   DDR_ba,
   inout   wire            DDR_cas_n,
   inout   wire            DDR_ck_n,
   inout   wire            DDR_ck_p,
   inout   wire            DDR_cke,
   inout   wire            DDR_cs_n,
   inout   wire    [3:0]   DDR_dm,
   inout   wire    [31:0]  DDR_dq,
   inout   wire    [3:0]   DDR_dqs_n,
   inout   wire    [3:0]   DDR_dqs_p,
   inout   wire            DDR_odt,
   inout   wire            DDR_ras_n,
   inout   wire            DDR_reset_n,
   inout   wire            DDR_we_n,
   // PS FIXED Connections
   inout   wire            FIXED_IO_ddr_vrn,
   inout   wire            FIXED_IO_ddr_vrp,
   inout   wire    [53:0]  FIXED_IO_mio,
   inout   wire            FIXED_IO_ps_clk,
   inout   wire            FIXED_IO_ps_porb,
   inout   wire            FIXED_IO_ps_srstb,
   /* pretty sure these are now junk!!!
       // Aurora
     // DONE input wire [0 : 1] rxp,
     // DONE input wire [0 : 1] rxn,
   // HANDLED  input wire refclk1_in,
     input wire user_clk,
     input wire sync_clk,
     input wire reset_pb,
     input wire power_down,
     input wire pma_init,
     input wire [2 : 0] loopback,
     // DONE output wire [0 : 1] txp,
     // DONE output wire [0 : 1] txn,
     output wire hard_err,
     output wire soft_err,
     output wire channel_up,
     output wire [0 : 1] lane_up,
     output wire tx_out_clk,
     input wire drp_clk_in,
     output wire gt_pll_lock,
     input wire [0 : 127] s_axi_tx_tdata,
     input wire [0 : 15] s_axi_tx_tkeep,
     input wire s_axi_tx_tlast,
     input wire s_axi_tx_tvalid,
     output wire s_axi_tx_tready,
     output wire [0 : 127] m_axi_rx_tdata,
     output wire [0 : 15] m_axi_rx_tkeep,
     output wire m_axi_rx_tlast,
     output wire m_axi_rx_tvalid,
     input wire mmcm_not_locked,
     input wire [31 : 0] s_axi_awaddr,
     input wire [31 : 0] s_axi_awaddr_lane1,
     output wire [1 : 0] s_axi_rresp,
     output wire [1 : 0] s_axi_rresp_lane1,
     output wire [1 : 0] s_axi_bresp,
     output wire [1 : 0] s_axi_bresp_lane1,
     input wire [3 : 0] s_axi_wstrb,
     input wire [3 : 0] s_axi_wstrb_lane1,
     input wire [31 : 0] s_axi_wdata,
     input wire [31 : 0] s_axi_wdata_lane1,
     input wire [31 : 0] s_axi_araddr,
     input wire [31 : 0] s_axi_araddr_lane1,
     output wire [31 : 0] s_axi_rdata,
     output wire [31 : 0] s_axi_rdata_lane1,
     input wire s_axi_bready,
     input wire s_axi_bready_lane1,
     input wire s_axi_awvalid,
     input wire s_axi_awvalid_lane1,
     output wire s_axi_awready,
     output wire s_axi_awready_lane1,
     input wire s_axi_wvalid,
     input wire s_axi_wvalid_lane1,
     output wire s_axi_wready,
     output wire s_axi_wready_lane1,
     output wire s_axi_bvalid,
     output wire s_axi_bvalid_lane1,
     input wire s_axi_arvalid,
     input wire s_axi_arvalid_lane1,
     output wire s_axi_arready,
     output wire s_axi_arready_lane1,
     output wire s_axi_rvalid,
     output wire s_axi_rvalid_lane1,
     input wire s_axi_rready,
     input wire s_axi_rready_lane1,
     // DONE input wire init_clk,
     output wire link_reset_out,
     input wire gt_qpllclk_quad1_in,
     input wire gt_qpllrefclk_quad1_in,
     input wire gt_rxcdrovrden_in,
     output wire sys_reset_out
   */
   input   wire            X1_2_110,
   input   wire            X1_2_111,
   inout   wire            X1_MGT_TX_06_N,
   inout   wire            X1_MGT_TX_07_N,
   inout   wire            X1_MGT_TX_05_N,
   inout   wire            X1_MGT_TX_06_P,
   inout   wire            X1_MGT_TX_04_N,
   inout   wire            X1_MGT_TX_07_P,
   inout   wire            X1_MGT_TX_05_P,
   inout   wire            X1_MGT_TX_04_P
);

/* junk also
      // Data connections from
      wire [7:0]M_AXIS_0_tdata;
      wire M_AXIS_0_tready;
      wire M_AXIS_0_tvalid;
      wire [7:0]S_AXIS_0_tdata;
      wire S_AXIS_0_tready;
      wire S_AXIS_0_tvalid;
*/


     // Clock & Rest from the PS into the PL
// Internal Declarations


// Local declarations
wire MDIO_PHY_0_io;

wire MDIO_PHY_0_mdc;

wire RGMII_0_rx_ctl;

wire RGMII_0_rxc;

wire RGMII_0_tx_ctl;

wire RGMII_0_txc;

wire locked_69M44_5;
// Channel 4 - put these into a generate statement.
wire [4:7] HARD_ERR;

wire [4:7] SOFT_ERR;

wire [0:7] DATA_ERR_COUNT_4;


// Internal signal declarations
wire  [3:0]  RGMII_0_rd;
wire  [3:0]  RGMII_0_td;
//    assign X2_1_109 = ~ X2_2_307; // reset                             GET RID


    // Connect the RGB LED Signals
wire  [6:0]  GPIO2_1_tri_o;
// LEDs on the 2nd Ethernet Card
wire  [8:0]  GPIO_0_tri_o;
wire  [7:0]  LED_0;
wire         CLK_SEL;
wire         aurora_pma_init;
wire         usb_reset;
wire         aurora_reset_pb;
wire         aurora_power_down;
wire  [2:0]  aurora_loopback;
wire  [7:4]  TXN;
wire  [7:4]  TXP;
wire  [7:4]  RXN;
wire  [7:4]  RXP;
wire         locked_69M44_4;
wire         LANE_4_UP;
wire         CHANNEL_4_UP;
wire  [27:0] Q_drp_clk_in;
wire         drp_clk_in;
wire         gt_rxcdrovrden_in;
wire  [31:0] s_axi_awaddr1;
wire         s_axi_awvalid1;
wire         s_axi_awready1;
wire  [31:0] s_axi_wdata1;
wire  [3:0]  s_axi_wstrb1;
wire         s_axi_wvalid1;
wire         s_axi_wready1;
wire         s_axi_bvalid1;
wire  [1:0]  s_axi_bresp1;
wire         s_axi_bready1;
wire  [31:0] s_axi_araddr1;
wire         s_axi_arvalid1;
wire         s_axi_arready1;
wire  [31:0] s_axi_rdata1;
wire         s_axi_rvalid1;
wire  [1:0]  s_axi_rresp1;
wire         s_axi_rready1;
wire  [31:0] s_axi_awaddr2;
wire         s_axi_awvalid2;
wire         s_axi_awready2;
wire  [31:0] s_axi_wdata2;
wire  [3:0]  s_axi_wstrb2;
wire         s_axi_wvalid2;
wire         s_axi_wready2;
wire         s_axi_bvalid2;
wire  [1:0]  s_axi_bresp2;
wire         s_axi_bready2;
wire  [31:0] s_axi_araddr2;
wire         s_axi_arvalid2;
wire         s_axi_arready2;
wire  [31:0] s_axi_rdata2;
wire         s_axi_rvalid2;
wire  [1:0]  s_axi_rresp2;
wire         s_axi_rready2;
wire  [31:0] s_axi_awaddr3;
wire         s_axi_awvalid3;
wire         s_axi_awready3;
wire  [31:0] s_axi_wdata3;
wire  [3:0]  s_axi_wstrb3;
wire         s_axi_wvalid3;
wire         s_axi_wready3;
wire         s_axi_bvalid3;
wire  [1:0]  s_axi_bresp3;
wire         s_axi_bready3;
wire  [31:0] s_axi_araddr3;
wire         s_axi_arvalid3;
wire         s_axi_arready3;
wire  [31:0] s_axi_rdata3;
wire         s_axi_rvalid3;
wire  [1:0]  s_axi_rresp3;
wire         s_axi_rready3;
wire  [31:0] s_axi_awaddr0;
wire         s_axi_awvalid0;
wire         s_axi_awready0;
wire  [31:0] s_axi_wdata0;
wire         s_axi_wvalid0;
wire  [3:0]  s_axi_wstrb0;
wire         s_axi_wready0;
wire  [31:0] s_axi_araddr0;
wire         s_axi_arvalid0;
wire         s_axi_arready0;
wire  [31:0] s_axi_rdata0;
wire  [1:0]  s_axi_rresp0;
wire         s_axi_rvalid0;
wire         s_axi_rready0;
wire  [1:0]  s_axi_bresp0;
wire         s_axi_bvalid0;
wire         s_axi_bready0;
wire         hard_err1;
wire  [0:0]  lane_up1;
wire         soft_err1;
wire         hard_err2;
wire         soft_err2;
wire  [0:0]  lane_up2;
wire         channel_up1;
wire         gt_pll_lock1;
wire         channel_up2;
wire         gt_pll_lock2;
wire         hard_err3;
wire         soft_err3;
wire         channel_up3;
wire  [0:0]  lane_up3;
wire         gt_pll_lock3;
wire         gt_pll_lock0;
wire         hard_err0;
wire         soft_err0;
wire  [0:0]  lane_up0;
wire         channel_up0;
wire         s_axi_tx_tready0;
wire  [0:63] s_axi_tx_tdata1;
wire         s_axi_tx_tvalid1;
wire         s_axi_tx_tready1;
wire  [0:63] s_axi_tx_tdata2;
wire         s_axi_tx_tvalid2;
wire         s_axi_tx_tready2;
wire  [0:63] s_axi_tx_tdata3;
wire         s_axi_tx_tvalid3;
wire         s_axi_tx_tready3;
wire  [0:63] s_axi_tx_tdata0;
wire         s_axi_tx_tvalid0;
wire         gt_refclk1;
wire         init_clk;
wire         user_clk;
wire [27:0] Q_user_clk;
wire [27:0] Q_init_clk;
wire [27:0] Q_gt_refclk1;
wire         m_axi_rx_tvalid0;
wire  [0:63] m_axi_rx_tdata0;
wire  [0:63] m_axi_rx_tdata1;
wire         m_axi_rx_tvalid1;
wire  [0:63] m_axi_rx_tdata2;
wire         m_axi_rx_tvalid2;
wire  [0:63] m_axi_rx_tdata3;
wire         m_axi_rx_tvalid3;
wire  [4:0] aurora_status_4_0;
wire  [4:0] aurora_status_5_0;
wire  [4:0] aurora_status_6_0;
wire  [4:0] aurora_status_7_0;
wire         sys_reset;
wire   [1:0] LED_control;


// Instances
//  Instances
//
aurora4 aurora_0(
   .drp_clk_in        (drp_clk_in),
   .gt_refclk1_n      (X1_MGT_CLK_1_N),
   .gt_refclk1_p      (X1_MGT_CLK_1_P),
   .gt_rxcdrovrden_in (gt_rxcdrovrden_in),
   .init_clk_n        (X1_2_111),
   .init_clk_p        (X1_2_110),
   .loopback          (aurora_loopback),
   .pma_init          (aurora_pma_init),
   .power_down        (aurora_power_down),
   .reset_pb          (aurora_reset_pb),
   .rxn               (RXN),
   .rxp               (RXP),
   .s_axi_araddr0     (s_axi_araddr0),
   .s_axi_araddr1     (s_axi_araddr1),
   .s_axi_araddr2     (s_axi_araddr2),
   .s_axi_araddr3     (s_axi_araddr3),
   .s_axi_arvalid0    (s_axi_arvalid0),
   .s_axi_arvalid1    (s_axi_arvalid1),
   .s_axi_arvalid2    (s_axi_arvalid2),
   .s_axi_arvalid3    (s_axi_arvalid3),
   .s_axi_awaddr0     (s_axi_awaddr0),
   .s_axi_awaddr1     (s_axi_awaddr1),
   .s_axi_awaddr2     (s_axi_awaddr2),
   .s_axi_awaddr3     (s_axi_awaddr3),
   .s_axi_awvalid0    (s_axi_awvalid0),
   .s_axi_awvalid1    (s_axi_awvalid1),
   .s_axi_awvalid2    (s_axi_awvalid2),
   .s_axi_awvalid3    (s_axi_awvalid3),
   .s_axi_bready0     (s_axi_bready0),
   .s_axi_bready1     (s_axi_bready1),
   .s_axi_bready2     (s_axi_bready2),
   .s_axi_bready3     (s_axi_bready3),
   .s_axi_rready0     (s_axi_rready0),
   .s_axi_rready1     (s_axi_rready1),
   .s_axi_rready2     (s_axi_rready2),
   .s_axi_rready3     (s_axi_rready3),
   .s_axi_tx_tdata0   (s_axi_tx_tdata0),
   .s_axi_tx_tdata1   (s_axi_tx_tdata1),
   .s_axi_tx_tdata2   (s_axi_tx_tdata2),
   .s_axi_tx_tdata3   (s_axi_tx_tdata3),
   .s_axi_tx_tvalid0  (s_axi_tx_tvalid0),
   .s_axi_tx_tvalid1  (s_axi_tx_tvalid1),
   .s_axi_tx_tvalid2  (s_axi_tx_tvalid2),
   .s_axi_tx_tvalid3  (s_axi_tx_tvalid3),
   .s_axi_wdata0      (s_axi_wdata0),
   .s_axi_wdata1      (s_axi_wdata1),
   .s_axi_wdata2      (s_axi_wdata2),
   .s_axi_wdata3      (s_axi_wdata3),
   .s_axi_wstrb0      (s_axi_wstrb0),
   .s_axi_wstrb1      (s_axi_wstrb1),
   .s_axi_wstrb2      (s_axi_wstrb2),
   .s_axi_wstrb3      (s_axi_wstrb3),
   .s_axi_wvalid0     (s_axi_wvalid0),
   .s_axi_wvalid1     (s_axi_wvalid1),
   .s_axi_wvalid2     (s_axi_wvalid2),
   .s_axi_wvalid3     (s_axi_wvalid3),
   .channel_up0       (channel_up0),
   .channel_up1       (channel_up1),
   .channel_up2       (channel_up2),
   .channel_up3       (channel_up3),
   .gt_pll_lock0      (gt_pll_lock0),
   .gt_pll_lock1      (gt_pll_lock1),
   .gt_pll_lock2      (gt_pll_lock2),
   .gt_pll_lock3      (gt_pll_lock3),
   .gt_refclk1        (gt_refclk1),
   .hard_err0         (hard_err0),
   .hard_err1         (hard_err1),
   .hard_err2         (hard_err2),
   .hard_err3         (hard_err3),
   .lane_up0          (lane_up0),
   .lane_up1          (lane_up1),
   .lane_up2          (lane_up2),
   .lane_up3          (lane_up3),
   .m_axi_rx_tdata0   (m_axi_rx_tdata0),
   .m_axi_rx_tdata1   (m_axi_rx_tdata1),
   .m_axi_rx_tdata2   (m_axi_rx_tdata2),
   .m_axi_rx_tdata3   (m_axi_rx_tdata3),
   .m_axi_rx_tvalid0  (m_axi_rx_tvalid0),
   .m_axi_rx_tvalid1  (m_axi_rx_tvalid1),
   .m_axi_rx_tvalid2  (m_axi_rx_tvalid2),
   .m_axi_rx_tvalid3  (m_axi_rx_tvalid3),
   .s_axi_arready0    (s_axi_arready0),
   .s_axi_arready1    (s_axi_arready1),
   .s_axi_arready2    (s_axi_arready2),
   .s_axi_arready3    (s_axi_arready3),
   .s_axi_awready0    (s_axi_awready0),
   .s_axi_awready1    (s_axi_awready1),
   .s_axi_awready2    (s_axi_awready2),
   .s_axi_awready3    (s_axi_awready3),
   .s_axi_bresp0      (s_axi_bresp0),
   .s_axi_bresp1      (s_axi_bresp1),
   .s_axi_bresp2      (s_axi_bresp2),
   .s_axi_bresp3      (s_axi_bresp3),
   .s_axi_bvalid0     (s_axi_bvalid0),
   .s_axi_bvalid1     (s_axi_bvalid1),
   .s_axi_bvalid2     (s_axi_bvalid2),
   .s_axi_bvalid3     (s_axi_bvalid3),
   .s_axi_rdata0      (s_axi_rdata0),
   .s_axi_rdata1      (s_axi_rdata1),
   .s_axi_rdata2      (s_axi_rdata2),
   .s_axi_rdata3      (s_axi_rdata3),
   .s_axi_rresp0      (s_axi_rresp0),
   .s_axi_rresp1      (s_axi_rresp1),
   .s_axi_rresp2      (s_axi_rresp2),
   .s_axi_rresp3      (s_axi_rresp3),
   .s_axi_rvalid0     (s_axi_rvalid0),
   .s_axi_rvalid1     (s_axi_rvalid1),
   .s_axi_rvalid2     (s_axi_rvalid2),
   .s_axi_rvalid3     (s_axi_rvalid3),
   .s_axi_tx_tready0  (s_axi_tx_tready0),
   .s_axi_tx_tready1  (s_axi_tx_tready1),
   .s_axi_tx_tready2  (s_axi_tx_tready2),
   .s_axi_tx_tready3  (s_axi_tx_tready3),
   .s_axi_wready0     (s_axi_wready0),
   .s_axi_wready1     (s_axi_wready1),
   .s_axi_wready2     (s_axi_wready2),
   .s_axi_wready3     (s_axi_wready3),
   .soft_err0         (soft_err0),
   .soft_err1         (soft_err1),
   .soft_err2         (soft_err2),
   .soft_err3         (soft_err3),
   .sys_reset         (sys_reset),
   .txn               (TXN),
   .txp               (TXP),
   .user_clk          (user_clk),
.init_clk ( init_clk )  // Added after exporting from HDS
);


dgrm_wrapper i_dgrm_wrapper(
   .DDR_addr                (DDR_addr),
   .DDR_ba                  (DDR_ba),
   .DDR_cas_n               (DDR_cas_n),
   .DDR_ck_n                (DDR_ck_n),
   .DDR_ck_p                (DDR_ck_p),
   .DDR_cke                 (DDR_cke),
   .DDR_cs_n                (DDR_cs_n),
   .DDR_dm                  (DDR_dm),
   .DDR_dq                  (DDR_dq),
   .DDR_dqs_n               (DDR_dqs_n),
   .DDR_dqs_p               (DDR_dqs_p),
   .DDR_odt                 (DDR_odt),
   .DDR_ras_n               (DDR_ras_n),
   .DDR_reset_n             (DDR_reset_n),
   .DDR_we_n                (DDR_we_n),
   .FCLK_CLK2_0             (FCLK_CLK2_0),
   .FCLK_CLK3_0             (drp_clk_in),
   .FIXED_IO_ddr_vrn        (FIXED_IO_ddr_vrn),
   .FIXED_IO_ddr_vrp        (FIXED_IO_ddr_vrp),
   .FIXED_IO_mio            (FIXED_IO_mio),
   .FIXED_IO_ps_clk         (FIXED_IO_ps_clk),
   .FIXED_IO_ps_porb        (FIXED_IO_ps_porb),
   .FIXED_IO_ps_srstb       (FIXED_IO_ps_srstb),
   .GPIO_0_tri_o           (GPIO_0_tri_o),
   .HiTech_Global_clk_sel_0 (CLK_SEL),
   .IIC_0_0_scl_io          (X1_2_006),
   .IIC_0_0_sda_io          (X1_2_007),
   .LED_0                   (LED_0),
   .M00_AXI_0_araddr        (s_axi_araddr0),
   .M00_AXI_0_arprot        (),
   .M00_AXI_0_arready       (s_axi_arready0),
   .M00_AXI_0_arvalid       (s_axi_arvalid0),
   .M00_AXI_0_awaddr        (s_axi_awaddr0),
   .M00_AXI_0_awprot        (),
   .M00_AXI_0_awready       (s_axi_awready0),
   .M00_AXI_0_awvalid       (s_axi_awvalid0),
   .M00_AXI_0_bready        (s_axi_bready0),
   .M00_AXI_0_bresp         (s_axi_bresp0),
   .M00_AXI_0_bvalid        (s_axi_bvalid0),
   .M00_AXI_0_rdata         (s_axi_rdata0),
   .M00_AXI_0_rready        (s_axi_rready0),
   .M00_AXI_0_rresp         (s_axi_rresp0),
   .M00_AXI_0_rvalid        (s_axi_rvalid0),
   .M00_AXI_0_wdata         (s_axi_wdata0),
   .M00_AXI_0_wready        (s_axi_wready0),
   .M00_AXI_0_wstrb         (s_axi_wstrb0),
   .M00_AXI_0_wvalid        (s_axi_wvalid0),
   .M01_AXI_0_araddr        (s_axi_araddr1),
   .M01_AXI_0_arprot        (),
   .M01_AXI_0_arready       (s_axi_arready1),
   .M01_AXI_0_arvalid       (s_axi_arvalid1),
   .M01_AXI_0_awaddr        (s_axi_awaddr1),
   .M01_AXI_0_awprot        (),
   .M01_AXI_0_awready       (s_axi_awready1),
   .M01_AXI_0_awvalid       (s_axi_awvalid1),
   .M01_AXI_0_bready        (s_axi_bready1),
   .M01_AXI_0_bresp         (s_axi_bresp1),
   .M01_AXI_0_bvalid        (s_axi_bvalid1),
   .M01_AXI_0_rdata         (s_axi_rdata1),
   .M01_AXI_0_rready        (s_axi_rready1),
   .M01_AXI_0_rresp         (s_axi_rresp1),
   .M01_AXI_0_rvalid        (s_axi_rvalid1),
   .M01_AXI_0_wdata         (s_axi_wdata1),
   .M01_AXI_0_wready        (s_axi_wready1),
   .M01_AXI_0_wstrb         (s_axi_wstrb1),
   .M01_AXI_0_wvalid        (s_axi_wvalid1),
   .M02_AXI_0_araddr        (s_axi_awaddr2),
   .M02_AXI_0_arprot        (),
   .M02_AXI_0_arready       (s_axi_arready2),
   .M02_AXI_0_arvalid       (s_axi_arvalid2),
   .M02_AXI_0_awaddr        (s_axi_araddr2),
   .M02_AXI_0_awprot        (),
   .M02_AXI_0_awready       (s_axi_awready2),
   .M02_AXI_0_awvalid       (s_axi_awvalid2),
   .M02_AXI_0_bready        (s_axi_bready2),
   .M02_AXI_0_bresp         (s_axi_bresp2),
   .M02_AXI_0_bvalid        (s_axi_bvalid2),
   .M02_AXI_0_rdata         (s_axi_rdata2),
   .M02_AXI_0_rready        (s_axi_rready2),
   .M02_AXI_0_rresp         (s_axi_rresp2),
   .M02_AXI_0_rvalid        (s_axi_rvalid2),
   .M02_AXI_0_wdata         (s_axi_wdata2),
   .M02_AXI_0_wready        (s_axi_wready2),
   .M02_AXI_0_wstrb         (s_axi_wstrb2),
   .M02_AXI_0_wvalid        (s_axi_wvalid2),
   .M03_AXI_0_araddr        (s_axi_araddr3),
   .M03_AXI_0_arprot        (),
   .M03_AXI_0_arready       (s_axi_arready3),
   .M03_AXI_0_arvalid       (s_axi_arvalid3),
   .M03_AXI_0_awaddr        (s_axi_awaddr3),
   .M03_AXI_0_awprot        (),
   .M03_AXI_0_awready       (s_axi_awready3),
   .M03_AXI_0_awvalid       (s_axi_awvalid3),
   .M03_AXI_0_bready        (s_axi_bready3),
   .M03_AXI_0_bresp         (s_axi_bresp3),
   .M03_AXI_0_bvalid        (s_axi_bvalid3),
   .M03_AXI_0_rdata         (s_axi_rdata3),
   .M03_AXI_0_rready        (s_axi_rready3),
   .M03_AXI_0_rresp         (s_axi_rresp3),
   .M03_AXI_0_rvalid        (s_axi_rvalid3),
   .M03_AXI_0_wdata         (s_axi_wdata3),
   .M03_AXI_0_wready        (s_axi_wready3),
   .M03_AXI_0_wstrb         (s_axi_wstrb3),
   .M03_AXI_0_wvalid        (s_axi_wvalid3),
   .MDIO_PHY_0_mdc          (X2_1_009),
   .MDIO_PHY_0_mdio_io      (X2_1_008),
   .M_AXIS_0_tdata          (s_axi_tx_tdata0),
   .M_AXIS_0_tready         (s_axi_tx_tready0),
   .M_AXIS_0_tvalid         (s_axi_tx_tvalid0),
   .M_AXIS_1_tdata          (s_axi_tx_tdata1),
   .M_AXIS_1_tready         (s_axi_tx_tready1),
   .M_AXIS_1_tvalid         (s_axi_tx_tvalid1),
   .M_AXIS_2_tdata          (s_axi_tx_tdata2),
   .M_AXIS_2_tready         (s_axi_tx_tready2),
   .M_AXIS_2_tvalid         (s_axi_tx_tvalid2),
   .M_AXIS_3_tdata          (s_axi_tx_tdata3),
   .M_AXIS_3_tready         (s_axi_tx_tready3),
   .M_AXIS_3_tvalid         (s_axi_tx_tvalid3),
   .RGMII_0_rd              (RGMII_0_rd),
   .RGMII_0_rx_ctl          (X2_1_200),
   .RGMII_0_rxc             (X2_1_110),
   .RGMII_0_td              (RGMII_0_td),
   .RGMII_0_tx_ctl          (X2_1_108),
   .RGMII_0_txc             (X2_1_105),
   .S_AXIS_0_tdata          (m_axi_rx_tdata0),
   .S_AXIS_0_tready         (),
   .S_AXIS_0_tvalid         (m_axi_rx_tvalid0),
   .S_AXIS_1_tdata          (m_axi_rx_tdata1),
   .S_AXIS_1_tready         (),
   .S_AXIS_1_tvalid         (m_axi_rx_tvalid1),
   .S_AXIS_2_tdata          (m_axi_rx_tdata2),
   .S_AXIS_2_tready         (),
   .S_AXIS_2_tvalid         (m_axi_rx_tvalid2),
   .S_AXIS_3_tdata          (m_axi_rx_tdata3),
   .S_AXIS_3_tready         (),
   .S_AXIS_3_tvalid         (m_axi_rx_tvalid3),
   .aurora_loopback_0       (aurora_loopback),
   .aurora_pma_init_0       (aurora_pma_init),
   .aurora_power_down_0     (aurora_power_down),
//   .aurora_reset_0        (),
   .aurora_reset_pb_0       (aurora_reset_pb),
   .aurora_status_4_0       (aurora_status_4_0),
   .aurora_status_5_0       (aurora_status_5_0),
   .aurora_status_6_0       (aurora_status_6_0),
   .aurora_status_7_0       (aurora_status_7_0),
//   .phy_reset_0             (),
//   .pll_reset_0             (),
   .GPIO2_1_tri_o           (GPIO2_1_tri_o),
   .sys_reset               (sys_reset),
   .usb_reset_0             (usb_reset),
   .user_clk                (user_clk),
   .LED_control_0           (LED_control)
);

flasher_wrapper i_flasher(
   .CLK_0 (drp_clk_in),
   .Q_0   (Q_drp_clk_in)
);

flasher_wrapper i_flasher1(
   .CLK_0 (user_clk),
   .Q_0   (Q_user_clk)
);

flasher_wrapper i_flasher2(
   .CLK_0 (init_clk),
   .Q_0   (Q_init_clk)
);

flasher_wrapper i_flasher3(
   .CLK_0 (gt_refclk1),
   .Q_0   (Q_gt_refclk1)
);

//  Instantiate the USB Hub Reset Module
//  This could actually be done from inside the PS I think.
//
krc3600_usb_hub_reset #(12,4095) i_hub_reset(
   .clk              (FCLK_CLK2_0),
   .areset           (usb_reset),
   .USB_HUB_RESET    (X2_2_307),
   .ethernet_reset_N (X2_1_109)
);

// HDL Embedded Text Block 1 eb1
// PHY signals on 2nd Ethernet Card
assign RGMII_0_td =   { X2_1_107, X2_1_106, X2_1_104, X2_1_103 };
assign    X2_1_102 = RGMII_0_rd[3];
assign    X2_1_101 = RGMII_0_rd[2];
assign    X2_1_011 = RGMII_0_rd[1];
assign    X2_1_010 = RGMII_0_rd[0];
assign X2_2_300 = GPIO2_1_tri_o[0];
assign X2_2_301 = GPIO2_1_tri_o[1];
assign X2_2_302 = GPIO2_1_tri_o[2];
assign X2_2_303 = GPIO2_1_tri_o[3];
assign X2_2_304 = GPIO2_1_tri_o[4];
assign X2_2_305 = GPIO2_1_tri_o[5];
assign X2_2_306 = GPIO2_1_tri_o[6];
assign X2_1_211 = GPIO_0_tri_o[8] ? GPIO_0_tri_o[7] : LED_0[7];  // Use bit 8 to switch in bits 7:0; otherwise get, by default, the GMII to RGMII status signals.
assign X2_1_210 = GPIO_0_tri_o[8] ? GPIO_0_tri_o[6] : LED_0[6];
assign X2_1_209 = GPIO_0_tri_o[8] ? GPIO_0_tri_o[5] : LED_0[5];
assign X2_1_208 = GPIO_0_tri_o[8] ? GPIO_0_tri_o[4] : LED_0[4];
assign X2_1_207 = GPIO_0_tri_o[8] ? GPIO_0_tri_o[3] : LED_0[3];
assign X2_1_206 = GPIO_0_tri_o[8] ? GPIO_0_tri_o[2] : LED_0[2];
assign X2_1_205 = GPIO_0_tri_o[8] ? GPIO_0_tri_o[1] : LED_0[1];
assign X2_1_204 = GPIO_0_tri_o[8] ? GPIO_0_tri_o[0] : LED_0[0];
assign X1_2_102 = CLK_SEL;

assign LED = ( LED_control == 2'b01 ) ? (
                                        {Q_gt_refclk1[26], Q_init_clk[26], Q_user_clk[26], Q_drp_clk_in[26]}
// pragma translate_off
                                      ^ {Q_gt_refclk1[4],  Q_init_clk[4],  Q_user_clk[4],  Q_drp_clk_in[4]}
// pragma translate_on
                                        ) :
             ( LED_control == 2'b10 ) ? ( {lane_up3,     lane_up2,    lane_up1,     lane_up0}    ) :
             ( LED_control == 2'b11 ) ? ( {channel_up3,  channel_up2, channel_up1,  channel_up0} ) : "1111";
// HDL Embedded Text Block 2 eb2
// eb2 2
assign RXN =  { X1_MGT_RX_07_N, X1_MGT_RX_06_N, X1_MGT_RX_05_N, X1_MGT_RX_04_N };
assign RXP =  { X1_MGT_RX_07_P, X1_MGT_RX_06_P, X1_MGT_RX_05_P, X1_MGT_RX_04_P };
assign X1_MGT_TX_07_N = TXN[7];
assign X1_MGT_TX_07_P = TXP[7];
assign X1_MGT_TX_06_N = TXN[6];
assign X1_MGT_TX_06_P = TXP[6];
assign X1_MGT_TX_05_N = TXN[5];
assign X1_MGT_TX_05_P = TXP[5];
assign X1_MGT_TX_04_N = TXN[4];
assign X1_MGT_TX_04_P = TXP[4];
// HDL Embedded Text Block 3 eb3
// eb3 3
assign aurora_status_4_0  =  {gt_pll_lock0, soft_err0, hard_err0, lane_up0, channel_up0};
assign aurora_status_5_0  =  {gt_pll_lock1, soft_err1, hard_err1, lane_up1, channel_up1};
assign aurora_status_6_0  =  {gt_pll_lock2, soft_err2, hard_err2, lane_up2, channel_up2};
assign aurora_status_7_0  =  {gt_pll_lock3, soft_err3, hard_err3, lane_up3, channel_up3};

// ModuleWare code(v1.12) for instance 'U_3' of 'ppulldown'
pulldown  U_3 (gt_rxcdrovrden_in);

endmodule // top
