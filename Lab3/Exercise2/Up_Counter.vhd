library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity Up_Counter is 
port ( clk:     in std_logic;
	   rst:      in std_logic;
	  count: out std_logic_vector(2 downto 0)
		
		);
		end Up_Counter;
		
architecture Behavioral of Up_Counter  is
component JK_FF
port ( clk:     in std_logic;
		J, K:   in std_logic;
		Q, nQ: out std_logic;
		rst:      in std_logic;
		);
		end component;
signal temp: std_logic_vector(2 downto 0):= "000"
begin

d0: JK_FF port map (
	clk => clk
	j => '1'
	k => '1'
	q => temp(2)
	)
d1: JK_FF port map (
	clk => clk
	j => '1'
	k => '1'
	q => temp(1)
	)
d2: JK_FF port map (
	clk => clk
	j => '1'
	k => '1'
	q => temp(0)
	)
count(2)<= temp(0);
count(1)<= temp(1);
count(0)<= temp(2);

end Behavioral;