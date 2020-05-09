----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 07/20/2019 09:52:25 PM
-- Design Name:
-- Module Name: Ethernet_LEDs - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ethernet_LEDs is
    Port ( mmcm_locked_out : in STD_LOGIC;
           link_status : in STD_LOGIC;
           clock_speed : in STD_LOGIC_VECTOR (1 downto 0);
           duplex_status : in STD_LOGIC;
           speed_mode : in STD_LOGIC_VECTOR (1 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0));
end Ethernet_LEDs;

architecture Behavioral of Ethernet_LEDs is

constant OFF:    std_logic_vector(1 downto 0) := "00";
constant RED:    std_logic_vector(1 downto 0) := "01";
constant GREEN:  std_logic_vector(1 downto 0) := "10";
constant ORANGE: std_logic_vector(1 downto 0) := "11";


begin

logic : process( mmcm_locked_out, link_status, clock_speed, duplex_status, speed_mode ) is
     begin

     -- Note:  if all the LEDs go green, we have max speed at full duplex and everything in synch.

     LED <= OFF & OFF & OFF & OFF;

     if mmcm_locked_out = '1' then
         LED(1 downto 0) <= GREEN;
     else
         LED(1 downto 0) <= RED;
     end if;

     if link_status = '1' then
         if duplex_status = '0' then     -- Half Duplex
             LED(3 downto 2) <= ORANGE;
         else                            -- Full Duplex
             LED(3 downto 2) <= GREEN;
         end if;
     else
         LED(3 downto 2) <= RED;
     end if;

     case speed_mode is
         when "11" => LED(5 downto 4) <= OFF;
         when "00" => LED(5 downto 4) <= RED;     -- 10  Mbit/s
         when "01" => LED(5 downto 4) <= ORANGE;  -- 100 Mbit/s
         when "10" => LED(5 downto 4) <= GREEN;   -- 1000 Mbit/s
         when others =>
     end case;

     case clock_speed is
         when "11" => LED(7 downto 6) <= OFF;
         when "00" => LED(7 downto 6) <= RED;    -- 10  Mbit/s
         when "01" => LED(7 downto 6) <= ORANGE; -- 100  Mbit/s
         when "10" => LED(7 downto 6) <= GREEN;  -- 1000  Mbit/s
         when others =>
     end case;

     end process;

end Behavioral;
