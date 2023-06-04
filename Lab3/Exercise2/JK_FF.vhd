library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FF is 
port ( clk:     in std_logic;
		J, K:   in std_logic;
		Q, nQ: out std_logic;
		rst:      in std_logic;
		);
		end JK_FF;
		
architecture Behavioral of JK_FF is

signal Qtp,nQtp: std_logic := '0';
begin
Q <= Qtp; 
nQ <= nQtp;

process(clk,reset)
 begin
 if(rst = '1') then             
 Qtp <= '0';
nQtp <= '1'; 
elsif( rising_edge(clk) ) then		
if(J='0' and K='0') then       
NULL;
elsif(J='0' and K='1') then    --Set the output.  
Qtp <= '0';
nQtp <= '1'; 
elsif(J='1' and K='0') then
Qtp <= '1';  
nQtp <= '0';
else
Qtp <= not Qtp;  
nQtp <= not nQtp;

end if; 
end if; 
end process;
end Behavioral;