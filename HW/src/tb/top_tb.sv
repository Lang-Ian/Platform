`timescale 100 ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 01/22/2019 01:42:57 AM
// Design Name:
// Module Name: top_tb
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
// References:  UG585 Zynq TRM
//
//////////////////////////////////////////////////////////////////////////////////

interface th_IF;
	   parameter int T_CLK = 60;    // 166MHz
	   parameter int T_MGT = 64;    // 156.25MHz



	// I/O Groups
/*
		wire t_iogroup X1_1;
		wire t_iogroup X1_2;
		wire t_iogroup X2_1;
		wire t_iogroup X2_2;
*/
	    wire X1_1_311, X1_1_310, X1_1_309, X1_1_308, X1_1_307, X1_1_306, X1_1_305, X1_1_304, X1_1_303, X1_1_302, X1_1_301, X1_1_300;
	    wire X1_1_211, X1_1_210, X1_1_209, X1_1_208, X1_1_207, X1_1_206, X1_1_205, X1_1_204, X1_1_203, X1_1_202, X1_1_201, X1_1_200;
	    wire X1_1_111, X1_1_110, X1_1_109, X1_1_108, X1_1_107, X1_1_106, X1_1_105, X1_1_104, X1_1_103, X1_1_102, X1_1_101, X1_1_100;
	    wire X1_1_011, X1_1_010, X1_1_009, X1_1_008, X1_1_007, X1_1_006, X1_1_005, X1_1_004, X1_1_003, X1_1_002, X1_1_001, X1_1_000;

	    wire X1_2_311, X1_2_310, X1_2_309, X1_2_308, X1_2_307, X1_2_306, X1_2_305, X1_2_304, X1_2_303, X1_2_302, X1_2_301, X1_2_300;
	    wire X1_2_211, X1_2_210, X1_2_209, X1_2_208, X1_2_207, X1_2_206, X1_2_205, X1_2_204, X1_2_203, X1_2_202, X1_2_201, X1_2_200;
	    reg  X1_2_111, X1_2_110;
	    wire                     X1_2_109, X1_2_108, X1_2_107, X1_2_106, X1_2_105, X1_2_104, X1_2_103, X1_2_102, X1_2_101, X1_2_100;
	    wire X1_2_011, X1_2_010, X1_2_009, X1_2_008, X1_2_007, X1_2_006, X1_2_005, X1_2_004, X1_2_003, X1_2_002, X1_2_001, X1_2_000;

	    wire X2_1_311, X2_1_310, X2_1_309, X2_1_308, X2_1_307, X2_1_306, X2_1_305, X2_1_304, X2_1_303, X2_1_302, X2_1_301, X2_1_300;
	    wire X2_1_211, X2_1_210, X2_1_209, X2_1_208, X2_1_207, X2_1_206, X2_1_205, X2_1_204, X2_1_203, X2_1_202, X2_1_201, X2_1_200;
	    wire X2_1_111, X2_1_110, X2_1_109, X2_1_108, X2_1_107, X2_1_106, X2_1_105, X2_1_104, X2_1_103, X2_1_102, X2_1_101, X2_1_100;
	    wire X2_1_011, X2_1_010, X2_1_009, X2_1_008, X2_1_007, X2_1_006, X2_1_005, X2_1_004, X2_1_003, X2_1_002, X2_1_001, X2_1_000;

	    wire X2_2_311, X2_2_310, X2_2_309, X2_2_308, X2_2_307, X2_2_306, X2_2_305, X2_2_304, X2_2_303, X2_2_302, X2_2_301, X2_2_300;
	    wire X2_2_211, X2_2_210, X2_2_209, X2_2_208, X2_2_207, X2_2_206, X2_2_205, X2_2_204, X2_2_203, X2_2_202, X2_2_201, X2_2_200;
	    wire X2_2_111, X2_2_110, X2_2_109, X2_2_108, X2_2_107, X2_2_106, X2_2_105, X2_2_104, X2_2_103, X2_2_102, X2_2_101, X2_2_100;
	    wire X2_2_011, X2_2_010, X2_2_009, X2_2_008, X2_2_007, X2_2_006, X2_2_005, X2_2_004, X2_2_003, X2_2_002, X2_2_001, X2_2_000;


//		wire t_mgtgroup1 X1_MGT1;
        wire X1_MGT_TX_04_P, X1_MGT_TX_04_N, X1_MGT_RX_04_P, X1_MGT_RX_04_N, X1_MGT_TX_05_P, X1_MGT_TX_05_N, X1_MGT_RX_05_P, X1_MGT_RX_05_N, X1_MGT_TX_06_P, X1_MGT_TX_06_N, X1_MGT_RX_06_P, X1_MGT_RX_06_N, X1_MGT_TX_07_P, X1_MGT_TX_07_N, X1_MGT_RX_07_P, X1_MGT_RX_07_N;
        reg      X1_MGT_CLK_1_P,   X1_MGT_CLK_1_N;
 //       wire   w_X1_MGT_CLK_1_P, w_X1_MGT_CLK_1_N;   REMOVE ASAP
 //       assign w_X1_MGT_CLK_1_P  = X1_MGT_CLK_1_P;
 //       assign w_X1_MGT_CLK_1_N  = X1_MGT_CLK_1_N;

		wire logic [3:0] LED;

	// PS DDR Connections
		wire logic [14:0]DDR_addr;               //logic [14:0]s_DDR_addr            = 15'bz;
		wire logic  [2:0]DDR_ba;                 //logic  [2:0]s_DDR_ba              = 3'bz;
		wire logic       DDR_cas_n;              //logic       s_DDR_cas_n           = 1'bz;
		wire logic       DDR_ck_n;               //logic       s_DDR_ck_n            = 1'bz;
		wire logic       DDR_ck_p;               //logic       s_DDR_ck_p            = 1'bz;
		wire logic       DDR_cke;                //logic       s_DDR_cke             = 1'bz;
		wire logic       DDR_cs_n;               //logic       s_DDR_cs_n            = 1'bz;
		wire logic [3:0] DDR_dm;                 //logic [3:0] s_DDR_dm              = 4'bz;
		wire logic [31:0] DDR_dq;                //logic [31:0] s_DDR_dq             = 32'bz;
		wire logic [3:0] DDR_dqs_n;              //logic [3:0] s_DDR_dqs_n           = 4'bz;
		wire logic [3:0] DDR_dqs_p;              //logic [3:0] s_DDR_dqs_p           = 4'bz;
		wire logic       DDR_odt;                //logic       s_DDR_odt             = 1'bz;
		wire logic       DDR_ras_n;              //logic       s_DDR_ras_n           = 1'bz;
		wire logic       DDR_reset_n;            //logic       s_DDR_reset_n         = 1'bz;
		wire logic       DDR_we_n;               //logic       s_DDR_we_n            = 1'bz;
		                                         //
	// PS FIXED Connection                       //
		wire logic         FIXED_IO_ddr_vrn;     //logic         s_FIXED_IO_ddr_vrn   = 1'bz;
		wire logic         FIXED_IO_ddr_vrp;     //logic         s_FIXED_IO_ddr_vrp   = 1'bz;
		wire logic [53:0]  FIXED_IO_mio;         //logic [53:0]  s_FIXED_IO_mio       = 53'bz;
		wire logic         FIXED_IO_ps_clk;      //logic         s_FIXED_IO_ps_clk    = 1'bz;
		wire logic         FIXED_IO_ps_porb;     //logic         s_FIXED_IO_ps_porb   = 1'bz;
		wire logic         FIXED_IO_ps_srstb;    //logic         s_FIXED_IO_ps_srstb  = 1'bz;

endinterface



module top_tb #(parameter RTL = 1);

    th_IF IF();

    event startClocks,
          stopClocks;

    reg resp;
		int error_count = 0;


        // The code is pretty ugly here, so I've had to make the name unique.

        task read_check( input [31:0]  address, input [31:0] expected );

            reg [31:0] poll;

            top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.read_data(  address,4, poll, resp );

            if( poll !== expected )
								begin
                $display( "read 0x%8h froma address 0x%8h, should have read 0x%8h", poll, address, expected );
								error_count=error_count+1;
								end
						else
                $display( "read 0x%8h correctly from 0x%8h,", poll, address );

        endtask;



generate if( RTL == 1 ) begin

initial begin : main

								const logic [31:0] debug                 = 32'h40000000;
								const logic [31:0] aurora_reset_pb       = 32'h40000004;
								const logic [31:0] aurora_pma_init       = 32'h40000008;
								const logic [31:0] HiTech_Global_clk_sel = 32'h4000000C;
								const logic [31:0] aurora_status_4       = 32'h40000010;
								const logic [31:0] aurora_status_5       = 32'h40000014;
								const logic [31:0] aurora_status_6       = 32'h40000018;
								const logic [31:0] aurora_status_7       = 32'h4000001C;
								const logic [31:0] LED_control           = 32'h40000020;
								const logic [31:0] usb_reset             = 32'h40000024;
								const logic [31:0] soft_interrupt        = 32'h40000024;
								const logic [31:0] aurora_power_down            = 32'h4000002C;
								const logic [31:0] aurora_loopback              = 32'h40000030;
								const logic [31:0] flasher_enable               = 32'h40000034;


								const logic [31:0] channel_up_toggle_count_4    = 32'h40000080;
								const logic [31:0] lane_up_toggle_count_4       = 32'h40000084;
								const logic [31:0] gt_pll_lock_toggle_count_4   = 32'h40000088;
								const logic [31:0] channel_up_toggle_count_5    = 32'h40000090;
								const logic [31:0] lane_up_toggle_count_5       = 32'h40000094;
								const logic [31:0] gt_pll_lock_toggle_count_5   = 32'h40000098;
								const logic [31:0] channel_up_toggle_count_6    = 32'h400000A0;
								const logic [31:0] lane_up_toggle_count_6       = 32'h400000A4;
								const logic [31:0] gt_pll_lock_toggle_count_6   = 32'h400000A8;
								const logic [31:0] channel_up_toggle_count_7    = 32'h400000B0;
								const logic [31:0] lane_up_toggle_count_7       = 32'h400000B4;
								const logic [31:0] gt_pll_lock_toggle_count_7   = 32'h400000B8;

                logic [31:0] poll;

                $display( "Test bench running in RTL mode." );

                #1000 ->startClocks;


                #10000
        //Reset the PL
        top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.fpga_soft_reset(32'h1);
        top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.fpga_soft_reset(32'h0);



        // Wait about 15us for reset to complete.
        #150000

		//Re-reset the PL
		top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.fpga_soft_reset(32'h1);
		top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.fpga_soft_reset(32'h0);

       // Wait about 15us for reset to complete.
			 #150000

								// Turn on the flasher.
                $display( "turning on the flasher (3 big LEDs)" );
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data( flasher_enable,4, 32'h00000001, resp);


                $display( "checking the debug register" );
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data( debug,4, 32'h55555555, resp);
							  read_check( .address( debug ), .expected( 32'hAAAAAAAA ) );
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data( debug,4, 32'h69696969, resp);
							  read_check( .address( debug ), .expected( 32'h96969696 ) );
                $display( "checking register LED_control" );
								for( int value=0; value<4; value++ )
                    begin
                    top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data( LED_control,4, value, resp);
							      read_check( .address( LED_control ), .expected( value ) );
                    end

							  read_check( .address( lane_up_toggle_count_4 ),     .expected( 32'h00000001 ) );
							  read_check( .address( gt_pll_lock_toggle_count_4 ), .expected( 32'h00000001 ) );
							  read_check( .address( channel_up_toggle_count_4 ),  .expected( 32'h00000001 ) );
							  read_check( .address( lane_up_toggle_count_5 ),     .expected( 32'h00000001 ) );
							  read_check( .address( gt_pll_lock_toggle_count_5 ), .expected( 32'h00000001 ) );
							  read_check( .address( channel_up_toggle_count_5 ),  .expected( 32'h00000001 ) );
							  read_check( .address( lane_up_toggle_count_6 ),     .expected( 32'h00000001 ) );
							  read_check( .address( gt_pll_lock_toggle_count_6 ), .expected( 32'h00000001 ) );
							  read_check( .address( channel_up_toggle_count_6 ),  .expected( 32'h00000001 ) );
							  read_check( .address( lane_up_toggle_count_7 ),     .expected( 32'h00000001 ) );
							  read_check( .address( gt_pll_lock_toggle_count_7 ), .expected( 32'h00000001 ) );
							  read_check( .address( channel_up_toggle_count_7 ),  .expected( 32'h00000001 ) );

								#60000

                $display( "invoking reset and pma_init" );
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data( aurora_reset_pb,4, 32'h00000001, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data( aurora_pma_init,4, 32'h00000001, resp);

								#550000

                $display( "checking the status of the four Aurora links" );
							  read_check( .address( aurora_status_4 ), .expected( 32'h00000013 ) );
							  read_check( .address( aurora_status_5 ), .expected( 32'h00000013 ) );
							  read_check( .address( aurora_status_6 ), .expected( 32'h00000013 ) );
							  read_check( .address( aurora_status_7 ), .expected( 32'h00000013 ) );

							  read_check( .address( lane_up_toggle_count_4 ),     .expected( 32'h00000000 ) );
							  read_check( .address( gt_pll_lock_toggle_count_4 ), .expected( 32'h00000000 ) );
							  read_check( .address( channel_up_toggle_count_4 ),  .expected( 32'h00000000 ) );
							  read_check( .address( lane_up_toggle_count_5 ),     .expected( 32'h00000000 ) );
							  read_check( .address( gt_pll_lock_toggle_count_5 ), .expected( 32'h00000000 ) );
							  read_check( .address( channel_up_toggle_count_5 ),  .expected( 32'h00000000 ) );
							  read_check( .address( lane_up_toggle_count_6 ),     .expected( 32'h00000000 ) );
							  read_check( .address( gt_pll_lock_toggle_count_6 ), .expected( 32'h00000000 ) );
							  read_check( .address( channel_up_toggle_count_6 ),  .expected( 32'h00000000 ) );
							  read_check( .address( lane_up_toggle_count_7 ),     .expected( 32'h00000000 ) );
							  read_check( .address( gt_pll_lock_toggle_count_7 ), .expected( 32'h00000000 ) );
							  read_check( .address( channel_up_toggle_count_7 ),  .expected( 32'h00000000 ) );

								#10000

							  $display( "simulation finished with %0d errors", error_count );

$stop;


                // Note: the AXI transactions below are described in Xilix DS40.

                // Do a reset using the Zynq Verification IP
                #5000 $display( "%0t enabling reset", $time );
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.fpga_soft_reset(32'h1);
                #5000 $display( "%0t disabling soft reset", $time );
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.fpga_soft_reset(32'h0);

                // Toggle the 4 LEDs on the KRC3701
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200000,4, 32'h00000001, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200000,4, 32'h00000002, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200000,4, 32'h00000004, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200000,4, 32'h00000008, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200000,4, 32'h00000009, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200000,4, 32'h0000000A, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200000,4, 32'h0000000C, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200000,4, 32'h0000000D, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200000,4, 32'h0000000E, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200000,4, 32'h0000000F, resp);

                // Toggle the 8 LEDs on the KR_LAN_A1
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h00000000, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h00000001, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h00000002, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h00000004, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h00000008, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h00000010, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h00000020, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h00000040, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h00000080, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h00000001, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h00000003, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h00000007, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h0000000F, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h0000001F, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h0000003F, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h0000007F, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'h41200008,4, 32'h0000007F, resp);


                // Turn on KITT.
                #2500    top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data( 32'h43c00014,4, 32'h00000001, resp );
                // Turn off KITT.
                #1000000 top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data( 32'h43c00014,4, 32'h00000000, resp );

                // Turn on CLK_SEL to the HighTech Global Card
                #5000 top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data( 32'h41200000,4, 32'h00000001, resp );
                // Turn off CLK_SEL to the HighTech Global Card
                #5000 top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data( 32'h41200000,4, 32'h00000000, resp );

                // Re-reset the Ethernet (and USB hub because they are connected).
               #1000  top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data( 32'h43c00018,4, 32'h00000001, resp );
               #1000  top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data( 32'h43c00018,4, 32'h00000000, resp );




               // Try reading from MDIO physical address 0 (which should access the GMII to RGMII Core-Specific Control Register (PG160 Figure 2-8).
               // The Logic address of said register should be 0x10 (plus module base address).
//               #1000  top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.read_data( 32'he000c010,4, poll, resp );
//               $display( "Read data 0x%8h from address 0x%8h", poll,  32'he000c010 );




/*
I suspect none of this is supported by the Verification IP!
                 // Unlock registers 0xF800_0000 to 0xF800_0B74 by writing the correct key.
                 top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'hF8000004,4, 32'h0000767B, resp);

                 // Set bit APER_CLK_CTRL.I2C0_CPU_1XCLKACT
                 top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'hF800012C,4, 32'h00040000, resp);

                // write to the PS GPIO Controller in an attempt to reset the I2C Controller.
                #500 $display( "%0t attempting to reset the I2C Controller", $time );
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'hE000_A000,4, 32'hFFFFFFFF, resp);
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'hE000_A000,4, 32'h0000000F, resp);

                // Try to get something out of I2C Controllers 0 inside the PS
                top_tb.i_top.i_dgrm_wrapper.dgrm_i.processing_system7_0.inst.write_data(32'hE000_4000,4, 32'h0000000F, resp);
*/


//		        #50000000 ->stopClocks;

                $display( "Simulation Done" );

		        #50 $finish;

                end


end endgenerate


/*
// For gate-level simulations, we cannot use hierarchical references.
// Since the PS7 doesn't appear to simulate in gates, there is mot much
// more that can be done than to watch the clocks. So don't run for long.
generate if( RTL != 1 ) begin

initial begin : main

                $display( "Test bench running in GATE-LEVEL mode." );

                #1000 ->startClocks;

		        #25000000 ->stopClocks;

                $display( "Simulation Done" );

		        #50 $finish;

                end

end endgenerate
*/



    // Pull up the I2C lines
    pullup( IF.X2_1_308 ); // [8] );  // SCL
    pullup( IF.X2_1_309 ); // [9] );  // SDA

    // Pull  up the MDIO data line
    pullup( IF.X2_1_008  );  // MDIO_PHY_0_mdio_io



    top i_top(
	     // I/O Groups
	     /*
		.X1_1      ( IF.X1_1    ),
		.X1_2      ( IF.X1_2    ),
		.X2_1      ( IF.X2_1    ),
		.X2_2      ( IF.X2_2    ),
		*/

		.LED       ( IF.LED     ),

	    .X1_1_311    ( IF.X1_1_311 ),
	    .X1_1_310    ( IF.X1_1_310 ),
	    .X1_1_309    ( IF.X1_1_309  ),
	    .X1_1_308    ( IF.X1_1_308  ),
	    .X1_1_307    ( IF.X1_1_307  ),
	    .X1_1_306    ( IF.X1_1_306  ),
	    .X1_1_305    ( IF.X1_1_305  ),
	    .X1_1_304    ( IF.X1_1_304  ),
	    .X1_1_303    ( IF.X1_1_303  ),
	    .X1_1_302    ( IF.X1_1_302  ),
	    .X1_1_301    ( IF.X1_1_301  ),
	    .X1_1_300    ( IF.X1_1_300  ),
	    .X1_1_211    ( IF.X1_1_211 ),
	    .X1_1_210    ( IF.X1_1_210 ),
	    .X1_1_209    ( IF.X1_1_209  ),
	    .X1_1_208    ( IF.X1_1_208  ),
	    .X1_1_207    ( IF.X1_1_207  ),
	    .X1_1_206    ( IF.X1_1_206  ),
	    .X1_1_205    ( IF.X1_1_205  ),
	    .X1_1_204    ( IF.X1_1_204  ),
	    .X1_1_203    ( IF.X1_1_203  ),
	    .X1_1_202    ( IF.X1_1_202  ),
	    .X1_1_201    ( IF.X1_1_201  ),
	    .X1_1_200    ( IF.X1_1_200  ),
	    .X1_1_111    ( IF.X1_1_111 ),
	    .X1_1_110    ( IF.X1_1_110 ),
	    .X1_1_109    ( IF.X1_1_109  ),
	    .X1_1_108    ( IF.X1_1_108  ),
	    .X1_1_107    ( IF.X1_1_107  ),
	    .X1_1_106    ( IF.X1_1_106  ),
	    .X1_1_105    ( IF.X1_1_105  ),
	    .X1_1_104    ( IF.X1_1_104  ),
	    .X1_1_103    ( IF.X1_1_103  ),
	    .X1_1_102    ( IF.X1_1_102  ),
	    .X1_1_101    ( IF.X1_1_101  ),
	    .X1_1_100    ( IF.X1_1_100  ),
	    .X1_1_011    ( IF.X1_1_011 ),
	    .X1_1_010    ( IF.X1_1_010 ),
	    .X1_1_009    ( IF.X1_1_009  ),
	    .X1_1_008    ( IF.X1_1_008  ),
	    .X1_1_007    ( IF.X1_1_007  ),
	    .X1_1_006    ( IF.X1_1_006  ),
	    .X1_1_005    ( IF.X1_1_005  ),
	    .X1_1_004    ( IF.X1_1_004  ),
	    .X1_1_003    ( IF.X1_1_003  ),
	    .X1_1_002    ( IF.X1_1_002  ),
	    .X1_1_001    ( IF.X1_1_001  ),
	    .X1_1_000    ( IF.X1_1_000  ),

	    .X1_2_311    ( IF.X1_2_311 ),
	    .X1_2_310    ( IF.X1_2_310 ),
	    .X1_2_309    ( IF.X1_2_309  ),
	    .X1_2_308    ( IF.X1_2_308  ),
	    .X1_2_307    ( IF.X1_2_307  ),
	    .X1_2_306    ( IF.X1_2_306  ),
	    .X1_2_305    ( IF.X1_2_305  ),
	    .X1_2_304    ( IF.X1_2_304  ),
	    .X1_2_303    ( IF.X1_2_303  ),
	    .X1_2_302    ( IF.X1_2_302  ),
	    .X1_2_301    ( IF.X1_2_301  ),
	    .X1_2_300    ( IF.X1_2_300  ),
	    .X1_2_211    ( IF.X1_2_211 ),
	    .X1_2_210    ( IF.X1_2_210 ),
	    .X1_2_209    ( IF.X1_2_209  ),
	    .X1_2_208    ( IF.X1_2_208  ),
	    .X1_2_207    ( IF.X1_2_207  ),
	    .X1_2_206    ( IF.X1_2_206  ),
	    .X1_2_205    ( IF.X1_2_205  ),
	    .X1_2_204    ( IF.X1_2_204  ),
	    .X1_2_203    ( IF.X1_2_203  ),
	    .X1_2_202    ( IF.X1_2_202  ),
	    .X1_2_201    ( IF.X1_2_201  ),
	    .X1_2_200    ( IF.X1_2_200  ),
	    .X1_2_111    ( IF.X1_2_111 ),
	    .X1_2_110    ( IF.X1_2_110 ),
	    .X1_2_109    ( IF.X1_2_109  ),
	    .X1_2_108    ( IF.X1_2_108  ),
	    .X1_2_107    ( IF.X1_2_107  ),
	    .X1_2_106    ( IF.X1_2_106  ),
	    .X1_2_105    ( IF.X1_2_105  ),
	    .X1_2_104    ( IF.X1_2_104  ),
	    .X1_2_103    ( IF.X1_2_103  ),
	    .X1_2_102    ( IF.X1_2_102  ),
	    .X1_2_101    ( IF.X1_2_101  ),
	    .X1_2_100    ( IF.X1_2_100  ),
	    .X1_2_011    ( IF.X1_2_011 ),
	    .X1_2_010    ( IF.X1_2_010 ),
	    .X1_2_009    ( IF.X1_2_009  ),
	    .X1_2_008    ( IF.X1_2_008  ),
	    .X1_2_007    ( IF.X1_2_007  ),
	    .X1_2_006    ( IF.X1_2_006  ),
	    .X1_2_005    ( IF.X1_2_005  ),
	    .X1_2_004    ( IF.X1_2_004  ),
	    .X1_2_003    ( IF.X1_2_003  ),
	    .X1_2_002    ( IF.X1_2_002  ),
	    .X1_2_001    ( IF.X1_2_001  ),
	    .X1_2_000    ( IF.X1_2_000  ),

	    .X2_1_311    ( IF.X2_1_311 ),
	    .X2_1_310    ( IF.X2_1_310 ),
	    .X2_1_309    ( IF.X2_1_309  ),
	    .X2_1_308    ( IF.X2_1_308  ),
	    .X2_1_307    ( IF.X2_1_307  ),
	    .X2_1_306    ( IF.X2_1_306  ),
	    .X2_1_305    ( IF.X2_1_305  ),
	    .X2_1_304    ( IF.X2_1_304  ),
	    .X2_1_303    ( IF.X2_1_303  ),
	    .X2_1_302    ( IF.X2_1_302  ),
	    .X2_1_301    ( IF.X2_1_301  ),
	    .X2_1_300    ( IF.X2_1_300  ),
	    .X2_1_211    ( IF.X2_1_211 ),
	    .X2_1_210    ( IF.X2_1_210 ),
	    .X2_1_209    ( IF.X2_1_209  ),
	    .X2_1_208    ( IF.X2_1_208  ),
	    .X2_1_207    ( IF.X2_1_207  ),
	    .X2_1_206    ( IF.X2_1_206  ),
	    .X2_1_205    ( IF.X2_1_205  ),
	    .X2_1_204    ( IF.X2_1_204  ),
	    .X2_1_203    ( IF.X2_1_203  ),
	    .X2_1_202    ( IF.X2_1_202  ),
	    .X2_1_201    ( IF.X2_1_201  ),
	    .X2_1_200    ( IF.X2_1_200  ),
	    .X2_1_111    ( IF.X2_1_111 ),
	    .X2_1_110    ( IF.X2_1_110 ),
	    .X2_1_109    ( IF.X2_1_109  ),
	    .X2_1_108    ( IF.X2_1_108  ),
	    .X2_1_107    ( IF.X2_1_107  ),
	    .X2_1_106    ( IF.X2_1_106  ),
	    .X2_1_105    ( IF.X2_1_105  ),
	    .X2_1_104    ( IF.X2_1_104  ),
	    .X2_1_103    ( IF.X2_1_103  ),
	    .X2_1_102    ( IF.X2_1_102  ),
	    .X2_1_101    ( IF.X2_1_101  ),
	    .X2_1_100    ( IF.X2_1_100  ),
	    .X2_1_011    ( IF.X2_1_011 ),
	    .X2_1_010    ( IF.X2_1_010 ),
	    .X2_1_009    ( IF.X2_1_009  ),
	    .X2_1_008    ( IF.X2_1_008  ),
	    .X2_1_007    ( IF.X2_1_007  ),
	    .X2_1_006    ( IF.X2_1_006  ),
	    .X2_1_005    ( IF.X2_1_005  ),
	    .X2_1_004    ( IF.X2_1_004  ),
	    .X2_1_003    ( IF.X2_1_003  ),
	    .X2_1_002    ( IF.X2_1_002  ),
	    .X2_1_001    ( IF.X2_1_001  ),
	    .X2_1_000    ( IF.X2_1_000  ),

	    .X2_2_311    ( IF.X2_2_311 ),
	    .X2_2_310    ( IF.X2_2_310 ),
	    .X2_2_309    ( IF.X2_2_309  ),
	    .X2_2_308    ( IF.X2_2_308  ),
	    .X2_2_307    ( IF.X2_2_307  ),
	    .X2_2_306    ( IF.X2_2_306  ),
	    .X2_2_305    ( IF.X2_2_305  ),
	    .X2_2_304    ( IF.X2_2_304  ),
	    .X2_2_303    ( IF.X2_2_303  ),
	    .X2_2_302    ( IF.X2_2_302  ),
	    .X2_2_301    ( IF.X2_2_301  ),
	    .X2_2_300    ( IF.X2_2_300  ),
	    .X2_2_211    ( IF.X2_2_211 ),
	    .X2_2_210    ( IF.X2_2_210 ),
	    .X2_2_209    ( IF.X2_2_209  ),
	    .X2_2_208    ( IF.X2_2_208  ),
	    .X2_2_207    ( IF.X2_2_207  ),
	    .X2_2_206    ( IF.X2_2_206  ),
	    .X2_2_205    ( IF.X2_2_205  ),
	    .X2_2_204    ( IF.X2_2_204  ),
	    .X2_2_203    ( IF.X2_2_203  ),
	    .X2_2_202    ( IF.X2_2_202  ),
	    .X2_2_201    ( IF.X2_2_201  ),
	    .X2_2_200    ( IF.X2_2_200  ),
	    .X2_2_111    ( IF.X2_2_111 ),
	    .X2_2_110    ( IF.X2_2_110 ),
	    .X2_2_109    ( IF.X2_2_109  ),
	    .X2_2_108    ( IF.X2_2_108  ),
	    .X2_2_107    ( IF.X2_2_107  ),
	    .X2_2_106    ( IF.X2_2_106  ),
	    .X2_2_105    ( IF.X2_2_105  ),
	    .X2_2_104    ( IF.X2_2_104  ),
	    .X2_2_103    ( IF.X2_2_103  ),
	    .X2_2_102    ( IF.X2_2_102  ),
	    .X2_2_101    ( IF.X2_2_101  ),
	    .X2_2_100    ( IF.X2_2_100  ),
	    .X2_2_011    ( IF.X2_2_011 ),
	    .X2_2_010    ( IF.X2_2_010 ),
	    .X2_2_009    ( IF.X2_2_009  ),
	    .X2_2_008    ( IF.X2_2_008  ),
	    .X2_2_007    ( IF.X2_2_007  ),
	    .X2_2_006    ( IF.X2_2_006  ),
	    .X2_2_005    ( IF.X2_2_005  ),
	    .X2_2_004    ( IF.X2_2_004  ),
	    .X2_2_003    ( IF.X2_2_003  ),
	    .X2_2_002    ( IF.X2_2_002  ),
	    .X2_2_001    ( IF.X2_2_001  ),
	    .X2_2_000    ( IF.X2_2_000  ),



//		.X1_MGT1   ( IF.X1_MGT1 ),
         .X1_MGT_TX_04_P  (   IF.X1_MGT_TX_04_P   ),
         .X1_MGT_TX_04_N  (   IF.X1_MGT_TX_04_N   ),
         .X1_MGT_RX_04_P  (   IF.X1_MGT_RX_04_P   ),
         .X1_MGT_RX_04_N  (   IF.X1_MGT_RX_04_N   ),
         .X1_MGT_TX_05_P  (   IF.X1_MGT_TX_05_P   ),
         .X1_MGT_TX_05_N  (   IF.X1_MGT_TX_05_N   ),
         .X1_MGT_RX_05_P  (   IF.X1_MGT_RX_05_P   ),
         .X1_MGT_RX_05_N  (   IF.X1_MGT_RX_05_N   ),
         .X1_MGT_TX_06_P  (   IF.X1_MGT_TX_06_P   ),
         .X1_MGT_TX_06_N  (   IF.X1_MGT_TX_06_N   ),
         .X1_MGT_RX_06_P  (   IF.X1_MGT_RX_06_P   ),
         .X1_MGT_RX_06_N  (   IF.X1_MGT_RX_06_N   ),
         .X1_MGT_TX_07_P  (   IF.X1_MGT_TX_07_P   ),
         .X1_MGT_TX_07_N  (   IF.X1_MGT_TX_07_N   ),
         .X1_MGT_RX_07_P  (   IF.X1_MGT_RX_07_P   ),
         .X1_MGT_RX_07_N  (   IF.X1_MGT_RX_07_N   ),
         .X1_MGT_CLK_1_P  (   IF.X1_MGT_CLK_1_P   ),
         .X1_MGT_CLK_1_N  (   IF.X1_MGT_CLK_1_N   ),

	     // PS DDR Connections
		.DDR_addr       ( IF.DDR_addr    ),
		.DDR_ba         ( IF.DDR_ba      ),
		.DDR_cas_n      ( IF.DDR_cas_n   ),
		.DDR_ck_n       ( IF.DDR_ck_n    ),
		.DDR_ck_p       ( IF.DDR_ck_p    ),
		.DDR_cke        ( IF.DDR_cke     ),
		.DDR_cs_n       ( IF.DDR_cs_n    ),
		.DDR_dm         ( IF.DDR_dm      ),
		.DDR_dq         ( IF.DDR_dq      ),
		.DDR_dqs_n      ( IF.DDR_dqs_n   ),
		.DDR_dqs_p      ( IF.DDR_dqs_p   ),
		.DDR_odt        ( IF.DDR_odt     ),
		.DDR_ras_n      ( IF.DDR_ras_n   ),
		.DDR_reset_n    ( IF.DDR_reset_n ),
		.DDR_we_n       ( IF.DDR_we_n    ),

	     // PS FIXED Connections
		.FIXED_IO_ddr_vrn    ( IF.FIXED_IO_ddr_vrn  ),
		.FIXED_IO_ddr_vrp    ( IF.FIXED_IO_ddr_vrp  ),
		.FIXED_IO_mio        ( IF.FIXED_IO_mio      ),
		.FIXED_IO_ps_clk     ( IF.FIXED_IO_ps_clk   ),
		.FIXED_IO_ps_porb    ( IF.FIXED_IO_ps_porb  ),
		.FIXED_IO_ps_srstb   ( IF.FIXED_IO_ps_srstb )
    );




/*
always
    begin
    IF.s_FIXED_IO_ps_clk    = 1'b0;
    IF.s_FIXED_IO_ps_srstb  = 1'b1;

    #0 @startClocks

    fork : clocks
        @stopClocks disable clocks;

        forever #( IF.T_CLK/2) IF.s_FIXED_IO_ps_clk <= ~IF.s_FIXED_IO_ps_clk;

        begin
        #1   IF.s_FIXED_IO_ps_srstb  = 1'b0;
        #100 IF.s_FIXED_IO_ps_srstb  = 1'b1;
        end
    join : clocks

    end
*/




// Generate the 156.25 MGT reference clock.
always
    begin : MGT_clock
    IF.X1_MGT_CLK_1_P  = 1'b1;
    IF.X1_MGT_CLK_1_N  = 1'b0;

    IF.X1_2_110  = 1'b1;
    IF.X1_2_111  = 1'b0;

    #0 @startClocks

    fork : clocks
        @stopClocks disable clocks;

        forever #( IF.T_MGT/2)
            if(  ~IF.X1_2_102 )  // HiTech Global clock enable pin
                begin
                IF.X1_MGT_CLK_1_P = ~IF.X1_MGT_CLK_1_P;
                IF.X1_MGT_CLK_1_N = ~IF.X1_MGT_CLK_1_N;
                end

         forever #( IF.T_MGT/2)
            begin
            IF.X1_2_110 = ~IF.X1_2_110;
            IF.X1_2_111 = ~IF.X1_2_111;
            end

    join : clocks

    end


// And loop back the four Aurora Channels, 4 to 5 and 6 to 7.

assign IF.X1_MGT_RX_04_P = IF.X1_MGT_TX_05_P;
assign IF.X1_MGT_RX_04_N = IF.X1_MGT_TX_05_N;

assign IF.X1_MGT_RX_05_P = IF.X1_MGT_TX_04_P;
assign IF.X1_MGT_RX_05_N = IF.X1_MGT_TX_04_N;

assign IF.X1_MGT_RX_06_P = IF.X1_MGT_TX_07_P;
assign IF.X1_MGT_RX_06_N = IF.X1_MGT_TX_07_N;

assign IF.X1_MGT_RX_07_P = IF.X1_MGT_TX_06_P;
assign IF.X1_MGT_RX_07_N = IF.X1_MGT_TX_06_N;



// Instantiate the example design TB so that I can use half of it to communicate with the example design inside the DUT.
/*  NOT USED ANYMORE
Aurora_BFM BFM(
      .rxp_1 ( IF.X1_MGT_TX_04_P ),
      .rxn_1 ( IF.X1_MGT_TX_04_N ),

      .txp_1 ( IF.X1_MGT_RX_04_P ),
      .txn_1 ( IF.X1_MGT_RX_04_N )
);
*/
endmodule
