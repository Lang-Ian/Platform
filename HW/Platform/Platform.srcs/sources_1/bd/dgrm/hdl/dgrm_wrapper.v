//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
//Date        : Tue Sep  1 13:26:46 2020
//Host        : hystou running 64-bit Ubuntu 16.04.7 LTS
//Command     : generate_target dgrm_wrapper.bd
//Design      : dgrm_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module dgrm_wrapper
   (DDR3_0_addr,
    DDR3_0_ba,
    DDR3_0_cas_n,
    DDR3_0_ck_n,
    DDR3_0_ck_p,
    DDR3_0_cke,
    DDR3_0_dm,
    DDR3_0_dq,
    DDR3_0_dqs_n,
    DDR3_0_dqs_p,
    DDR3_0_odt,
    DDR3_0_ras_n,
    DDR3_0_reset_n,
    DDR3_0_we_n,
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FCLK_CLK2,
    FCLK_CLK3,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    GPIO2_1_tri_o,
    GPIO_0_tri_o,
    HiTech_Global_clk_sel_0,
    IIC_0_0_scl_io,
    IIC_0_0_sda_io,
    LED_0,
    LED_control_0,
    M00_AXI_0_araddr,
    M00_AXI_0_arprot,
    M00_AXI_0_arready,
    M00_AXI_0_arvalid,
    M00_AXI_0_awaddr,
    M00_AXI_0_awprot,
    M00_AXI_0_awready,
    M00_AXI_0_awvalid,
    M00_AXI_0_bready,
    M00_AXI_0_bresp,
    M00_AXI_0_bvalid,
    M00_AXI_0_rdata,
    M00_AXI_0_rready,
    M00_AXI_0_rresp,
    M00_AXI_0_rvalid,
    M00_AXI_0_wdata,
    M00_AXI_0_wready,
    M00_AXI_0_wstrb,
    M00_AXI_0_wvalid,
    M01_AXI_0_araddr,
    M01_AXI_0_arprot,
    M01_AXI_0_arready,
    M01_AXI_0_arvalid,
    M01_AXI_0_awaddr,
    M01_AXI_0_awprot,
    M01_AXI_0_awready,
    M01_AXI_0_awvalid,
    M01_AXI_0_bready,
    M01_AXI_0_bresp,
    M01_AXI_0_bvalid,
    M01_AXI_0_rdata,
    M01_AXI_0_rready,
    M01_AXI_0_rresp,
    M01_AXI_0_rvalid,
    M01_AXI_0_wdata,
    M01_AXI_0_wready,
    M01_AXI_0_wstrb,
    M01_AXI_0_wvalid,
    M02_AXI_0_araddr,
    M02_AXI_0_arprot,
    M02_AXI_0_arready,
    M02_AXI_0_arvalid,
    M02_AXI_0_awaddr,
    M02_AXI_0_awprot,
    M02_AXI_0_awready,
    M02_AXI_0_awvalid,
    M02_AXI_0_bready,
    M02_AXI_0_bresp,
    M02_AXI_0_bvalid,
    M02_AXI_0_rdata,
    M02_AXI_0_rready,
    M02_AXI_0_rresp,
    M02_AXI_0_rvalid,
    M02_AXI_0_wdata,
    M02_AXI_0_wready,
    M02_AXI_0_wstrb,
    M02_AXI_0_wvalid,
    M03_AXI_0_araddr,
    M03_AXI_0_arprot,
    M03_AXI_0_arready,
    M03_AXI_0_arvalid,
    M03_AXI_0_awaddr,
    M03_AXI_0_awprot,
    M03_AXI_0_awready,
    M03_AXI_0_awvalid,
    M03_AXI_0_bready,
    M03_AXI_0_bresp,
    M03_AXI_0_bvalid,
    M03_AXI_0_rdata,
    M03_AXI_0_rready,
    M03_AXI_0_rresp,
    M03_AXI_0_rvalid,
    M03_AXI_0_wdata,
    M03_AXI_0_wready,
    M03_AXI_0_wstrb,
    M03_AXI_0_wvalid,
    MDIO_PHY_0_mdc,
    MDIO_PHY_0_mdio_io,
    MIG_clk,
    M_AXIS_0_tdata,
    M_AXIS_0_tready,
    M_AXIS_0_tvalid,
    M_AXIS_1_tdata,
    M_AXIS_1_tready,
    M_AXIS_1_tvalid,
    M_AXIS_2_tdata,
    M_AXIS_2_tready,
    M_AXIS_2_tvalid,
    M_AXIS_3_tdata,
    M_AXIS_3_tready,
    M_AXIS_3_tvalid,
    PMOD_2_tri_io,
    PMOD_PL_tri_i,
    PMOD_PS_tri_io,
    RGMII_0_rd,
    RGMII_0_rx_ctl,
    RGMII_0_rxc,
    RGMII_0_td,
    RGMII_0_tx_ctl,
    RGMII_0_txc,
    S_AXIS_0_tdata,
    S_AXIS_0_tready,
    S_AXIS_0_tvalid,
    S_AXIS_1_tdata,
    S_AXIS_1_tready,
    S_AXIS_1_tvalid,
    S_AXIS_2_tdata,
    S_AXIS_2_tready,
    S_AXIS_2_tvalid,
    S_AXIS_3_tdata,
    S_AXIS_3_tready,
    S_AXIS_3_tvalid,
    aurora_loopback_0,
    aurora_pma_init_0,
    aurora_power_down_0,
    aurora_reset_pb_0,
    aurora_status_4_0,
    aurora_status_5_0,
    aurora_status_6_0,
    aurora_status_7_0,
    init_calib_complete_0,
    private_interrupt_0,
    private_interrupt_1,
    soft_interrupt_0,
    sys_reset_N,
    usb_reset_0,
    user_clk);
  output [13:0]DDR3_0_addr;
  output [2:0]DDR3_0_ba;
  output DDR3_0_cas_n;
  output [0:0]DDR3_0_ck_n;
  output [0:0]DDR3_0_ck_p;
  output [0:0]DDR3_0_cke;
  output [1:0]DDR3_0_dm;
  inout [15:0]DDR3_0_dq;
  inout [1:0]DDR3_0_dqs_n;
  inout [1:0]DDR3_0_dqs_p;
  output [0:0]DDR3_0_odt;
  output DDR3_0_ras_n;
  output DDR3_0_reset_n;
  output DDR3_0_we_n;
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  output FCLK_CLK2;
  output FCLK_CLK3;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output [6:0]GPIO2_1_tri_o;
  output [8:0]GPIO_0_tri_o;
  output HiTech_Global_clk_sel_0;
  inout IIC_0_0_scl_io;
  inout IIC_0_0_sda_io;
  output [7:0]LED_0;
  output [1:0]LED_control_0;
  output [31:0]M00_AXI_0_araddr;
  output [2:0]M00_AXI_0_arprot;
  input [0:0]M00_AXI_0_arready;
  output [0:0]M00_AXI_0_arvalid;
  output [31:0]M00_AXI_0_awaddr;
  output [2:0]M00_AXI_0_awprot;
  input [0:0]M00_AXI_0_awready;
  output [0:0]M00_AXI_0_awvalid;
  output [0:0]M00_AXI_0_bready;
  input [1:0]M00_AXI_0_bresp;
  input [0:0]M00_AXI_0_bvalid;
  input [31:0]M00_AXI_0_rdata;
  output [0:0]M00_AXI_0_rready;
  input [1:0]M00_AXI_0_rresp;
  input [0:0]M00_AXI_0_rvalid;
  output [31:0]M00_AXI_0_wdata;
  input [0:0]M00_AXI_0_wready;
  output [3:0]M00_AXI_0_wstrb;
  output [0:0]M00_AXI_0_wvalid;
  output [31:0]M01_AXI_0_araddr;
  output [2:0]M01_AXI_0_arprot;
  input [0:0]M01_AXI_0_arready;
  output [0:0]M01_AXI_0_arvalid;
  output [31:0]M01_AXI_0_awaddr;
  output [2:0]M01_AXI_0_awprot;
  input [0:0]M01_AXI_0_awready;
  output [0:0]M01_AXI_0_awvalid;
  output [0:0]M01_AXI_0_bready;
  input [1:0]M01_AXI_0_bresp;
  input [0:0]M01_AXI_0_bvalid;
  input [31:0]M01_AXI_0_rdata;
  output [0:0]M01_AXI_0_rready;
  input [1:0]M01_AXI_0_rresp;
  input [0:0]M01_AXI_0_rvalid;
  output [31:0]M01_AXI_0_wdata;
  input [0:0]M01_AXI_0_wready;
  output [3:0]M01_AXI_0_wstrb;
  output [0:0]M01_AXI_0_wvalid;
  output [31:0]M02_AXI_0_araddr;
  output [2:0]M02_AXI_0_arprot;
  input [0:0]M02_AXI_0_arready;
  output [0:0]M02_AXI_0_arvalid;
  output [31:0]M02_AXI_0_awaddr;
  output [2:0]M02_AXI_0_awprot;
  input [0:0]M02_AXI_0_awready;
  output [0:0]M02_AXI_0_awvalid;
  output [0:0]M02_AXI_0_bready;
  input [1:0]M02_AXI_0_bresp;
  input [0:0]M02_AXI_0_bvalid;
  input [31:0]M02_AXI_0_rdata;
  output [0:0]M02_AXI_0_rready;
  input [1:0]M02_AXI_0_rresp;
  input [0:0]M02_AXI_0_rvalid;
  output [31:0]M02_AXI_0_wdata;
  input [0:0]M02_AXI_0_wready;
  output [3:0]M02_AXI_0_wstrb;
  output [0:0]M02_AXI_0_wvalid;
  output [31:0]M03_AXI_0_araddr;
  output [2:0]M03_AXI_0_arprot;
  input [0:0]M03_AXI_0_arready;
  output [0:0]M03_AXI_0_arvalid;
  output [31:0]M03_AXI_0_awaddr;
  output [2:0]M03_AXI_0_awprot;
  input [0:0]M03_AXI_0_awready;
  output [0:0]M03_AXI_0_awvalid;
  output [0:0]M03_AXI_0_bready;
  input [1:0]M03_AXI_0_bresp;
  input [0:0]M03_AXI_0_bvalid;
  input [31:0]M03_AXI_0_rdata;
  output [0:0]M03_AXI_0_rready;
  input [1:0]M03_AXI_0_rresp;
  input [0:0]M03_AXI_0_rvalid;
  output [31:0]M03_AXI_0_wdata;
  input [0:0]M03_AXI_0_wready;
  output [3:0]M03_AXI_0_wstrb;
  output [0:0]M03_AXI_0_wvalid;
  output MDIO_PHY_0_mdc;
  inout MDIO_PHY_0_mdio_io;
  input MIG_clk;
  output [63:0]M_AXIS_0_tdata;
  input M_AXIS_0_tready;
  output M_AXIS_0_tvalid;
  output [63:0]M_AXIS_1_tdata;
  input M_AXIS_1_tready;
  output M_AXIS_1_tvalid;
  output [63:0]M_AXIS_2_tdata;
  input M_AXIS_2_tready;
  output M_AXIS_2_tvalid;
  output [63:0]M_AXIS_3_tdata;
  input M_AXIS_3_tready;
  output M_AXIS_3_tvalid;
  inout [3:0]PMOD_2_tri_io;
  input [1:0]PMOD_PL_tri_i;
  inout [1:0]PMOD_PS_tri_io;
  input [3:0]RGMII_0_rd;
  input RGMII_0_rx_ctl;
  input RGMII_0_rxc;
  output [3:0]RGMII_0_td;
  output RGMII_0_tx_ctl;
  output RGMII_0_txc;
  input [63:0]S_AXIS_0_tdata;
  output S_AXIS_0_tready;
  input S_AXIS_0_tvalid;
  input [63:0]S_AXIS_1_tdata;
  output S_AXIS_1_tready;
  input S_AXIS_1_tvalid;
  input [63:0]S_AXIS_2_tdata;
  output S_AXIS_2_tready;
  input S_AXIS_2_tvalid;
  input [63:0]S_AXIS_3_tdata;
  output S_AXIS_3_tready;
  input S_AXIS_3_tvalid;
  output [2:0]aurora_loopback_0;
  output aurora_pma_init_0;
  output aurora_power_down_0;
  output aurora_reset_pb_0;
  input [4:0]aurora_status_4_0;
  input [4:0]aurora_status_5_0;
  input [4:0]aurora_status_6_0;
  input [4:0]aurora_status_7_0;
  output init_calib_complete_0;
  input private_interrupt_0;
  input private_interrupt_1;
  output soft_interrupt_0;
  input sys_reset_N;
  output usb_reset_0;
  input user_clk;

  wire [13:0]DDR3_0_addr;
  wire [2:0]DDR3_0_ba;
  wire DDR3_0_cas_n;
  wire [0:0]DDR3_0_ck_n;
  wire [0:0]DDR3_0_ck_p;
  wire [0:0]DDR3_0_cke;
  wire [1:0]DDR3_0_dm;
  wire [15:0]DDR3_0_dq;
  wire [1:0]DDR3_0_dqs_n;
  wire [1:0]DDR3_0_dqs_p;
  wire [0:0]DDR3_0_odt;
  wire DDR3_0_ras_n;
  wire DDR3_0_reset_n;
  wire DDR3_0_we_n;
  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FCLK_CLK2;
  wire FCLK_CLK3;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [6:0]GPIO2_1_tri_o;
  wire [8:0]GPIO_0_tri_o;
  wire HiTech_Global_clk_sel_0;
  wire IIC_0_0_scl_i;
  wire IIC_0_0_scl_io;
  wire IIC_0_0_scl_o;
  wire IIC_0_0_scl_t;
  wire IIC_0_0_sda_i;
  wire IIC_0_0_sda_io;
  wire IIC_0_0_sda_o;
  wire IIC_0_0_sda_t;
  wire [7:0]LED_0;
  wire [1:0]LED_control_0;
  wire [31:0]M00_AXI_0_araddr;
  wire [2:0]M00_AXI_0_arprot;
  wire [0:0]M00_AXI_0_arready;
  wire [0:0]M00_AXI_0_arvalid;
  wire [31:0]M00_AXI_0_awaddr;
  wire [2:0]M00_AXI_0_awprot;
  wire [0:0]M00_AXI_0_awready;
  wire [0:0]M00_AXI_0_awvalid;
  wire [0:0]M00_AXI_0_bready;
  wire [1:0]M00_AXI_0_bresp;
  wire [0:0]M00_AXI_0_bvalid;
  wire [31:0]M00_AXI_0_rdata;
  wire [0:0]M00_AXI_0_rready;
  wire [1:0]M00_AXI_0_rresp;
  wire [0:0]M00_AXI_0_rvalid;
  wire [31:0]M00_AXI_0_wdata;
  wire [0:0]M00_AXI_0_wready;
  wire [3:0]M00_AXI_0_wstrb;
  wire [0:0]M00_AXI_0_wvalid;
  wire [31:0]M01_AXI_0_araddr;
  wire [2:0]M01_AXI_0_arprot;
  wire [0:0]M01_AXI_0_arready;
  wire [0:0]M01_AXI_0_arvalid;
  wire [31:0]M01_AXI_0_awaddr;
  wire [2:0]M01_AXI_0_awprot;
  wire [0:0]M01_AXI_0_awready;
  wire [0:0]M01_AXI_0_awvalid;
  wire [0:0]M01_AXI_0_bready;
  wire [1:0]M01_AXI_0_bresp;
  wire [0:0]M01_AXI_0_bvalid;
  wire [31:0]M01_AXI_0_rdata;
  wire [0:0]M01_AXI_0_rready;
  wire [1:0]M01_AXI_0_rresp;
  wire [0:0]M01_AXI_0_rvalid;
  wire [31:0]M01_AXI_0_wdata;
  wire [0:0]M01_AXI_0_wready;
  wire [3:0]M01_AXI_0_wstrb;
  wire [0:0]M01_AXI_0_wvalid;
  wire [31:0]M02_AXI_0_araddr;
  wire [2:0]M02_AXI_0_arprot;
  wire [0:0]M02_AXI_0_arready;
  wire [0:0]M02_AXI_0_arvalid;
  wire [31:0]M02_AXI_0_awaddr;
  wire [2:0]M02_AXI_0_awprot;
  wire [0:0]M02_AXI_0_awready;
  wire [0:0]M02_AXI_0_awvalid;
  wire [0:0]M02_AXI_0_bready;
  wire [1:0]M02_AXI_0_bresp;
  wire [0:0]M02_AXI_0_bvalid;
  wire [31:0]M02_AXI_0_rdata;
  wire [0:0]M02_AXI_0_rready;
  wire [1:0]M02_AXI_0_rresp;
  wire [0:0]M02_AXI_0_rvalid;
  wire [31:0]M02_AXI_0_wdata;
  wire [0:0]M02_AXI_0_wready;
  wire [3:0]M02_AXI_0_wstrb;
  wire [0:0]M02_AXI_0_wvalid;
  wire [31:0]M03_AXI_0_araddr;
  wire [2:0]M03_AXI_0_arprot;
  wire [0:0]M03_AXI_0_arready;
  wire [0:0]M03_AXI_0_arvalid;
  wire [31:0]M03_AXI_0_awaddr;
  wire [2:0]M03_AXI_0_awprot;
  wire [0:0]M03_AXI_0_awready;
  wire [0:0]M03_AXI_0_awvalid;
  wire [0:0]M03_AXI_0_bready;
  wire [1:0]M03_AXI_0_bresp;
  wire [0:0]M03_AXI_0_bvalid;
  wire [31:0]M03_AXI_0_rdata;
  wire [0:0]M03_AXI_0_rready;
  wire [1:0]M03_AXI_0_rresp;
  wire [0:0]M03_AXI_0_rvalid;
  wire [31:0]M03_AXI_0_wdata;
  wire [0:0]M03_AXI_0_wready;
  wire [3:0]M03_AXI_0_wstrb;
  wire [0:0]M03_AXI_0_wvalid;
  wire MDIO_PHY_0_mdc;
  wire MDIO_PHY_0_mdio_i;
  wire MDIO_PHY_0_mdio_io;
  wire MDIO_PHY_0_mdio_o;
  wire MDIO_PHY_0_mdio_t;
  wire MIG_clk;
  wire [63:0]M_AXIS_0_tdata;
  wire M_AXIS_0_tready;
  wire M_AXIS_0_tvalid;
  wire [63:0]M_AXIS_1_tdata;
  wire M_AXIS_1_tready;
  wire M_AXIS_1_tvalid;
  wire [63:0]M_AXIS_2_tdata;
  wire M_AXIS_2_tready;
  wire M_AXIS_2_tvalid;
  wire [63:0]M_AXIS_3_tdata;
  wire M_AXIS_3_tready;
  wire M_AXIS_3_tvalid;
  wire [0:0]PMOD_2_tri_i_0;
  wire [1:1]PMOD_2_tri_i_1;
  wire [2:2]PMOD_2_tri_i_2;
  wire [3:3]PMOD_2_tri_i_3;
  wire [0:0]PMOD_2_tri_io_0;
  wire [1:1]PMOD_2_tri_io_1;
  wire [2:2]PMOD_2_tri_io_2;
  wire [3:3]PMOD_2_tri_io_3;
  wire [0:0]PMOD_2_tri_o_0;
  wire [1:1]PMOD_2_tri_o_1;
  wire [2:2]PMOD_2_tri_o_2;
  wire [3:3]PMOD_2_tri_o_3;
  wire [0:0]PMOD_2_tri_t_0;
  wire [1:1]PMOD_2_tri_t_1;
  wire [2:2]PMOD_2_tri_t_2;
  wire [3:3]PMOD_2_tri_t_3;
  wire [1:0]PMOD_PL_tri_i;
  wire [0:0]PMOD_PS_tri_i_0;
  wire [1:1]PMOD_PS_tri_i_1;
  wire [0:0]PMOD_PS_tri_io_0;
  wire [1:1]PMOD_PS_tri_io_1;
  wire [0:0]PMOD_PS_tri_o_0;
  wire [1:1]PMOD_PS_tri_o_1;
  wire [0:0]PMOD_PS_tri_t_0;
  wire [1:1]PMOD_PS_tri_t_1;
  wire [3:0]RGMII_0_rd;
  wire RGMII_0_rx_ctl;
  wire RGMII_0_rxc;
  wire [3:0]RGMII_0_td;
  wire RGMII_0_tx_ctl;
  wire RGMII_0_txc;
  wire [63:0]S_AXIS_0_tdata;
  wire S_AXIS_0_tready;
  wire S_AXIS_0_tvalid;
  wire [63:0]S_AXIS_1_tdata;
  wire S_AXIS_1_tready;
  wire S_AXIS_1_tvalid;
  wire [63:0]S_AXIS_2_tdata;
  wire S_AXIS_2_tready;
  wire S_AXIS_2_tvalid;
  wire [63:0]S_AXIS_3_tdata;
  wire S_AXIS_3_tready;
  wire S_AXIS_3_tvalid;
  wire [2:0]aurora_loopback_0;
  wire aurora_pma_init_0;
  wire aurora_power_down_0;
  wire aurora_reset_pb_0;
  wire [4:0]aurora_status_4_0;
  wire [4:0]aurora_status_5_0;
  wire [4:0]aurora_status_6_0;
  wire [4:0]aurora_status_7_0;
  wire init_calib_complete_0;
  wire private_interrupt_0;
  wire private_interrupt_1;
  wire soft_interrupt_0;
  wire sys_reset_N;
  wire usb_reset_0;
  wire user_clk;

  IOBUF IIC_0_0_scl_iobuf
       (.I(IIC_0_0_scl_o),
        .IO(IIC_0_0_scl_io),
        .O(IIC_0_0_scl_i),
        .T(IIC_0_0_scl_t));
  IOBUF IIC_0_0_sda_iobuf
       (.I(IIC_0_0_sda_o),
        .IO(IIC_0_0_sda_io),
        .O(IIC_0_0_sda_i),
        .T(IIC_0_0_sda_t));
  IOBUF MDIO_PHY_0_mdio_iobuf
       (.I(MDIO_PHY_0_mdio_o),
        .IO(MDIO_PHY_0_mdio_io),
        .O(MDIO_PHY_0_mdio_i),
        .T(MDIO_PHY_0_mdio_t));
  IOBUF PMOD_2_tri_iobuf_0
       (.I(PMOD_2_tri_o_0),
        .IO(PMOD_2_tri_io[0]),
        .O(PMOD_2_tri_i_0),
        .T(PMOD_2_tri_t_0));
  IOBUF PMOD_2_tri_iobuf_1
       (.I(PMOD_2_tri_o_1),
        .IO(PMOD_2_tri_io[1]),
        .O(PMOD_2_tri_i_1),
        .T(PMOD_2_tri_t_1));
  IOBUF PMOD_2_tri_iobuf_2
       (.I(PMOD_2_tri_o_2),
        .IO(PMOD_2_tri_io[2]),
        .O(PMOD_2_tri_i_2),
        .T(PMOD_2_tri_t_2));
  IOBUF PMOD_2_tri_iobuf_3
       (.I(PMOD_2_tri_o_3),
        .IO(PMOD_2_tri_io[3]),
        .O(PMOD_2_tri_i_3),
        .T(PMOD_2_tri_t_3));
  IOBUF PMOD_PS_tri_iobuf_0
       (.I(PMOD_PS_tri_o_0),
        .IO(PMOD_PS_tri_io[0]),
        .O(PMOD_PS_tri_i_0),
        .T(PMOD_PS_tri_t_0));
  IOBUF PMOD_PS_tri_iobuf_1
       (.I(PMOD_PS_tri_o_1),
        .IO(PMOD_PS_tri_io[1]),
        .O(PMOD_PS_tri_i_1),
        .T(PMOD_PS_tri_t_1));
  dgrm dgrm_i
       (.DDR3_0_addr(DDR3_0_addr),
        .DDR3_0_ba(DDR3_0_ba),
        .DDR3_0_cas_n(DDR3_0_cas_n),
        .DDR3_0_ck_n(DDR3_0_ck_n),
        .DDR3_0_ck_p(DDR3_0_ck_p),
        .DDR3_0_cke(DDR3_0_cke),
        .DDR3_0_dm(DDR3_0_dm),
        .DDR3_0_dq(DDR3_0_dq),
        .DDR3_0_dqs_n(DDR3_0_dqs_n),
        .DDR3_0_dqs_p(DDR3_0_dqs_p),
        .DDR3_0_odt(DDR3_0_odt),
        .DDR3_0_ras_n(DDR3_0_ras_n),
        .DDR3_0_reset_n(DDR3_0_reset_n),
        .DDR3_0_we_n(DDR3_0_we_n),
        .DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FCLK_CLK2(FCLK_CLK2),
        .FCLK_CLK3(FCLK_CLK3),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .GPIO2_1_tri_o(GPIO2_1_tri_o),
        .GPIO_0_tri_o(GPIO_0_tri_o),
        .HiTech_Global_clk_sel_0(HiTech_Global_clk_sel_0),
        .IIC_0_0_scl_i(IIC_0_0_scl_i),
        .IIC_0_0_scl_o(IIC_0_0_scl_o),
        .IIC_0_0_scl_t(IIC_0_0_scl_t),
        .IIC_0_0_sda_i(IIC_0_0_sda_i),
        .IIC_0_0_sda_o(IIC_0_0_sda_o),
        .IIC_0_0_sda_t(IIC_0_0_sda_t),
        .LED_0(LED_0),
        .LED_control_0(LED_control_0),
        .M00_AXI_0_araddr(M00_AXI_0_araddr),
        .M00_AXI_0_arprot(M00_AXI_0_arprot),
        .M00_AXI_0_arready(M00_AXI_0_arready),
        .M00_AXI_0_arvalid(M00_AXI_0_arvalid),
        .M00_AXI_0_awaddr(M00_AXI_0_awaddr),
        .M00_AXI_0_awprot(M00_AXI_0_awprot),
        .M00_AXI_0_awready(M00_AXI_0_awready),
        .M00_AXI_0_awvalid(M00_AXI_0_awvalid),
        .M00_AXI_0_bready(M00_AXI_0_bready),
        .M00_AXI_0_bresp(M00_AXI_0_bresp),
        .M00_AXI_0_bvalid(M00_AXI_0_bvalid),
        .M00_AXI_0_rdata(M00_AXI_0_rdata),
        .M00_AXI_0_rready(M00_AXI_0_rready),
        .M00_AXI_0_rresp(M00_AXI_0_rresp),
        .M00_AXI_0_rvalid(M00_AXI_0_rvalid),
        .M00_AXI_0_wdata(M00_AXI_0_wdata),
        .M00_AXI_0_wready(M00_AXI_0_wready),
        .M00_AXI_0_wstrb(M00_AXI_0_wstrb),
        .M00_AXI_0_wvalid(M00_AXI_0_wvalid),
        .M01_AXI_0_araddr(M01_AXI_0_araddr),
        .M01_AXI_0_arprot(M01_AXI_0_arprot),
        .M01_AXI_0_arready(M01_AXI_0_arready),
        .M01_AXI_0_arvalid(M01_AXI_0_arvalid),
        .M01_AXI_0_awaddr(M01_AXI_0_awaddr),
        .M01_AXI_0_awprot(M01_AXI_0_awprot),
        .M01_AXI_0_awready(M01_AXI_0_awready),
        .M01_AXI_0_awvalid(M01_AXI_0_awvalid),
        .M01_AXI_0_bready(M01_AXI_0_bready),
        .M01_AXI_0_bresp(M01_AXI_0_bresp),
        .M01_AXI_0_bvalid(M01_AXI_0_bvalid),
        .M01_AXI_0_rdata(M01_AXI_0_rdata),
        .M01_AXI_0_rready(M01_AXI_0_rready),
        .M01_AXI_0_rresp(M01_AXI_0_rresp),
        .M01_AXI_0_rvalid(M01_AXI_0_rvalid),
        .M01_AXI_0_wdata(M01_AXI_0_wdata),
        .M01_AXI_0_wready(M01_AXI_0_wready),
        .M01_AXI_0_wstrb(M01_AXI_0_wstrb),
        .M01_AXI_0_wvalid(M01_AXI_0_wvalid),
        .M02_AXI_0_araddr(M02_AXI_0_araddr),
        .M02_AXI_0_arprot(M02_AXI_0_arprot),
        .M02_AXI_0_arready(M02_AXI_0_arready),
        .M02_AXI_0_arvalid(M02_AXI_0_arvalid),
        .M02_AXI_0_awaddr(M02_AXI_0_awaddr),
        .M02_AXI_0_awprot(M02_AXI_0_awprot),
        .M02_AXI_0_awready(M02_AXI_0_awready),
        .M02_AXI_0_awvalid(M02_AXI_0_awvalid),
        .M02_AXI_0_bready(M02_AXI_0_bready),
        .M02_AXI_0_bresp(M02_AXI_0_bresp),
        .M02_AXI_0_bvalid(M02_AXI_0_bvalid),
        .M02_AXI_0_rdata(M02_AXI_0_rdata),
        .M02_AXI_0_rready(M02_AXI_0_rready),
        .M02_AXI_0_rresp(M02_AXI_0_rresp),
        .M02_AXI_0_rvalid(M02_AXI_0_rvalid),
        .M02_AXI_0_wdata(M02_AXI_0_wdata),
        .M02_AXI_0_wready(M02_AXI_0_wready),
        .M02_AXI_0_wstrb(M02_AXI_0_wstrb),
        .M02_AXI_0_wvalid(M02_AXI_0_wvalid),
        .M03_AXI_0_araddr(M03_AXI_0_araddr),
        .M03_AXI_0_arprot(M03_AXI_0_arprot),
        .M03_AXI_0_arready(M03_AXI_0_arready),
        .M03_AXI_0_arvalid(M03_AXI_0_arvalid),
        .M03_AXI_0_awaddr(M03_AXI_0_awaddr),
        .M03_AXI_0_awprot(M03_AXI_0_awprot),
        .M03_AXI_0_awready(M03_AXI_0_awready),
        .M03_AXI_0_awvalid(M03_AXI_0_awvalid),
        .M03_AXI_0_bready(M03_AXI_0_bready),
        .M03_AXI_0_bresp(M03_AXI_0_bresp),
        .M03_AXI_0_bvalid(M03_AXI_0_bvalid),
        .M03_AXI_0_rdata(M03_AXI_0_rdata),
        .M03_AXI_0_rready(M03_AXI_0_rready),
        .M03_AXI_0_rresp(M03_AXI_0_rresp),
        .M03_AXI_0_rvalid(M03_AXI_0_rvalid),
        .M03_AXI_0_wdata(M03_AXI_0_wdata),
        .M03_AXI_0_wready(M03_AXI_0_wready),
        .M03_AXI_0_wstrb(M03_AXI_0_wstrb),
        .M03_AXI_0_wvalid(M03_AXI_0_wvalid),
        .MDIO_PHY_0_mdc(MDIO_PHY_0_mdc),
        .MDIO_PHY_0_mdio_i(MDIO_PHY_0_mdio_i),
        .MDIO_PHY_0_mdio_o(MDIO_PHY_0_mdio_o),
        .MDIO_PHY_0_mdio_t(MDIO_PHY_0_mdio_t),
        .MIG_clk(MIG_clk),
        .M_AXIS_0_tdata(M_AXIS_0_tdata),
        .M_AXIS_0_tready(M_AXIS_0_tready),
        .M_AXIS_0_tvalid(M_AXIS_0_tvalid),
        .M_AXIS_1_tdata(M_AXIS_1_tdata),
        .M_AXIS_1_tready(M_AXIS_1_tready),
        .M_AXIS_1_tvalid(M_AXIS_1_tvalid),
        .M_AXIS_2_tdata(M_AXIS_2_tdata),
        .M_AXIS_2_tready(M_AXIS_2_tready),
        .M_AXIS_2_tvalid(M_AXIS_2_tvalid),
        .M_AXIS_3_tdata(M_AXIS_3_tdata),
        .M_AXIS_3_tready(M_AXIS_3_tready),
        .M_AXIS_3_tvalid(M_AXIS_3_tvalid),
        .PMOD_2_tri_i({PMOD_2_tri_i_3,PMOD_2_tri_i_2,PMOD_2_tri_i_1,PMOD_2_tri_i_0}),
        .PMOD_2_tri_o({PMOD_2_tri_o_3,PMOD_2_tri_o_2,PMOD_2_tri_o_1,PMOD_2_tri_o_0}),
        .PMOD_2_tri_t({PMOD_2_tri_t_3,PMOD_2_tri_t_2,PMOD_2_tri_t_1,PMOD_2_tri_t_0}),
        .PMOD_PL_tri_i(PMOD_PL_tri_i),
        .PMOD_PS_tri_i({PMOD_PS_tri_i_1,PMOD_PS_tri_i_0}),
        .PMOD_PS_tri_o({PMOD_PS_tri_o_1,PMOD_PS_tri_o_0}),
        .PMOD_PS_tri_t({PMOD_PS_tri_t_1,PMOD_PS_tri_t_0}),
        .RGMII_0_rd(RGMII_0_rd),
        .RGMII_0_rx_ctl(RGMII_0_rx_ctl),
        .RGMII_0_rxc(RGMII_0_rxc),
        .RGMII_0_td(RGMII_0_td),
        .RGMII_0_tx_ctl(RGMII_0_tx_ctl),
        .RGMII_0_txc(RGMII_0_txc),
        .S_AXIS_0_tdata(S_AXIS_0_tdata),
        .S_AXIS_0_tready(S_AXIS_0_tready),
        .S_AXIS_0_tvalid(S_AXIS_0_tvalid),
        .S_AXIS_1_tdata(S_AXIS_1_tdata),
        .S_AXIS_1_tready(S_AXIS_1_tready),
        .S_AXIS_1_tvalid(S_AXIS_1_tvalid),
        .S_AXIS_2_tdata(S_AXIS_2_tdata),
        .S_AXIS_2_tready(S_AXIS_2_tready),
        .S_AXIS_2_tvalid(S_AXIS_2_tvalid),
        .S_AXIS_3_tdata(S_AXIS_3_tdata),
        .S_AXIS_3_tready(S_AXIS_3_tready),
        .S_AXIS_3_tvalid(S_AXIS_3_tvalid),
        .aurora_loopback_0(aurora_loopback_0),
        .aurora_pma_init_0(aurora_pma_init_0),
        .aurora_power_down_0(aurora_power_down_0),
        .aurora_reset_pb_0(aurora_reset_pb_0),
        .aurora_status_4_0(aurora_status_4_0),
        .aurora_status_5_0(aurora_status_5_0),
        .aurora_status_6_0(aurora_status_6_0),
        .aurora_status_7_0(aurora_status_7_0),
        .init_calib_complete_0(init_calib_complete_0),
        .private_interrupt_0(private_interrupt_0),
        .private_interrupt_1(private_interrupt_1),
        .soft_interrupt_0(soft_interrupt_0),
        .sys_reset_N(sys_reset_N),
        .usb_reset_0(usb_reset_0),
        .user_clk(user_clk));
endmodule
