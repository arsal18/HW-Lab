-- 1-bit Half Adder
library ieee;
use ieee.std_logic_1164.all;

entity HalfAdder is
  port (
    A, B: in std_logic;
    Sum, Carry: out std_logic
  );
end entity HalfAdder;

architecture Behavioral of HalfAdder is
begin
  Sum <= A xor B;    -- XOR operation for sum output
  Carry <= A and B;  -- AND operation for carry output
end architecture Behavioral;


