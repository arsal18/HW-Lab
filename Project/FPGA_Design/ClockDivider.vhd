library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ClockDivider is
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end ClockDivider;

architecture Behavioral of ClockDivider is
    signal counter : integer range 0 to 24999999 := 0; -- Assuming 100MHz clock frequency
    signal clk_divided : std_logic := '0';

begin

    process(clk_in)
    begin
        if rising_edge(clk_in) then
            counter <= counter + 1;
            if counter = 24999999 then
                counter <= 0;
                clk_divided <= not clk_divided;
            end if;
        end if;
    end process;

    clk_out <= clk_divided;

end Behavioral;
