//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
//Date        : Thu May  7 01:51:34 2020
//Host        : hystou running 64-bit Ubuntu 16.04.6 LTS
//Command     : generate_target flasher_wrapper.bd
//Design      : flasher_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module flasher_wrapper
   (CLK_0,
    Q_0);
  input CLK_0;
  output [27:0]Q_0;

  wire CLK_0;
  wire [27:0]Q_0;

  flasher flasher_i
       (.CLK_0(CLK_0),
        .Q_0(Q_0));
endmodule
