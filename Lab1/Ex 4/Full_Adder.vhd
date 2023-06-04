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

-- 4-bit Adder/Subtractor
library ieee;
use ieee.std_logic_1164.all;

entity Adder_Subtractor is
  port (
    A, B: in std_logic_vector(3 downto 0);
    Subtract: in std_logic;
    Sum: out std_logic_vector(3 downto 0);
    Cout: out std_logic
  );
end Adder_Subtractor;

architecture Behavioral of Adder_Subtractor is
  component Full_Adder is
    port (
      A, B, Cin: in std_logic;
      Sum, Cout: out std_logic
    );
  end component;

  signal B_Inverted: std_logic_vector(3 downto 0);
  signal CarryIn: std_logic;
  signal CarryOut: std_logic;
begin
  -- Invert B when subtracting
  B_Inverted <= not B when Subtract = '1' else B;

  -- Ripple Carry Adder
  FA0: Full_Adder port map (A(0), B_Inverted(0), '0', Sum(0), CarryOut);
  FA1: Full_Adder port map (A(1), B_Inverted(1), CarryOut, Sum(1), CarryOut);
  FA2: Full_Adder port map (A(2), B_Inverted(2), CarryOut, Sum(2), CarryOut);
  FA3: Full_Adder port map (A(3), B_Inverted(3), CarryOut, Sum(3), CarryOut);

  Cout <= CarryOut;
end Behavioral;

