-- Ripple Carry Full Adder
library ieee;
use ieee.std_logic_1164.all;

entity Full_Adder is
  port (
    A, B, Cin: in std_logic;
    Sum, Cout: out std_logic
  );
end Full_Adder;

architecture Behavioral of Full_Adder is
begin
  Sum <= A xor B xor Cin;
  Cout <= (A and B) or (Cin and (A xor B));
end Behavioral;

-- 4-bit Ripple Carry Adder
library ieee;
use ieee.std_logic_1164.all;

entity Ripple_Carry_Adder is
  port (
    A, B: in std_logic_vector(3 downto 0);
    Sum: out std_logic_vector(3 downto 0);
    Cout: out std_logic
  );
end Ripple_Carry_Adder;

architecture Behavioral of Ripple_Carry_Adder is
  component Full_Adder is
    port (
      A, B, Cin: in std_logic;
      Sum, Cout: out std_logic
    );
  end component;

  signal Carry: std_logic_vector(3 downto 0);
begin
  FA0: Full_Adder port map (A(0), B(0), '0', Sum(0), Carry(0));
  FA1: Full_Adder port map (A(1), B(1), Carry(0), Sum(1), Carry(1));
  FA2: Full_Adder port map (A(2), B(2), Carry(1), Sum(2), Carry(2));
  FA3: Full_Adder port map (A(3), B(3), Carry(2), Sum(3), Cout);
end Behavioral;

-- BCD Decoder
library ieee;
use ieee.std_logic_1164.all;

entity BCD_Decoder is
  port (
    BCD: in std_logic_vector(3 downto 0);
    Segments: out std_logic_vector(6 downto 0)
  );
end BCD_Decoder;

architecture Behavioral of BCD_Decoder is
begin
  process (BCD)
  begin
    case BCD is
      when "0000" => Segments <= "1111110";  -- 0
      when "0001" => Segments <= "0110000";  -- 1
      when "0010" => Segments <= "1101101";  -- 2
      when "0011" => Segments <= "1111001";  -- 3
      when "0100" => Segments <= "0110011";  -- 4
      when "0101" => Segments <= "1011011";  -- 5
      when "0110" => Segments <= "1011111";  -- 6
      when "0111" => Segments <= "1110000";  -- 7
      when "1000" => Segments <= "1111111";  -- 8
      when "1001" => Segments <= "1111011";  -- 9
      when others => Segments <= "--------"; -- Invalid BCD input
    end case;
  end process;
end Behavioral;

-- 4-bit BCD Adder
library ieee;
use ieee.std_logic_1164.all;

entity BCD_Adder is
  port (
    A, B: in std_logic_vector(3 downto 0);
    Sum: out std_logic_vector(3 downto 0);
    Cout: out std_logic;
    Segments: out std_logic_vector(6 downto 0)
  );
end BCD_Adder;

architecture Behavioral of BCD_Adder is
  component Ripple_Carry_Adder is
    port (
      A, B: in std_logic_vector(3 downto 0);
      Sum: out std_logic_vector(3 downto 0);
      Cout: out std_logic
    );
  end component;

  component BCD_Decoder is
    port (
      BCD: in std_logic_vector(3 downto 0);
      Segments: out std_logic_vector(6 downto 0)
    );
  end component;

  signal Sum_internal: std_logic_vector(3 downto 0);
  signal Cout_internal: std_logic;
begin
  RCA: Ripple_Carry_Adder port map (A, B, Sum_internal, Cout_internal);
  BCD_Dec: BCD_Decoder port map (Sum_internal, Segments);

  Sum <= Sum_internal;
  Cout <= Cout_internal;
end Behavioral;

