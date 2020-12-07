-- Copyright Ian.Lang@outlook.at


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity general_v1_0 is
  generic (
    -- Users to add parameters here
    c_VERSION : std_logic_vector(31 downto 0) := x"5CAFF01D";
    -- User parameters ends
    -- Do not modify the parameters beyond this line

    -- Parameters of Axi Slave Bus Interface S00_AXI
    C_S00_AXI_DATA_WIDTH  : integer  := 32;
    C_S00_AXI_ADDR_WIDTH  : integer  := 8
  );
  port (
    -- Users to add ports here
    aurora_pma_init:       out std_logic;
    aurora_reset_pb:       out std_logic;
    HiTech_Global_clk_sel: out std_logic;
    aurora_status_4:       in  std_logic_vector(4 downto 0);
    aurora_status_5:       in  std_logic_vector(4 downto 0);
    aurora_status_6:       in  std_logic_vector(4 downto 0);
    aurora_status_7:       in  std_logic_vector(4 downto 0);
    LED_control:           out std_logic_vector(1 downto 0);
    usb_reset:             out std_logic;
    soft_interrupt:        out std_logic;
    aurora_power_down:     out std_logic;
    aurora_loopback:       out std_logic_vector(2 downto 0);
    flasher_enable:        out std_logic;
    MIG_reset_N:           out std_logic;

    -- User ports ends
    -- Do not modify the ports beyond this line


    -- Ports of Axi Slave Bus Interface S00_AXI
    s00_axi_aclk  : in std_logic;
    s00_axi_aresetn  : in std_logic;
    s00_axi_awaddr  : in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
    s00_axi_awprot  : in std_logic_vector(2 downto 0);
    s00_axi_awvalid  : in std_logic;
    s00_axi_awready  : out std_logic;
    s00_axi_wdata  : in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
    s00_axi_wstrb  : in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
    s00_axi_wvalid  : in std_logic;
    s00_axi_wready  : out std_logic;
    s00_axi_bresp  : out std_logic_vector(1 downto 0);
    s00_axi_bvalid  : out std_logic;
    s00_axi_bready  : in std_logic;
    s00_axi_araddr  : in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
    s00_axi_arprot  : in std_logic_vector(2 downto 0);
    s00_axi_arvalid  : in std_logic;
    s00_axi_arready  : out std_logic;
    s00_axi_rdata  : out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
    s00_axi_rresp  : out std_logic_vector(1 downto 0);
    s00_axi_rvalid  : out std_logic;
    s00_axi_rready  : in std_logic
  );
end general_v1_0;


architecture arch_imp of general_v1_0 is

  type t_rd is ( IDLE, RESPOND, WAITACK );
  type t_wr is ( IDLE, DO, RESP );

  type t_axi is record

      rd      : t_rd;
      wr      : t_wr;
      araddr  : std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
      awaddr  : std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);

      -- AXI
      axi_awready :  std_logic;
      axi_wready  :  std_logic;
      axi_bresp   :  std_logic_vector(1 downto 0);
      axi_bvalid  :  std_logic;
      axi_arready :  std_logic;
      axi_rdata   :  std_logic_vector(C_S00_AXI_DATA_WIDTH-1  downto 0);
      axi_rresp   :  std_logic_vector(1 downto 0);
      axi_rvalid  :  std_logic;

  end record;


  CONSTANT r_axi : t_axi := (
     IDLE,
     IDLE,
      (others=>'0'),
     (others=>'0'),
     '0',
     '0',
     (others=>'0'),
     '0',
     '0',
     (others=>'0'),
     (others=>'0'),
     '0'
     );

  signal p_axi : t_axi := r_axi;

  constant gt_pll_lock : integer := 4;  -- These constants are not properly tied to their counterpart in top_struct.v.
  constant soft_err0 :    integer := 3;
  constant hard_err0 :    integer := 2;
  constant lane_up :     integer := 1;
  constant channel_up :  integer := 0;

  type t_aurora_status_4 is array (4 to 7) of std_logic_vector(4 downto 0);

  type t_aurora_status_4_retimed is array (1 to 2) of t_aurora_status_4;

  constant r_aurora_status_4_retimed : t_aurora_status_4_retimed := (others=>(others=>(others=>'0')));

  type t_aurora_status_toggle_count is record
     channel_up     : std_logic_vector(15 downto 0);
     lane_up        : std_logic_vector(15 downto 0);
     gt_pll_lock    : std_logic_vector(15 downto 0);
  end record;

 constant r_aurora_status_toggle_count : t_aurora_status_toggle_count := (
    ( others=>'0' ),
    ( others=>'0' ),
    ( others=>'0' )
 );

  type t_aurora_status_toggle_count_4 is array (4 to 7) of t_aurora_status_toggle_count;

  constant r_aurora_status_toggle_count_4 : t_aurora_status_toggle_count_4 := ( others=>r_aurora_status_toggle_count );

  type t_registers is record
      debug                         : std_logic_vector(31 downto 0);
      aurora_reset_pb               : std_logic_vector(0  downto 0);
      aurora_pma_init               : std_logic_vector(0  downto 0);
      HiTech_Global_clk_sel         : std_logic_vector(0  downto 0);
      aurora_status                 : t_aurora_status_4;
--      aurora_status_4               : std_logic_vector(4 downto 0);
--      aurora_status_5               : std_logic_vector(4 downto 0);
--      aurora_status_6               : std_logic_vector(4 downto 0);
--      aurora_status_7               : std_logic_vector(4 downto 0);
      LED_control                   : std_logic_vector(1 downto 0);
      usb_reset                     : std_logic_vector(0  downto 0);
      soft_interrupt                : std_logic_vector(0  downto 0);
      aurora_status_toggle_count    : t_aurora_status_toggle_count_4;
    aurora_power_down:         std_logic_vector(0 downto 0);
    aurora_loopback:           std_logic_vector(2 downto 0);
    flasher_enable:            std_logic_vector(0 downto 0);
    MIG_reset:                 std_logic_vector(0 downto 0);
  end record;

  CONSTANT r_registers : t_registers := (
   c_VERSION,
   std_logic_vector'( 0=>'1' ),                            -- produce a pulse after reset and again whenever the bit is written
   std_logic_vector'( 0=>'1' ),                            -- as above
   std_logic_vector'( 0=>'0' ),                            -- '0', the clock is enabled
   ( others => (others=>'0') ),
--   std_logic_vector'( "--------------------------------" ), -- I don't particularly need to reset these flip-flops as they will follow aurora_status_4 after the first clock cycle.
--   std_logic_vector'( "--------------------------------" ),
--   std_logic_vector'( "--------------------------------" ),
--   std_logic_vector'( "--------------------------------" ),
   std_logic_vector'( "11" ),
   std_logic_vector'( 0=>'1' ),
   std_logic_vector'( 0=>'1' ),
   r_aurora_status_toggle_count_4,
   std_logic_vector'( "0" ),
   std_logic_vector'( "000" ),
   std_logic_vector'( "0" ),
   std_logic_vector'( "1" )
   );


--  signal     aurora_status_retimed : t_aurora_status_4_retimed;  -- I've made this a signal, merely so that I can put an attribute on it.  But for some unknown reason, it won't synthesise!
--  attribute ASYNC_REG : string;
--  attribute ASYNC_REG of aurora_status_retimed: signal is "TRUE";

  pure function "xor"  ( l : std_logic; r : std_logic ) return boolean is
    begin
    if (l='1' and r='0') or (l='0' and r='1')  then
        return true;
    else
        return false;
    end if;
  end function;

begin

clocked_logic: process ( s00_axi_aclk, s00_axi_aresetn ) is

  variable n_axi  : t_axi;
  variable registers : t_registers;
  variable temp : std_logic_vector(7 downto 0);
  variable count : unsigned(7 downto 0);
  variable count2 : unsigned(7 downto 0);
  variable aurora_status_retimed : t_aurora_status_4_retimed;  -- I've made this a signal, merely so that I can put an attribute on it.


begin

if s00_axi_aresetn='0' then

     p_axi     <= r_axi;
     registers := r_registers;
     count     := (others=>'1');
     count2    := (others=>'1');

     aurora_status_retimed := r_aurora_status_4_retimed;

elsif rising_edge( s00_axi_aclk ) then

      n_axi  := p_axi;  -- next state = present state


      -- AXI read state machine
      case n_axi.rd is

          when IDLE => n_axi.axi_arready := '1';

               n_axi.axi_rvalid  := '0';
               if s00_axi_arvalid = '1' and p_axi.axi_arready  = '1' then
                   n_axi.araddr := s00_axi_araddr;
                   n_axi.axi_arready := '0';
                   n_axi.rd := RESPOND;
               end if;

          when RESPOND =>      temp := n_axi.araddr(n_axi.araddr'high downto 2) & "00";
                               n_axi.axi_rdata := (others=>'0');
                               case temp is

                                 when x"00"  => n_axi.axi_rdata(registers.debug'range)                   :=     registers.debug;  -- reads back bitwise inverted
                                 when x"04"  => n_axi.axi_rdata(registers.aurora_reset_pb'range)         :=     registers.aurora_reset_pb;
                                 when x"08"  => n_axi.axi_rdata(registers.aurora_pma_init'range)         :=     registers.aurora_pma_init;
                                 when x"0C"  => n_axi.axi_rdata(registers.HiTech_Global_clk_sel'range)   :=     registers.HiTech_Global_clk_sel;
                                 when x"10"  => n_axi.axi_rdata(registers.aurora_status(4)'range)        :=     registers.aurora_status(4);
                                 when x"14"  => n_axi.axi_rdata(registers.aurora_status(5)'range)        :=     registers.aurora_status(5);
                                 when x"18"  => n_axi.axi_rdata(registers.aurora_status(6)'range)        :=     registers.aurora_status(6);
                                 when x"1C"  => n_axi.axi_rdata(registers.aurora_status(7)'range)        :=     registers.aurora_status(7);
                                 when x"20"  => n_axi.axi_rdata(registers.LED_control'range)             :=     registers.LED_control;
                                 when x"24"  => n_axi.axi_rdata(registers.usb_reset'range)               :=     registers.usb_reset;
                                 when x"28"  => n_axi.axi_rdata(registers.soft_interrupt'range)          :=     registers.soft_interrupt;
                                 when x"2C"  => n_axi.axi_rdata(registers.aurora_power_down'range)       :=     registers.aurora_power_down;
                                 when x"30"  => n_axi.axi_rdata(registers.aurora_loopback'range)         :=     registers.aurora_loopback;
                                 when x"34"  => n_axi.axi_rdata(registers.flasher_enable'range)          :=     registers.flasher_enable;
                                 when x"38"  => n_axi.axi_rdata(registers.MIG_reset'range)               :=     registers.MIG_reset;


                                 when x"80" => n_axi.axi_rdata(15 downto 0) :=  registers.aurora_status_toggle_count(4).channel_up;
                                 when x"84" => n_axi.axi_rdata(15 downto 0) :=  registers.aurora_status_toggle_count(4).lane_up;
                                 when x"88" => n_axi.axi_rdata(15 downto 0) :=  registers.aurora_status_toggle_count(4).gt_pll_lock;
                                 when x"90" => n_axi.axi_rdata(15 downto 0) :=  registers.aurora_status_toggle_count(5).channel_up;
                                 when x"94" => n_axi.axi_rdata(15 downto 0) :=  registers.aurora_status_toggle_count(5).lane_up;
                                 when x"98" => n_axi.axi_rdata(15 downto 0) :=  registers.aurora_status_toggle_count(5).gt_pll_lock;
                                 when x"A0" => n_axi.axi_rdata(15 downto 0) :=  registers.aurora_status_toggle_count(6).channel_up;
                                 when x"A4" => n_axi.axi_rdata(15 downto 0) :=  registers.aurora_status_toggle_count(6).lane_up;
                                 when x"A8" => n_axi.axi_rdata(15 downto 0) :=  registers.aurora_status_toggle_count(6).gt_pll_lock;
                                 when x"B0" => n_axi.axi_rdata(15 downto 0) :=  registers.aurora_status_toggle_count(7).channel_up;
                                 when x"B4" => n_axi.axi_rdata(15 downto 0) :=  registers.aurora_status_toggle_count(7).lane_up;
                                 when x"B8" => n_axi.axi_rdata(15 downto 0) :=  registers.aurora_status_toggle_count(7).gt_pll_lock;

                                 when others =>

                               end case;

                               n_axi.axi_rvalid  := '1';
                               n_axi.axi_rresp   := "00";
                               n_axi.rd :=  WAITACK;


           when WAITACK  =>    if p_axi.axi_rvalid = '1' and s00_axi_rready = '1'  then  -- valid and ready both active at the same time - the key to implementing AXI
                               n_axi.axi_rvalid  := '0';
                               n_axi.rd := IDLE;
                               end if;
end case;


  -- AXI write state machine
  case n_axi.wr is

    when IDLE => n_axi.axi_awready  := '1';
                 n_axi.axi_wready   := '0';
                 if s00_axi_awvalid = '1' and p_axi.axi_awready  = '1' then

                     n_axi.awaddr := s00_axi_awaddr;
                     n_axi.axi_awready := '0';
                     n_axi.axi_wready  := '1';

                     n_axi.wr := DO;
                 end if;

    when DO =>   if ( s00_axi_wvalid = '1' and p_axi.axi_wready  = '1' ) then  -- valid and ready both active at the same time - the key to implementing AXI
                             temp := n_axi.awaddr(n_axi.awaddr'high downto 2) & "00";

                             case temp is

                                   when x"00" => if s00_axi_wstrb(3) = '1' then
                                                     registers.debug(31 downto 24)  :=  not s00_axi_wdata(31 downto 24);
                                                 end if;
                                                 if s00_axi_wstrb(2) = '1' then
                                                     registers.debug(23 downto 16)  :=  not s00_axi_wdata(23 downto 16);
                                                 end if;
                                                 if s00_axi_wstrb(1) = '1' then
                                                     registers.debug(15 downto 8)   :=  not s00_axi_wdata(15 downto 8);
                                                 end if;
                                                 if s00_axi_wstrb(0) = '1' then
                                                     registers.debug(7 downto 0)    :=  not s00_axi_wdata(7 downto 0);
                                                 end if;
                                   when x"04"  => if s00_axi_wstrb(0) = '1' then
                                                     registers.aurora_reset_pb        :=   s00_axi_wdata(registers.aurora_reset_pb'range);  -- write a '1' to reset Aurora
                                                  end if;
                                   when x"08"  => if s00_axi_wstrb(0) = '1' then
                                                     registers.aurora_pma_init        :=   s00_axi_wdata(registers.aurora_pma_init'range);
                                                  end if;
                                   when x"0C"  => if s00_axi_wstrb(0) = '1' then
                                                     registers.HiTech_Global_clk_sel  :=   s00_axi_wdata(registers.HiTech_Global_clk_sel'range);
                                                  end if;
                                   when x"10"  => -- read only
                                   when x"14"  => -- read only
                                   when x"18"  => -- read only
                                   when x"1C"  => -- read only
                                   when x"20"  => if s00_axi_wstrb(0) = '1' then
                                                     registers.LED_control            :=   s00_axi_wdata(registers.LED_control'range);
                                                  end if;
                                   when x"24"  => if s00_axi_wstrb(0) = '1' then
                                                     registers.usb_reset              :=   s00_axi_wdata(registers.usb_reset'range);
                                                  end if;
                                   when x"28"  => if s00_axi_wstrb(0) = '1' then
                                                     registers.soft_interrupt         :=   s00_axi_wdata(registers.soft_interrupt'range);
                                                  end if;
                                   when x"2C"  => if s00_axi_wstrb(0) = '1' then
                                                     registers.aurora_power_down       :=   s00_axi_wdata(registers.aurora_power_down'range);
                                                  end if;
                                   when x"30"  => if s00_axi_wstrb(0) = '1' then
                                                      registers.aurora_loopback         :=   s00_axi_wdata(registers.aurora_loopback'range);
                                                   end if;
                                   when x"34"  => if s00_axi_wstrb(0) = '1' then
                                                      registers.flasher_enable          :=   s00_axi_wdata(registers.flasher_enable'range);
                                                   end if;
                                   when x"38"  => if s00_axi_wstrb(0) = '1' then
                                                      registers.MIG_reset          :=   s00_axi_wdata(registers.MIG_reset'range);
                                                   end if;


                                   when x"80" => if s00_axi_wstrb(1) = '1' then
                                                      registers.aurora_status_toggle_count(4).channel_up(15 downto 8) :=  s00_axi_wdata(15 downto 8);
                                                 end if;
                                                 if s00_axi_wstrb(0) = '1' then
                                                      registers.aurora_status_toggle_count(4).channel_up(7 downto 0)  :=  s00_axi_wdata(7 downto 0);
                                                 end if;
                                   when x"84" => if s00_axi_wstrb(1) = '1' then
                                                      registers.aurora_status_toggle_count(4).lane_up(15 downto 8) :=  s00_axi_wdata(15 downto 8);
                                                 end if;
                                                 if s00_axi_wstrb(0) = '1' then
                                                      registers.aurora_status_toggle_count(4).lane_up(7 downto 0)  :=  s00_axi_wdata(7 downto 0);
                                                 end if;
                                   when x"88" => if s00_axi_wstrb(1) = '1' then
                                                      registers.aurora_status_toggle_count(4).gt_pll_lock(15 downto 8) :=  s00_axi_wdata(15 downto 8);
                                                 end if;
                                                 if s00_axi_wstrb(0) = '1' then
                                                      registers.aurora_status_toggle_count(4).gt_pll_lock(7 downto 0)  :=  s00_axi_wdata(7 downto 0);
                                                 end if;
                                   when x"90" => if s00_axi_wstrb(1) = '1' then
                                                      registers.aurora_status_toggle_count(5).channel_up(15 downto 8) :=  s00_axi_wdata(15 downto 8);
                                                 end if;
                                                 if s00_axi_wstrb(0) = '1' then
                                                      registers.aurora_status_toggle_count(5).channel_up(7 downto 0)  :=  s00_axi_wdata(7 downto 0);
                                                 end if;
                                   when x"94" => if s00_axi_wstrb(1) = '1' then
                                                      registers.aurora_status_toggle_count(5).lane_up(15 downto 8) :=  s00_axi_wdata(15 downto 8);
                                                 end if;
                                                 if s00_axi_wstrb(0) = '1' then
                                                      registers.aurora_status_toggle_count(5).lane_up(7 downto 0)  :=  s00_axi_wdata(7 downto 0);
                                                 end if;
                                   when x"98" => if s00_axi_wstrb(1) = '1' then
                                                      registers.aurora_status_toggle_count(5).gt_pll_lock(15 downto 8) :=  s00_axi_wdata(15 downto 8);
                                                 end if;
                                                 if s00_axi_wstrb(0) = '1' then
                                                      registers.aurora_status_toggle_count(5).gt_pll_lock(7 downto 0)  :=  s00_axi_wdata(7 downto 0);
                                                 end if;
                                   when x"A0" => if s00_axi_wstrb(1) = '1' then
                                                      registers.aurora_status_toggle_count(6).channel_up(15 downto 8) :=  s00_axi_wdata(15 downto 8);
                                                 end if;
                                                 if s00_axi_wstrb(0) = '1' then
                                                      registers.aurora_status_toggle_count(6).channel_up(7 downto 0)  :=  s00_axi_wdata(7 downto 0);
                                                 end if;
                                   when x"A4" => if s00_axi_wstrb(1) = '1' then
                                                      registers.aurora_status_toggle_count(6).lane_up(15 downto 8) :=  s00_axi_wdata(15 downto 8);
                                                 end if;
                                                 if s00_axi_wstrb(0) = '1' then
                                                      registers.aurora_status_toggle_count(6).lane_up(7 downto 0)  :=  s00_axi_wdata(7 downto 0);
                                                 end if;
                                   when x"A8" => if s00_axi_wstrb(1) = '1' then
                                                      registers.aurora_status_toggle_count(6).gt_pll_lock(15 downto 8) :=  s00_axi_wdata(15 downto 8);
                                                 end if;
                                                 if s00_axi_wstrb(0) = '1' then
                                                      registers.aurora_status_toggle_count(6).gt_pll_lock(7 downto 0)  :=  s00_axi_wdata(7 downto 0);
                                                 end if;
                                   when x"B0" => if s00_axi_wstrb(1) = '1' then
                                                      registers.aurora_status_toggle_count(7).channel_up(15 downto 8) :=  s00_axi_wdata(15 downto 8);
                                                 end if;
                                                 if s00_axi_wstrb(0) = '1' then
                                                      registers.aurora_status_toggle_count(7).channel_up(7 downto 0)  :=  s00_axi_wdata(7 downto 0);
                                                 end if;
                                   when x"B4" => if s00_axi_wstrb(1) = '1' then
                                                      registers.aurora_status_toggle_count(7).lane_up(15 downto 8) :=  s00_axi_wdata(15 downto 8);
                                                 end if;
                                                 if s00_axi_wstrb(0) = '1' then
                                                      registers.aurora_status_toggle_count(7).lane_up(7 downto 0)  :=  s00_axi_wdata(7 downto 0);
                                                 end if;
                                   when x"B8" => if s00_axi_wstrb(1) = '1' then
                                                      registers.aurora_status_toggle_count(7).gt_pll_lock(15 downto 8) :=  s00_axi_wdata(15 downto 8);
                                                 end if;
                                                 if s00_axi_wstrb(0) = '1' then
                                                      registers.aurora_status_toggle_count(7).gt_pll_lock(7 downto 0)  :=  s00_axi_wdata(7 downto 0);
                                                 end if;

                                   when others =>

                             end case;

                             n_axi.axi_bvalid  := '1';
                             n_axi.axi_bresp   := "00";
                             n_axi.wr          := RESP;

                end if;

                when RESP =>   if p_axi.axi_bvalid = '1'  and  s00_axi_bready = '1' then
                     n_axi.axi_bvalid := '0';
                     n_axi.wr := IDLE;
                end if;

   end case;


      -- Edge detect the Aurora status flags.
      for j in 4 to 7 loop

          if registers.aurora_status(j)(gt_pll_lock) xor aurora_status_retimed(2)(j)(gt_pll_lock) then
              registers.aurora_status_toggle_count(j).gt_pll_lock := std_logic_vector( unsigned( registers.aurora_status_toggle_count(j).gt_pll_lock ) + x"01" );
          end if;

          if registers.aurora_status(j)(channel_up) xor aurora_status_retimed(2)(j)(channel_up) then
              registers.aurora_status_toggle_count(j).channel_up  := std_logic_vector( unsigned( registers.aurora_status_toggle_count(j).channel_up )  + x"01" );
          end if;

          if registers.aurora_status(j)(lane_up) xor aurora_status_retimed(2)(j)(lane_up) then
              registers.aurora_status_toggle_count(j).lane_up     := std_logic_vector( unsigned( registers.aurora_status_toggle_count(j).lane_up )     + x"01" );
          end if;

      end loop;


      -- Aurora PMA Init - extend the pulse to 256 clock cycles
      -- There is a specification on this signal.  I haven't checked whether I'm observing it, so I should revisit this file at some point.
      if registers.aurora_pma_init = "1" then
          count := count - to_unsigned( 1, count'length );
          if count = to_unsigned( 0, count'length ) then
              registers.aurora_pma_init := "0";  -- This bit will clear...
              count        := (others=>'1');
          end if;

      -- Aurora Reset - extend the Aurora reset pulse to 256 clock cycles
      elsif registers.aurora_reset_pb = "1" then
          count := count - to_unsigned( 1, count'length );
          if count = to_unsigned( 0, count'length ) then
              registers.aurora_reset_pb := "0";  -- ...before this bit.
              count        := (others=>'1');
          end if;

      -- Soft Interrupt - extend the soft interrupt pulse to 256 clock cycles
      elsif registers.soft_interrupt = "1" then
          count := count - to_unsigned( 1, count'length );
          if count = to_unsigned( 0, count'length ) then
              registers.soft_interrupt := "0";
              count        := (others=>'1');
          end if;
      end if;

     -- MIG Reset
     if registers.MIG_reset = "1" then
         count2 := count2 - to_unsigned( 1, count2'length );
         if count2 = to_unsigned( 0, count2'length ) then
             registers.MIG_reset := "0";
             count2        := (others=>'1');
         end if;

     -- USB Reset - extend the USB reset pulse to 256 clock cycles
     elsif registers.usb_reset = "1" then
          count2 := count2 - to_unsigned( 1, count2'length );
          if count2 = to_unsigned( 0, count2'length ) then
              registers.usb_reset := "0";
              count2        := (others=>'1');
          end if;
     end if;





  registers.aurora_status(4)  := aurora_status_retimed(2)(4);   -- I'm re-timing these three times, mostly so that I can edge detect channel_up, lane_up and gt_pll_lock.
  registers.aurora_status(5)  := aurora_status_retimed(2)(5);
  registers.aurora_status(6)  := aurora_status_retimed(2)(6);
  registers.aurora_status(7)  := aurora_status_retimed(2)(7);
  aurora_status_retimed(2)(4) := aurora_status_retimed(1)(4);
  aurora_status_retimed(2)(5) := aurora_status_retimed(1)(5);
  aurora_status_retimed(2)(6) := aurora_status_retimed(1)(6);
  aurora_status_retimed(2)(7) := aurora_status_retimed(1)(7);
  aurora_status_retimed(1)(4) := aurora_status_4;
  aurora_status_retimed(1)(5) := aurora_status_5;
  aurora_status_retimed(1)(6) := aurora_status_6;
  aurora_status_retimed(1)(7) := aurora_status_7;

  p_axi                 <= n_axi;  -- present state = next_state

  -- Outputs
  aurora_pma_init       <=     registers.aurora_pma_init(0);
  aurora_reset_pb       <=     registers.aurora_reset_pb(0);
  HiTech_Global_clk_sel <=     registers.HiTech_Global_clk_sel(0);
  LED_control           <=     registers.LED_control(1 downto 0);
  usb_reset             <=     registers.usb_reset(0);
  soft_interrupt        <=     registers.soft_interrupt(0);
  aurora_power_down     <=     registers.aurora_power_down(0);
  aurora_loopback       <=     registers.aurora_loopback(2 downto 0);
  flasher_enable        <=     registers.flasher_enable(0);
  MIG_reset_N           <= not registers.MIG_reset(0);


end if;

end process;

s00_axi_awready <= p_axi.axi_awready  ;
s00_axi_wready  <= p_axi.axi_wready   ;
s00_axi_bresp   <= p_axi.axi_bresp    ;
s00_axi_bvalid  <= p_axi.axi_bvalid   ;
s00_axi_arready <= p_axi.axi_arready  ;
s00_axi_rdata   <= p_axi.axi_rdata    ;
s00_axi_rresp   <= p_axi.axi_rresp    ;
s00_axi_rvalid  <= p_axi.axi_rvalid   ;

end arch_imp;
