library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity NBitCounter_TB is
end entity NBitCounter_TB;

architecture Behavioral of NBitCounter_TB is
  constant CLK_PERIOD : time := 10 ns;

  signal CLK : std_logic := '0';
  signal EN  : std_logic := '0';
  signal RST : std_logic := '0';
  signal Q   : std_logic_vector(3 downto 0);
begin
  UUT: entity work.NBitCounter
    generic map (
      N => 4
    )
    port map (
      CLK => CLK,
      EN  => EN,
      RST => RST,
      Q   => Q
    );

  CLK_PROCESS: process
  begin
    for i in 0 to 15 loop  -- Simulate for 16 clock cycles
      CLK <= '0';
      wait for CLK_PERIOD / 2;
      CLK <= '1';
      wait for CLK_PERIOD / 2;
    end loop;

    wait;
  end process CLK_PROCESS;

  STIMULUS_PROCESS: process
  begin
    RST <= '1';
    EN <= '0';
    wait for 20 ns;

    RST <= '0';
    wait for 10 ns;

    EN <= '1';
    wait for 100 ns;

    EN <= '0';
    wait for 20 ns;

    EN <= '1';
    wait for 40 ns;

    EN <= '0';
    wait for 50 ns;

    EN <= '1';
    wait for 70 ns;

    EN <= '0';
    wait for 100 ns;

    EN <= '1';
    wait for 200 ns;

    EN <= '0';
    wait;

  end process STIMULUS_PROCESS;

  MONITOR_PROCESS: process
  begin
    wait for 50 ns;

    for i in 0 to 15 loop
      wait for CLK_PERIOD;
      report "Counter Value: " & integer'image(to_integer(unsigned(Q)));
    end loop;

    wait;
  end process MONITOR_PROCESS;

end architecture Behavioral;
