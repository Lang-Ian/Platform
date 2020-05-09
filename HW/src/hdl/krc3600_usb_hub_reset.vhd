-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Copyright 2015, Knowledge Resources GmbH
-- http://www.knowres.ch
--
-- FILE:        krc3600_usb_hub_reset.vhd
-- MODULE:      krc3600_usb_hub_reset
-- TITLE:       KRC3600 USB Hub Reset 
-------------------------------------------------------------------------------
-- DESCRIPTION: This is a default Top Level module for new designs using the
--              KRC3600 carrier. It includes a correctly configured processing
--              system, which provides a 100MHz and a 200MHz clock by default.
--              It has all standard IO ports predefined and is dependent on the 
--              krc3600_pkg.
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity krc3600_usb_hub_reset is
	Generic (
	NBITS : integer := 12;
	CNT_MAX : integer := 4095
	);
	Port (
	clk : in std_logic;
	areset: in std_logic;
	USB_HUB_RESET : out std_logic;
	ethernet_reset_N : out std_logic
	);
end krc3600_usb_hub_reset;

architecture RTL of krc3600_usb_hub_reset is
	
signal counter : unsigned(NBITS - 1 downto 0) := to_unsigned(CNT_MAX, NBITS);
signal shifter:  STD_LOGIC_VECTOR (1 to 3);


begin

reset_conditioning:  process ( areset, clk )

    begin

    if areset = '1' then
    
        shifter  <= "111";
       
    elsif rising_edge( clk ) then
    
        shifter(1 to 3) <= '0' & shifter(1 to 2);    
    
    end if;

end process;


	

	process( clk )
	begin
	
    if rising_edge(clk) then
	
         if shifter(3) = '1' then
	        counter <= to_unsigned(CNT_MAX,NBITS);
	     elsif counter = to_unsigned(0,NBITS) then
			   USB_HUB_RESET <= '0';
			   ethernet_reset_N <= '1';
			else
				counter <= counter - to_unsigned(1,NBITS);
				USB_HUB_RESET <= '1';
				ethernet_reset_N <= '0';
			end if;
		end if;
		
	end process;
	
	
	process begin
	report "USB HUB RESET PRESENT" ;
	wait;
	end process;
	
end RTL;
