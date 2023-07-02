library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity final is
Port ( button : in STD_LOGIC;
CLK : in STD_LOGIC;
RST : in STD_LOGIC;
anode : out STD_LOGIC_VECTOR (7 downto 0);
cathode : out STD_LOGIC_VECTOR (7 downto 0));
end final;
architecture Behavioral of final is
component ClockDivider
Port ( CLK : in STD_LOGIC;
clock_480 : out STD_LOGIC;
clock_centi : out STD_LOGIC);
end component;
component sevenseg
Port ( button : in STD_LOGIC;
RST : in STD_LOGIC;
CLK : in STD_LOGIC;
clock_480 : in STD_LOGIC;
clock_centi : in STD_LOGIC;
anode : out STD_LOGIC_VECTOR (7 downto 0);
cathode : out STD_LOGIC_VECTOR (7 downto 0));
end component;
signal clk1, clk2 : STD_LOGIC;
begin
comp0 : ClockDivider port map (CLK => CLK, clock_480 => clk1, clock_centi => clk2);
comp1 : sevenseg port map (CLK => CLK, clock_480 => clk1, clock_centi => clk2, button =>
button,
RST => RST, anode => anode, cathode => cathode);
end Behavioral;