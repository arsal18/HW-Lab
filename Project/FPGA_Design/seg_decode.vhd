----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/16/2023 11:14:24 PM
-- Design Name: 
-- Module Name: seg_decode - Behavioral
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

entity seg_decode is
    Port ( hex_in : in STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out STD_LOGIC_VECTOR (7 downto 0));
end seg_decode;

architecture Behavioral of seg_decode is

begin

    process_2 : process( hex_in )
   begin
      case( hex_in ) is
      
         when "0000" => seg_out <= "11000000";   
         when "0001" => seg_out <= "11111001";   
         when "0010" => seg_out <= "10100100";   
         when "0011" => seg_out <= "10110000";   
         when "0100" => seg_out <= "10011001";   
         when "0101" => seg_out <= "10010010";   
         when "0110" => seg_out <= "10000010";   
         when "0111" => seg_out <= "11111000";   
         when "1000" => seg_out <= "10000000";   
         when "1001" => seg_out <= "10010000";   
            
         when others => seg_out <= "11000000";   
      
      end case ;
   end process ;
end Behavioral;
