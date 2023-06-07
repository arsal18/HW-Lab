library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AlarmClock is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           set_time : in  STD_LOGIC;
           time_in : in  STD_LOGIC_VECTOR (3 downto 0);
           set_alarm : in  STD_LOGIC;
           alarm_in : in  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0));
end AlarmClock;

architecture Behavioral of AlarmClock is
    signal clk_divider : std_logic;
    signal time_value : std_logic_vector(3 downto 0);
    signal alarm_value : std_logic_vector(3 downto 0);

begin

    clock_div: entity work.ClockDivider
        port map (clk_in => clk, clk_out => clk_divider);

    display: entity work.SevenSegmentDisplay
        port map (clk => clk_divider, reset => reset, value => time_value, seg => seg);

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                time_value <= "0000"; -- Initialize time to 0
                alarm_value <= "0000"; -- Initialize alarm to 0
            else
                if set_time = '1' then
                    time_value <= time_in; -- Set the time
                end if;

                if set_alarm = '1' then
                    alarm_value <= alarm_in; -- Set the alarm
                end if;
            end if;
        end if;
    end process;

end Behavioral;

