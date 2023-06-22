library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Temp_on_7_Seg_TB is
end Temp_on_7_Seg_TB;

architecture Behavioral of Temp_on_7_Seg_TB is
    constant CLK_PERIOD : time := 10 ns; -- Clock period in nanoseconds
    
    signal clk_i : std_logic := '0';
    signal rstn_i : std_logic := '1';
    signal seg_o : std_logic_vector(7 downto 0);
    signal an_o : std_logic_vector(7 downto 0);
    signal LED : std_logic_vector(15 downto 0);
    signal alram_down : std_logic := '0';
    signal alram_up : std_logic := '0';
    signal clock_down : std_logic := '0';
    signal clock_up : std_logic := '0';
    signal hrs_min : std_logic := '0';

begin
    -- Instantiate the unit under test (UUT)
    uut: entity work.Temp_on_7_Seg
        port map (
            clk_i => clk_i,
            rstn_i => rstn_i,
            seg_o => seg_o,
            an_o => an_o,
            LED => LED,
            alram_down => alram_down,
            alram_up => alram_up,
            clock_down => clock_down,
            clock_up => clock_up,
            hrs_min => hrs_min
        );

    -- Clock generation process
    clk_process: process
    begin
            clk_i <= '0';
            wait for CLK_PERIOD / 2;
            clk_i <= '1';
            wait for CLK_PERIOD / 2;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        -- Wait for a few clock cycles before starting the test
        rstn_i <= '0';
        wait for CLK_PERIOD * 10;
        rstn_i <= '1';
        -- Set initial values
        alram_down <= '0';
        alram_up <= '0';
        clock_down <= '0';
        clock_up <= '0';

        hrs_min <= '0';

        -- Set alarm to 7:30
		alram_up <= '1';
        wait for CLK_PERIOD * 61;
		alram_up <= '0';
        wait for CLK_PERIOD * 1;
        hrs_min <= '1';

        alram_up <= '1';
        wait for CLK_PERIOD * 14;
		alram_up <= '0';
        wait for CLK_PERIOD * 1;

        
        wait for CLK_PERIOD * 24 * 60;
        

        
        wait;
    end process;

end Behavioral;
