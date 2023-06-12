library ieee;
use ieee.std_logic_1164.all;

entity Testbench_BCD_Decoder is
end Testbench_BCD_Decoder;

architecture Behavioral of Testbench_BCD_Decoder is
  component BCD_Decoder is
    port (
      BCD: in std_logic_vector(3 downto 0);
      Segments: out std_logic_vector(6 downto 0)
    );
  end component;

  signal BCD: std_logic_vector(3 downto 0);
  signal Segments: std_logic_vector(6 downto 0);
begin
  UUT: BCD_Decoder port map (BCD, Segments);

  process
  begin
    -- Test case 1: Display digit 0
    BCD <= "0000";
    wait for 10 ns;
    assert (Segments = "1111110")
      report "Test case 1 failed!" severity error;

    -- Test case 2: Display digit 5
    BCD <= "0101";
    wait for 10 ns;
    assert (Segments = "1011011")
      report "Test case 2 failed!" severity error;

    -- Test case 3: Display digit 9
    BCD <= "1001";
    wait for 10 ns;
    assert (Segments = "1111011")
      report "Test case 3 failed!" severity error;

    -- Add more test cases here...

    wait;
  end process;
end Behavioral;

