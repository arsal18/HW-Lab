-- Testbench for Ripple Carry Adder
library ieee;
use ieee.std_logic_1164.all;

entity Testbench_Ripple_Carry_Adder is
end Testbench_Ripple_Carry_Adder;

architecture Behavioral of Testbench_Ripple_Carry_Adder is
  component Ripple_Carry_Adder is
    port (
      A, B: in std_logic_vector(3 downto 0);
      Sum: out std_logic_vector(3 downto 0);
      Cout: out std_logic
    );
  end component;

  signal A, B: std_logic_vector(3 downto 0);
  signal Sum: std_logic_vector(3 downto 0);
  signal Cout: std_logic;
begin
  UUT: Ripple_Carry_Adder port map (A, B, Sum, Cout);

  process
  begin
    -- Test case 1
    A <= "0000";
    B <= "0000";
    wait for 10 ns;
    assert (Sum = "0000" and Cout = '0')
      report "Test case 1 failed!" severity error;

    -- Test case 2
    A <= "0010";
    B <= "0101";
    wait for 10 ns;
    assert (Sum = "0111" and Cout = '0')
      report "Test case 2 failed!" severity error;

    -- Test case 3
    A <= "1101";
    B <= "0011";
    wait for 10 ns;
    assert (Sum = "0000" and Cout = '1')
      report "Test case 3 failed!" severity error;

    -- Add more test cases here...

    wait;
  end process;
end Behavioral;

