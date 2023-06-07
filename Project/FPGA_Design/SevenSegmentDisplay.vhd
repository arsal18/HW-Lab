library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Add this line to include the necessary library

entity SevenSegmentDisplay is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           value : in  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0));
end SevenSegmentDisplay;

architecture Behavioral of SevenSegmentDisplay is
    signal counter : integer range 0 to 24999999 := 0; -- Assuming 100MHz clock frequency

    type seven_segment is array (0 to 9) of std_logic_vector(6 downto 0);
    constant segment_table : seven_segment := (
        "1000000", -- 0
        "1111001", -- 1
        "0100100", -- 2
        "0110000", -- 3
        "0011001", -- 4
        "0010010", -- 5
        "0000010", -- 6
        "1111000", -- 7
        "0000000", -- 8
        "0010000"  -- 9
    );

    signal display_value : std_logic_vector(6 downto 0);

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                counter <= 0;
                display_value <= "1000000"; -- Initialize to display 0
            else
                counter <= counter + 1;
                if counter = 24999999 then
                    counter <= 0;
                    display_value <= segment_table(to_integer(unsigned(value)));
                end if;
            end if;
        end if;
    end process;

    seg <= display_value;

end Behavioral;
