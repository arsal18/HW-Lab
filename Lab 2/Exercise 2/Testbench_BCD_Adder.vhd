library ieee;
use ieee.std_logic_1164.all;

entity Testbench_BCD_Adder is
end Testbench_BCD_Adder;

architecture Behavioral of Testbench_BCD_Adder is
  component BCD_Adder is
    port (
      A, B: in std_logic_vector(3 downto 0);
      Sum: out std_logic_vector(3 downto 0);
      Cout: out std_logic;
      Segments: out std_logic_vector(6 downto 0)
    );
  end component;

  signal A, B: std_logic_vector(3 downto 0);
  signal Sum: std_logic_vector(3 downto 0);
  signal Cout: std_logic;
  signal Segments: std_logic_vector(6 downto 0);
begin
  UUT: BCD_Adder port map (A, B, Sum, Cout, Segments);

  process
  begin
    -- Test case 1: 5 + 3 = 8
    A <= "0101";
    B <= "0011";
    wait for 10 ns;
    assert (Sum = "1000" and Cout = '0' and Segments = "1111111")
      report "Test case 1 failed!" severity error;

    -- Test case 2: 9 + 1 = 0 (with carry)
    A <= "1001";
    B <= "0001";
    wait for 10 ns;
    assert (Sum = "0000" and Cout = '1' and Segments = "1111110")
      report "Test case 2 failed!" severity error;

    -- Test case 3: 7 + 9 = 6 (with carry)
    A <= "0111";
    B <= "1001";
    wait for 10 ns;
    assert (Sum = "0110" and Cout = '1' and Segments = "1011111")
      report "Test case 3 failed!" severity error;

    -- Add more test cases here...

    wait;
  end process;
end Behavioral;

