-- Testbench for Adder/Subtractor
library ieee;
use ieee.std_logic_1164.all;

entity Testbench_Adder_Subtractor is
end Testbench_Adder_Subtractor;

architecture Behavioral of Testbench_Adder_Subtractor is
  component Adder_Subtractor is
    port (
      A, B: in std_logic_vector(3 downto 0);
      Subtract: in std_logic;
      Sum: out std_logic_vector(3 downto 0);
      Cout: out std_logic
    );
  end component;

  signal A, B: std_logic_vector(3 downto 0);
  signal Subtract: std_logic;
  signal Sum: std_logic_vector(3 downto 0);
  signal Cout: std_logic;
begin
  UUT: Adder_Subtractor port map (A, B, Subtract, Sum, Cout);

  process
  begin
    -- Test case 1: Addition
    A <= "0101";
    B <= "0011";
    Subtract <= '0';
    wait for 10 ns;
    assert (Sum = "1000" and Cout = '0')
      report "Test case 1 failed!" severity error;

    -- Test case 2: Subtraction
    A <= "0101";
    B <= "0011";
    Subtract <= '1';
    wait for 10 ns;
    assert (Sum = "0010" and Cout = '0')
      report "Test case 2 failed!" severity error;

    -- Test case 3: Subtraction with borrow
    A <= "0010";
    B <= "0101";
    Subtract <= '1';
    wait for 10 ns;
    assert (Sum = "1111" and Cout = '1')
      report "Test case 3 failed!" severity error;

    -- Add more test cases here...

    wait;
  end process;
end Behavioral;

