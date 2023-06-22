library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Clock_Time_TB is
end Clock_Time_TB;

architecture Behavioral of Clock_Time_TB is
    constant CLK_PERIOD : time := 10 ns; -- Clock period in nanoseconds

    signal clk_i : std_logic := '0';
    signal rstn_i : std_logic := '1';
    signal clock_down : std_logic := '0';
    signal clock_up : std_logic := '0';
    signal hrs_min : std_logic := '0';
    signal sec_plus : std_logic := '0';
    signal sec_out : integer range 0 to 59;
    signal min_out : integer range 0 to 59;
    signal hrs_out : integer range 0 to 23;

begin
    -- Instantiate the unit under test (UUT)
    uut: entity work.Clock_Time
        port map (
            clk_i => clk_i,
            rstn_i => rstn_i,
            clock_down => clock_down,
            clock_up => clock_up,
            hrs_min => hrs_min,
            sec_plus => sec_plus,
            sec_out => sec_out,
            min_out => min_out,
            hrs_out => hrs_out
        );

    -- Clock generation process
    clk_process: process
    begin
        while now < 10000 ms loop  -- Simulate for 1 millisecond
            clk_i <= '0';
            wait for CLK_PERIOD / 2;
            clk_i <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
    	rstn_i <= '0';
        -- Wait for a few clock cycles before starting the test
        wait for CLK_PERIOD * 10;
    	rstn_i <= '1';

        -- Set initial values
        clock_down <= '0';
        clock_up <= '0';
        hrs_min <= '0';
        sec_plus <= '1';

        wait for CLK_PERIOD * 10;
        sec_plus <= '0';
        wait for CLK_PERIOD * 10;
        sec_plus <= '1';
        
        wait for CLK_PERIOD * 3600*2;
        wait;
    end process;

end Behavioral;
