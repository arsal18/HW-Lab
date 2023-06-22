library ieee;
use ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;


entity Temp_on_7_Seg is
   port(
      clk_i : in std_logic;
      rstn_i : in std_logic;
      seg_o : out std_logic_vector(7 downto 0);
      an_o  : out std_logic_vector(7 downto 0);
      LED  : out std_logic_vector(15 downto 0);
      alram_down : in STD_LOGIC;
      alram_up : in STD_LOGIC;
      clock_down : in STD_LOGIC;
      clock_up : in STD_LOGIC;
      hrs_min : in STD_LOGIC
   );
end Temp_on_7_Seg;

architecture Behavioral of Temp_on_7_Seg is

 
component Seven_Segment is
port(
   ck       : in  std_logic;                     
   number   : in  std_logic_vector(63 downto 0); 
   seg      : out std_logic_vector(7 downto 0);  
   an       : out std_logic_vector(7 downto 0)); 
end component;

component seg_decode is
port(
      hex_in : in STD_LOGIC_VECTOR (3 downto 0);
      seg_out : out STD_LOGIC_VECTOR (7 downto 0)); 
end component;

component One_sec is
port( clk_i    : in STD_LOGIC;
      rstn_i   : in STD_LOGIC;
      sec_plus : out STD_LOGIC);
end component;

component Alarm_Time is
Port (  clk_i : in STD_LOGIC;
        rstn_i : in STD_LOGIC;
        alram_down : in STD_LOGIC;
        alram_up : in STD_LOGIC;
        hrs_min : in STD_LOGIC;
        sec_plus : in STD_LOGIC;
        min_out : out integer range 0 to 59;
        hrs_out : out integer range 0 to 23);
end component;

component Clock_Time is
Port (  clk_i : in STD_LOGIC;
        rstn_i : in STD_LOGIC;
        clock_down : in STD_LOGIC;
        clock_up : in STD_LOGIC;
        hrs_min : in STD_LOGIC;
        sec_plus : in STD_LOGIC;
        sec_out : out integer range 0 to 59;
        min_out : out integer range 0 to 59;
        hrs_out : out integer range 0 to 23);
end component;


signal dispVal : std_logic_vector(63 downto 0);


------------------------------------------------------------------------   
signal hex_in_0 : std_logic_vector(3 downto 0);
signal hex_in_1 : std_logic_vector(3 downto 0);
signal hex_in_2 : std_logic_vector(3 downto 0);
signal hex_in_3 : std_logic_vector(3 downto 0);
signal hex_in_4 : std_logic_vector(3 downto 0);
signal hex_in_5 : std_logic_vector(3 downto 0);
signal hex_in_6 : std_logic_vector(3 downto 0);
signal hex_in_7 : std_logic_vector(3 downto 0);

signal seg_out_0 : std_logic_vector(7 downto 0);
signal seg_out_1 : std_logic_vector(7 downto 0);
signal seg_out_2 : std_logic_vector(7 downto 0);
signal seg_out_3 : std_logic_vector(7 downto 0);
signal seg_out_4 : std_logic_vector(7 downto 0);
signal seg_out_5 : std_logic_vector(7 downto 0);
signal seg_out_6 : std_logic_vector(7 downto 0);
signal seg_out_7 : std_logic_vector(7 downto 0);

signal sec_plus : std_logic;

signal alarm_min : integer range 0 to 59;
signal alarm_hrs : integer range 0 to 23;

signal clock_sec : integer range 0 to 59;
signal clock_min : integer range 0 to 59;
signal clock_hrs : integer range 0 to 23;

signal LED_int : std_logic_vector(15 downto 0) := x"FFFF";

------------------------------------------------------------------------   

begin

   dispVal <=  seg_out_7 & seg_out_6 & seg_out_5 & seg_out_4 & seg_out_3 & seg_out_2 & seg_out_1 & seg_out_0;
------------------------------------------------------------------------   
   Disp: Seven_Segment
   port map(
      ck    => clk_i,
      number    => dispVal,
      seg    => seg_o,
      an   => an_o);
------------------------------------------------------------------------
   init0_seg_decode: seg_decode
   port map(
      hex_in    => hex_in_0,
      seg_out   => seg_out_0);
------------------------------------------------------------------------   
   init1_seg_decode: seg_decode
   port map(
      hex_in    => hex_in_1,
      seg_out   => seg_out_1);
------------------------------------------------------------------------
   init2_seg_decode: seg_decode
   port map(
      hex_in    => hex_in_2,
      seg_out   => seg_out_2);
------------------------------------------------------------------------
   init3_seg_decode: seg_decode
   port map(
      hex_in    => hex_in_3,
      seg_out   => seg_out_3);
------------------------------------------------------------------------
   init4_seg_decode: seg_decode
   port map(
      hex_in    => hex_in_4,
      seg_out   => seg_out_4);
------------------------------------------------------------------------
   init5_seg_decode: seg_decode
   port map(
      hex_in    => hex_in_5,
      seg_out   => seg_out_5);
------------------------------------------------------------------------
   init6_seg_decode: seg_decode
   port map(
      hex_in    => hex_in_6,
      seg_out   => seg_out_6);
------------------------------------------------------------------------
   init7_seg_decode: seg_decode
   port map(
      hex_in    => hex_in_7,
      seg_out   => seg_out_7);
------------------------------------------------------------------------
   init_One_sec: One_sec
   port map(
      clk_i    => clk_i,
      rstn_i    => rstn_i,
      sec_plus   => sec_plus);
------------------------------------------------------------------------
   
   init_Alarm_Time: Alarm_Time
        port map (
            clk_i => clk_i,
            rstn_i => rstn_i,
            alram_down => alram_down,
            alram_up => alram_up,
            hrs_min => hrs_min,
            sec_plus => sec_plus,
            min_out => alarm_min,
            hrs_out => alarm_hrs
        );
------------------------------------------------------------------------
   init_Clock_Time: Clock_Time
        port map (
            clk_i => clk_i,
            rstn_i => rstn_i,
            clock_down => clock_down,
            clock_up => clock_up,
            hrs_min => hrs_min,
            sec_plus => sec_plus,
            sec_out => clock_sec,
            min_out => clock_min,
            hrs_out => clock_hrs
        );
------------------------------------------------------------------------
   
   hex_in_0 <= std_logic_vector(to_signed((clock_min mod 10),4));
   hex_in_1 <= std_logic_vector(to_signed((clock_min / 10),4));
   hex_in_2 <= std_logic_vector(to_signed((clock_hrs mod 10),4));
   hex_in_3 <= std_logic_vector(to_signed((clock_hrs / 10),4));
   hex_in_4 <= std_logic_vector(to_signed((alarm_min mod 10),4));
   hex_in_5 <= std_logic_vector(to_signed((alarm_min / 10),4));
   hex_in_6 <= std_logic_vector(to_signed((alarm_hrs mod 10),4));
   hex_in_7 <= std_logic_vector(to_signed((alarm_hrs / 10),4));

------------------------------------------------------------------------
   flash_process : process( clk_i, rstn_i )
   begin
      if rstn_i = '0' then
            LED_int <= x"0000"; -- Reset the counter
     elsif rising_edge(clk_i) then
         if ((clock_min = alarm_min) and (clock_hrs = alarm_hrs)) then
            if (sec_plus = '1') then
               if LED_int = x"0000" then
                  LED_int <= x"FFFF";
               else
                  LED_int <= x"0000";
               end if ;
            end if ;
         else
            LED_int <= x"0000";
         end if ;
     end if ;


   end process ; -- flash_process
   
   LED <= LED_int;
end Behavioral;

