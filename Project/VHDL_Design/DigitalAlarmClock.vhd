library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DigitalAlarmClock is
    Port (
        clk       : in  STD_LOGIC;        -- Clock input
        reset     : in  STD_LOGIC;        -- Reset input
        set_time  : in  STD_LOGIC;        -- Set time enable input
        time_in   : in  STD_LOGIC_VECTOR(3 downto 0);  -- Time input (BCD format)
        set_alarm : in  STD_LOGIC;        -- Set alarm enable input
        alarm_in  : in  STD_LOGIC_VECTOR(3 downto 0); -- Alarm input (BCD format)
        alarm     : out STD_LOGIC         -- Alarm output
    );
end DigitalAlarmClock;

architecture Behavioral of DigitalAlarmClock is
    signal current_time : STD_LOGIC_VECTOR(3 downto 0) := "0000";  -- Current time (BCD format)
    signal current_alarm : STD_LOGIC_VECTOR(3 downto 0) := "0000"; -- Current alarm (BCD format)
begin

    process (clk, reset)
    begin
        if (reset = '1') then
            current_time <= "0000";
            current_alarm <= "0000";
            alarm <= '0';
        elsif rising_edge(clk) then
            if (set_time = '1') then
                current_time <= time_in;
            end if;

            if (set_alarm = '1') then
                current_alarm <= alarm_in;
            end if;

            if (current_time = current_alarm) then
                alarm <= '1'; -- Trigger alarm
            else
                alarm <= '0'; -- Reset alarm
            end if;
        end if;
    end process;

end Behavioral;

