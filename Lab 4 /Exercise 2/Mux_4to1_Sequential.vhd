library ieee;
use ieee.std_logic_1164.all;

entity Mux_4to1_Sequential is
  port (
    I0, I1, I2, I3 : in  std_logic;
    S0, S1         : in  std_logic;
    Y              : out std_logic
  );
end entity Mux_4to1_Sequential;

architecture Behavioral of Mux_4to1_Sequential is
  signal selected_input : std_logic_vector(1 downto 0);
begin
  process (S0, S1)
  begin
    case selected_input is
      when "00" =>
        Y <= I0;
      when "01" =>
        Y <= I1;
      when "10" =>
        Y <= I2;
      when "11" =>
        Y <= I3;
      when others =>
        Y <= 'X';  -- Default assignment
    end case;
  end process;

  process (S0, S1)
  begin
    selected_input <= S0 & S1;
  end process;
end architecture Behavioral;
