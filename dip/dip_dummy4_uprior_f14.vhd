library ieee;
use ieee.std_logic_1164.all;

entity dip_dummy4_uprior_f14 is 
  port (
    p1  : inout std_logic
  );
end entity;

architecture dip of dip_dummy4_uprior_f14 is
begin
  p1 <= 'H';
end architecture;