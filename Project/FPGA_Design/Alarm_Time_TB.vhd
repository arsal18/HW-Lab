library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Alarm_Time_TB is
end Alarm_Time_TB;

architecture Behavioral of Alarm_Time_TB is
    constant CLK_PERIOD : time := 10 ns; -- Clock period in nanoseconds

    signal clk_i : std_logic := '0';
    signal rstn_i : std_logic := '1';
    signal alram_down : std_logic := '0';
    signal alram_up : std_logic := '0';
    signal hrs_min : std_logic := '0';
    signal sec_plus : std_logic := '0';
    signal min_out : integer;
    signal hrs_out : integer;

begin
    -- Instantiate the unit under test (UUT)
    uut: entity work.Alarm_Time
        port map (
            clk_i => clk_i,
            rstn_i => rstn_i,
            alram_down => alram_down,
            alram_up => alram_up,
            hrs_min => hrs_min,
            sec_plus => sec_plus,
            min_out => min_out,
            hrs_out => hrs_out
        );

    -- Clock generation process
    clk_process: process
    begin
        while now < 1 ms loop  -- Simulate for 1 millisecond
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
        -- Wait for a few clock cycles before starting the test
        wait for CLK_PERIOD * 10;

        -- Set initial values
        alram_down <= '0';
        alram_up <= '0';
        hrs_min <= '0';
        sec_plus <= '0';

        -- Test scenario 1: Increment minutes
        sec_plus <= '1';
        wait for CLK_PERIOD * 100;
        assert min_out = 1
            report "Failed test scenario 1: Incorrect minute count."
            severity error;

        -- Test scenario 2: Increment hours
        sec_plus <= '1';
        hrs_min <= '1'; -- Select hours
        alram_up <= '1'; -- Increment
        wait for CLK_PERIOD * 100;
        assert hrs_out = 1
            report "Failed test scenario 2: Incorrect hour count."
            severity error;

        -- Test scenario 3: Decrement minutes
        sec_plus <= '1';
        hrs_min <= '0'; -- Select minutes
        alram_down <= '1'; -- Decrement
        wait for CLK_PERIOD * 100;
        assert min_out = 0
            report "Failed test scenario 3: Incorrect minute count."
            severity error;

        -- Test scenario 4: Decrement hours
        sec_plus <= '1';
        hrs_min <= '1'; -- Select hours
        alram_down <= '1'; -- Decrement
        wait for CLK_PERIOD * 100;
        assert hrs_out = 0
            report "Failed test scenario 4: Incorrect hour count."
            severity error;

        wait;
    end process;

end Behavioral;
