library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity blinky is
    Port ( 
        clk : in std_logic;
        sw : in std_logic;
        led1, led2, led3, led4, led5, led6, led7, led8, led9, led10, led11, led12, led13, led14, led15, led16 : out std_logic
         );
end blinky;

architecture Behavioral of blinky is
    type state is (LED_On, LED_Off);
    signal s: state;
    signal counter : unsigned(24 downto 0);
begin

    blinker: process (clk) 
    begin 
        if rising_edge(clk) then 
            case (s) is 
                when LED_On => 
                    led1 <= '1';
                    led2 <= '1';
                    led3 <= '1';
                    led4 <= '1';
                    led5 <= '1';
                    led6 <= '1';
                    led7 <= '1';
                    led8 <= '1';
                    led9 <= '1';
                    led10 <= '1';
                    led11 <= '1';
                    led12 <= '1';
                    led13 <= '1';
                    led14 <= '1';
                    led15 <= '1';
                    led16 <= '1';
                    
                    
                    
                    
                when LED_Off => 
                    led1  <= '0';
                    led2  <= '0';
                    led3  <= '0';
                    led4  <= '0';
                    led5  <= '0';
                    led6  <= '0';
                    led7  <= '0';
                    led8  <= '0';
                    led9  <= '0';
                    led10  <= '0';
                    led11  <= '0';
                    led12  <= '0';
                    led13  <= '0';
                    led14  <= '0';
                    led15  <= '0';
                    led16  <= '0';
            end case;
            
            if (counter >= 30000000 and s = LED_On) then 
                counter <= '0' & X"000000";
                s <= LED_off;
            elsif (counter >= 30000000 and s = LED_Off) then 
                counter <= '0' & X"000000"; 
                s <= LED_on; 
            else 
                counter <= counter + 1;
            end if; 
        end if;
    end process;

end Behavioral;