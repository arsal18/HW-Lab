library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF_tb is
end entity;

architecture tb of DFF_tb is

component D_FF is
Port ( D, clk, rst : in STD_LOGIC;
Q, Qn : out STD_LOGIC);
end component ;

signal D, clk, rst, Q, Qn : STD_LOGIC;

begin
uut: D_FF port map(
D => D,
clk => clk,
rst => rst,
Q => Q,
Qn => Qn);

Clock : process
begin
clk <= '0';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
end process;

stim : process
begin

rst <= '0';
D <= '0';
wait for 40 ns;
D <= '1';
wait for 40 ns;

end process;
end tb;