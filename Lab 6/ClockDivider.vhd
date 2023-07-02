library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity ClockDivider is
Port ( CLK : in STD_LOGIC;
clock_480 : out STD_LOGIC;
clock_centi : out STD_LOGIC);
end ClockDivider;
architecture Behavioral of ClockDivider is
signal clk1, clk2 : STD_LOGIC;
begin
clk_480hz : process (CLK) --clock that runs at 480Hz to keep all the leds on
variable count1 : unsigned (17 downto 0):="000000000000000000";
begin
if (rising_edge(CLK)) then
if count1 = "110010110111001101" then --counting to 208333
clk1 <= not clk1;
count1 := "000000000000000000";
end if;
count1 := count1 + 1;
end if;
end process;
clk_centi : process (CLK) --clock that runs at 0.5MHz to count in centiseconds
variable count2 : unsigned (18 downto 0):="0000000000000000000";
begin
if (rising_edge(CLK)) then
if count2 = "1111010000100100000" then --counting to 500000
clk2 <= not clk2;
count2 := "0000000000000000000";
end if;
count2 := count2 + 1;
end if;
end process;
clock_480 <= clk1; --setting this clock to a signal to make input for display module
clock_centi <= clk2; --setting this clock to a signal to make input for display module
end Behavioral;