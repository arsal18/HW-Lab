library ieee;
use ieee.std_logic_1164.all;

entity Mux_4to1_Testbench is
end entity Mux_4to1_Testbench;

architecture Behavioral of Mux_4to1_Testbench is
  signal I0, I1, I2, I3 : std_logic := '0';
  signal S0, S1         : std_logic := '0';
  signal Y              : std_logic;
begin
  UUT: entity work.Mux_4to1_Concurrent
    port map (
      I0 => I0,
      I1 => I1,
      I2 => I2,
      I3 => I3,
      S0 => S0,
      S1 => S1,
      Y  => Y
    );

  CLK_PROCESS: process
  begin
    for i in 0 to 7 loop  -- Simulate for 8 input combinations
      case i is
        when 0 =>
          I0 <= '0';
          I1 <= '0';
          I2 <= '0';
          I3 <= '0';
        when 1 =>
          I0 <= '1';
          I1 <= '0';
          I2 <= '0';
          I3 <= '0';
        when 2 =>
          I0 <= '0';
          I1 <= '1';
          I2 <= '0';
          I3 <= '0';
        when 3 =>
          I0 <= '1';
          I1 <= '1';
          I2 <= '0';
          I3 <= '0';
        when 4 =>
          I0 <= '0';
          I1 <= '0';
          I2 <= '1';
          I3 <= '0';
        when 5 =>
          I0 <= '1';
          I1 <= '0';
          I2 <= '1';
          I3 <= '0';
        when 6 =>
          I0 <= '0';
          I1 <= '1';
          I2 <= '1';
          I3 <= '0';
        when 7 =>
          I0 <= '1';
          I1 <= '1';
          I2 <= '1';
          I3 <= '0';
      end case;

      S0 <= '0';
      S1 <= '0';
      wait for 10 ns;

      S0 <= '0';
      S1 <= '1';
      wait for 10 ns;

      S0 <= '1';
      S1 <= '0';
      wait for 10 ns;

      S0 <= '1';
      S1 <= '1';
      wait for 10 ns;
    end loop;

    wait;
  end process CLK_PROCESS;

end architecture Behavioral;
