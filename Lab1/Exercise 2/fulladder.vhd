library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
  port (
    A, B, Cin: in std_logic;
    Sum, Cout: out std_logic
  );
end entity fulladder;

architecture Behavioral of fulladder is
  component halfadder is
    port (
      A, B: in std_logic;
      Sum, Carry: out std_logic
    );
  end component halfadder;

  signal S1, C1, C2: std_logic;
begin
  -- Instantiate two half adders
  HA1: halfadder port map(A, B, S1, C1);
  HA2: halfadder port map(S1, Cin, Sum, C2);

  -- Generate the final carry output
  Cout <= C1 or C2;
end architecture Behavioral;
