-- Testbench for 1-bit Half Adder
library ieee;
use ieee.std_logic_1164.all;

entity HalfAdder_TB is
end entity HalfAdder_TB;

architecture Behavioral_TB of HalfAdder_TB is
  -- Component declaration for the half adder
  component HalfAdder is
    port (
      A, B: in std_logic;
      Sum, Carry: out std_logic
    );
  end component HalfAdder;
  
  -- Signal declarations
  signal A_TB, B_TB: std_logic;
  signal Sum_TB, Carry_TB: std_logic;
  
begin
  -- Instantiate the half adder component
  UUT: HalfAdder port map (A_TB, B_TB, Sum_TB, Carry_TB);
  
  -- Stimulus process
  stim_proc: process
  begin
    -- Test case 1: A=0, B=0
    A_TB <= '0';
    B_TB <= '0';
    wait for 10 ns;
    
    -- Test case 2: A=0, B=1
    A_TB <= '0';
    B_TB <= '1';
    wait for 10 ns;
    
    -- Test case 3: A=1, B=0
    A_TB <= '1';
    B_TB <= '0';
    wait for 10 ns;
    
    -- Test case 4: A=1, B=1
    A_TB <= '1';
    B_TB <= '1';
    wait for 10 ns;
    
    -- End simulation
    wait;
  end process stim_proc;
  
end architecture Behavioral_TB;
