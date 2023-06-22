----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/17/2023 12:28:25 AM
-- Design Name: 
-- Module Name: Clock_Time - Behavioral
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

entity Clock_Time is
    Port ( clk_i : in STD_LOGIC;
           rstn_i : in STD_LOGIC;
           clock_down : in STD_LOGIC;
           clock_up : in STD_LOGIC;
           hrs_min : in STD_LOGIC;
           sec_plus : in STD_LOGIC;
           sec_out : out integer range 0 to 59;
           min_out : out integer range 0 to 59;
           hrs_out : out integer range 0 to 23);
end Clock_Time;

architecture Behavioral of Clock_Time is
    signal sec_count : integer range 0 to 59 := 0;
    signal min_count : integer range 0 to 59 := 0;
    signal hrs_count : integer range 0 to 23 := 0;
begin

    process(clk_i, rstn_i)
    begin
        if rstn_i = '0' then
            sec_count <= 0; -- Reset the counter
            min_count <= 0; -- Reset the counter
            hrs_count <= 0; -- Reset the counter
        elsif rising_edge(clk_i) then
            if (sec_plus = '1') then
                if (clock_up = '1') then
                    if (hrs_min = '1') then
                        if hrs_count = 23 then
                            hrs_count <= 0;
                        else
                            hrs_count <= hrs_count + 1;
                        end if ;
                    else
                        if (min_count = 59) then
                            min_count <= 0;
                        else
                            min_count <= min_count + 1;
                        end if ;
                    end if ;
                end if ;
                if (clock_down = '1') then
                    if (hrs_min = '1') then
                        if (hrs_count = 0) then
                            hrs_count <= 23;
                        else
                            hrs_count <= hrs_count - 1;
                        end if ;
                    else
                        if (min_count = 0) then
                            min_count <= 59;
                        else
                            min_count <= min_count - 1;
                        end if ;
                    end if ;
                end if ;
                
                if sec_count = 59 then
                    sec_count <= 0;
                    if min_count = 59 then
                        min_count <= 0;
                        if hrs_count = 23 then
                            hrs_count <= 0;
                        else
                            hrs_count <= hrs_count + 1;
                        end if ;
                    else
                        min_count <= min_count + 1;
                    end if ;
                else
                    sec_count <= sec_count + 1; 
                end if ;

            end if ;
        end if;
    end process;

    sec_out <= sec_count;
    min_out <= min_count;
    hrs_out <= hrs_count;

end Behavioral;
