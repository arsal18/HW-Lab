library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity Up_Counter is 

		end Up_Counter;
		
architecture tb of Up_Counter_tb  is
component Up_Counter
port ( clk:   in std_logic;
	   rst:   in std_logic;
	   count: out std_logic_vector(2 downto 0);
		);
		end component;
signal clk: std_logic := '0';
signal rst: std_logic := '0';
signal count: std_logic_vector(2 downto 0);

begin
uut: counter port map(
clk => clk
rst  => rst
count => count
);

process
begin 
wait for 5 ns;
clk <= not clk;
end process

process
begin 
rst <= '0';
wait for 10 ns;
rst <= not rst;
wait;
end process
end tb

