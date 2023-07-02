library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity NBitCounter is
  generic (
    N : positive := 8
  );
  port (
    CLK : in  std_logic;
    EN  : in  std_logic;
    RST : in  std_logic;
    Q   : out std_logic_vector(N-1 downto 0)
  );
end entity NBitCounter;

architecture Behavioral of NBitCounter is
  signal counter : unsigned(N-1 downto 0);
begin
  process (CLK)
  begin
    if rising_edge(CLK) then
      if RST = '1' then
        counter <= (others => '0');
      elsif EN = '1' then
        counter <= counter + 1;
      end if;
    end if;
  end process;

  Q <= std_logic_vector(counter);
end architecture Behavioral;
