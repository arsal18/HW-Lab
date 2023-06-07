library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DigitalAlarmClock_TB is
end DigitalAlarmClock_TB;

architecture Behavioral of DigitalAlarmClock_TB is

    signal clk         : std_logic := '0';
    signal reset       : std_logic := '1';
    signal set_time    : std_logic := '0';
    signal time_in     : std_logic_vector(3 downto 0) := "0000";
    signal set_alarm   : std_logic := '0';
    signal alarm_in    : std_logic_vector(3 downto 0) := "0000";
    signal alarm       : std_logic;

    constant CLOCK_PERIOD : time := 10 ns; -- Clock period of 10 ns

begin

    -- Instantiate the unit under test
    uut: entity work.DigitalAlarmClock
        port map (
            clk => clk,
            reset => reset,
            set_time => set_time,
            time_in => time_in,
            set_alarm => set_alarm,
            alarm_in => alarm_in,
            alarm => alarm
        );

    -- Clock process
    clk_process : process
    begin
        while now < 100 ns loop  -- Simulate for 100 ns
            clk <= '0';
            wait for CLOCK_PERIOD / 2;
            clk <= '1';
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_process : process
    begin
        reset <= '1'; -- Initialize reset
        set_time <= '0'; -- Set time to initial value
        time_in <= "0000"; -- Set initial time
        set_alarm <= '0'; -- Set alarm to initial value
        alarm_in <= "0000"; -- Set initial alarm

        wait for 10 ns;
        reset <= '0'; -- Deassert reset

        wait for 20 ns;
        set_time <= '1'; -- Enable set time
        time_in <= "0101"; -- Set time to 5 seconds

        wait for 30 ns;
        set_time <= '0'; -- Disable set time

        wait for 50 ns;
        set_alarm <= '1'; -- Enable set alarm
        alarm_in <= "0110"; -- Set alarm to 6 seconds

        wait for 70 ns;
        set_alarm <= '0'; -- Disable set alarm

        wait;
    end process;

end Behavioral;

