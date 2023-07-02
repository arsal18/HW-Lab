library ieee;
use ieee.std_logic_1164.all;

entity ClockDivider is
  generic (
    N : positive := 2
  );
  port (
    CLK    : in  std_logic;
    CLK_N  : out std_logic
  );
end entity ClockDivider;

architecture Behavioral of ClockDivider is
  signal counter : integer range 0 to N - 1;
begin
  process (CLK)
  begin
    if rising_edge(CLK) then
      if counter = N - 1 then
        CLK_N <= not CLK_N;
        counter <= 0;
      else
        counter <= counter + 1;
      end if;
    end if;
  end process;
end architecture Behavioral;
