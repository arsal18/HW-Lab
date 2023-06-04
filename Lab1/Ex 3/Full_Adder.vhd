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

