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

