----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/16/2023 11:34:08 PM
-- Design Name: 
-- Module Name: One_sec - Behavioral
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

entity One_sec is
    Port ( clk_i : in STD_LOGIC;
           rstn_i : in STD_LOGIC;
           sec_plus : out STD_LOGIC);
end One_sec;

architecture Behavioral of One_sec is
    constant CLK_FREQ : integer := 100_000_000; -- Clock frequency in Hz
    constant COUNT_MAX : integer := CLK_FREQ;   -- Maximum count for one second

    signal count : integer range 0 to COUNT_MAX;

begin
    process(clk_i, rstn_i)
    begin
        if rstn_i = '0' then
            count <= 0; -- Reset the counter
        elsif rising_edge(clk_i) then
            if count = COUNT_MAX - 1 then
                count <= 0;      -- Reset the counter when one second has passed
                sec_plus <= '1'; -- Generate sec_plus signal
            else
                count <= count + 1; -- Increment the counter
                sec_plus <= '0';   -- Deassert sec_plus signal
            end if;
        end if;
    end process;
end Behavioral;
