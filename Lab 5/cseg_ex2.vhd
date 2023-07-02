----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2022 21:43:42
-- Design Name: 
-- Module Name: cseg_ex2 - Behavioral
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

entity cseg1_ex2 is
    Port ( clk : in STD_LOGIC;
           switch : in STD_LOGIC := '0';
           anodes : out STD_LOGIC_VECTOR (7 downto 0);
           cathodes : out STD_LOGIC_VECTOR (7 downto 0));
           
end cseg1_ex2;

architecture Behavioral of cseg1_ex2 is
signal clk_counter : natural range 0 to 50000000 := 0;
signal counter : natural range 0 to 9 := 0;

begin
      process (clk, switch)
        begin
        if rising_edge(clk) and switch = '1' then
            clk_counter <= clk_counter + 1;
           if clk_counter >= 50000000 then
            clk_counter <= 0;
             --500ms delay
              counter <= counter + 1;
             if counter > 9 then
                  counter <= 0;
              end if;
             end if;
          end if;
        end process;
   process (counter)
   begin
        case counter is
          when 0 => cathodes <= "11000000"; --0
          when 1 => cathodes <= "11111001"; --1
          when 2 => cathodes <= "10100100"; --2
          when 3 => cathodes <= "10110000"; --3
          when 4 => cathodes <= "10011001"; --4
          when 5 => cathodes <= "10010010"; --5
          when 6 => cathodes <= "10000010"; --6
          when 7 => cathodes <= "11111000"; --7
          when 8 => cathodes <= "10000000"; --8
          when 9 => cathodes <= "10010000"; --9
          when others => cathodes <= "11111111";
         end case;
    end process;
         
         
anodes <= "11111110";
end Behavioral;