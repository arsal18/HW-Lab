library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity One_sec_TB is
end One_sec_TB;

architecture Behavioral of One_sec_TB is
    constant CLK_PERIOD : time := 10 ns; -- Clock period in nanoseconds

    signal clk_i : std_logic := '0';
    signal rstn_i : std_logic := '1';
    signal sec_plus : std_logic;

begin
    -- Instantiate the unit under test (UUT)
    uut: entity work.One_sec
        port map (
            clk_i => clk_i,
            rstn_i => rstn_i,
            sec_plus => sec_plus
        );

    -- Clock generation process
    clk_process: process
    begin
        while now < 2000 ms loop  -- Simulate for 1 millisecond
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
        -- Wait for a few clock cycles before asserting the reset
        wait for CLK_PERIOD * 10;

        rstn_i <= '0'; -- Assert the reset
        wait for CLK_PERIOD * 5;

        rstn_i <= '1'; -- Deassert the reset

        wait for CLK_PERIOD * 95; -- Wait for 950 milliseconds

        assert sec_plus = '1'
            report "sec_plus signal not asserted when one second has passed."
            severity error;

        wait;
    end process;

end Behavioral;
