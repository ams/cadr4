library ieee;
use ieee.std_logic_1164.all;

entity cosim_test_tb is
end entity;

architecture sim of cosim_test_tb is  
  signal clk : std_logic := '0';
begin    
  clk <= not clk after 1 ns;  
end architecture;