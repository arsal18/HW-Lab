library ieee;
use ieee.std_logic_1164.all;

entity ClockDivider_TB is
end entity ClockDivider_TB;

architecture Behavioral of ClockDivider_TB is
  constant CLK_PERIOD : time := 10 ns;
  
  signal CLK   : std_logic := '0';
  signal CLK_N : std_logic;
begin
  UUT: entity work.ClockDivider
    generic map (
      N => 2
    )
    port map (
      CLK   => CLK,
      CLK_N => CLK_N
    );

  CLK_PROCESS: process
  begin
    while now < 100 ns loop  -- Simulate for 100 ns
      CLK <= '0';
      wait for CLK_PERIOD / 2;
      CLK <= '1';
      wait for CLK_PERIOD / 2;
    end loop;
    wait;
  end process CLK_PROCESS;

end architecture Behavioral;
