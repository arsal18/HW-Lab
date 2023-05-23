library ieee;
use ieee.std_logic_1164.all;

entity fulladder_tb is
end entity fulladder_tb;

architecture Behavioral of fulladder_tb is
  -- Component declaration
  component fulladder is
    port (
      A, B, Cin: in std_logic;
      Sum, Cout: out std_logic
    );
  end component fulladder;

  -- Signals for testbench
  signal A_tb, B_tb, Cin_tb: std_logic;
  signal Sum_tb, Cout_tb: std_logic;

begin
  -- Instantiate the full adder
  FA: fulladder port map(A_tb, B_tb, Cin_tb, Sum_tb, Cout_tb);

  -- Test stimuli
  stimulus: process
  begin
    -- Test case 1: A = 0, B = 0, Cin = 0
    A_tb <= '0';
    B_tb <= '0';
    Cin_tb <= '0';
    wait for 10 ns;
    assert (Sum_tb = '0' and Cout_tb = '0') report "Test case 1 failed!" severity error;

    -- Test case 2: A = 1, B = 0, Cin = 0
    A_tb <= '1';
    B_tb <= '0';
    Cin_tb <= '0';
    wait for 10 ns;
    assert (Sum_tb = '1' and Cout_tb = '0') report "Test case 2 failed!" severity error;

    -- Test case 3: A = 0, B = 1, Cin = 0
    A_tb <= '0';
    B_tb <= '1';
    Cin_tb <= '0';
    wait for 10 ns;
    assert (Sum_tb = '1' and Cout_tb = '0') report "Test case 3 failed!" severity error;

    -- Test case 4: A = 1, B = 1, Cin = 0
    A_tb <= '1';
    B_tb <= '1';
    Cin_tb <= '0';
    wait for 10 ns;
    assert (Sum_tb = '0' and Cout_tb = '1') report "Test case 4 failed!" severity error;

    -- Test case 5: A = 0, B = 0, Cin = 1
    A_tb <= '0';
    B_tb <= '0';
    Cin_tb <= '1';
    wait for 10 ns;
    assert (Sum_tb = '1' and Cout_tb = '0') report "Test case 5 failed!" severity error;

    -- Test case 6: A = 1, B = 0, Cin = 1
    A_tb <= '1';
    B_tb <= '0';
    Cin_tb <= '1';
    wait for 10 ns;
    assert (Sum_tb = '0' and Cout_tb = '1') report "Test case 6 failed!" severity error;

    -- Test case 7: A = 0, B = 1, Cin = 1
    A_tb <= '0';
    B_tb <= '1';
    Cin_tb <= '1';
    wait for 10 ns;
    assert (Sum_tb = '0' and Cout_tb = '1') report "Test case 7 failed!" severity error;

    -- Test case 8: A = 1, B = 1, Cin = 1
    A_tb <= '1';
    B_tb <= '1';
    Cin_tb <= '1';
    wait for 10 ns;
    assert (Sum_tb = '1' and Cout_tb = '1') report "Test case 8 failed!" severity error;

    -- Stop simulation
    wait;
  end process stimulus;

end architecture Behavioral;

