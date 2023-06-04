library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
Port ( D, clk, rst : in  STD_LOGIC;
Q, Qn : out  STD_LOGIC);
end D_FF;

architecture Behavioral of D_FF is

begin
process (D, clk, rst)
begin

if (rst = '1') then
Q <= '0';
elsif (rising_edge(CLK)) then 
Q <= D;
Qn <= not D;

end if;
end process;
end Behavioral;