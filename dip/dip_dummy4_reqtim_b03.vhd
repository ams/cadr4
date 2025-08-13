library ieee;
use ieee.std_logic_1164.all;

-- There is a 100pF capacitor between p2 and p3
-- Not required for digital simulation

entity dip_dummy4_reqtim_b03 is 
  port (
    p2  : inout std_logic;
    p3  : inout std_logic
  );
end entity;

architecture dip of dip_dummy4_reqtim_b03 is
begin
end architecture;