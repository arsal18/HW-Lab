library ieee;
use ieee.std_logic_1164.all;

entity Mux_4to1_Concurrent is
  port (
    I0, I1, I2, I3 : in  std_logic;
    S0, S1         : in  std_logic;
    Y              : out std_logic
  );
end entity Mux_4to1_Concurrent;

architecture Behavioral of Mux_4to1_Concurrent is
begin
  Y <= I0 when (S0 = '0' and S1 = '0') else
       I1 when (S0 = '0' and S1 = '1') else
       I2 when (S0 = '1' and S1 = '0') else
       I3;
end architecture Behavioral;
