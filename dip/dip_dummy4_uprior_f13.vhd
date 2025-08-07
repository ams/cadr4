library ieee;
use ieee.std_logic_1164.all;

entity dip_dummy4_uprior_f13 is 
  port (
    p1  : inout std_logic; 
    p2  : in std_logic;
    p3  : inout std_logic
  );
end entity;

architecture dip of dip_dummy4_uprior_f13 is
begin
  p1 <= 'H';
  p3 <= 'L';
end architecture;