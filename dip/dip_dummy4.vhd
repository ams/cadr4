library ieee;
use ieee.std_logic_1164.all;

entity dip_dummy4 is port (
  p1  : in std_logic; 
  p2  : in std_logic;
  p3  : out std_logic;
  p4  : out std_logic
  );
end entity;

architecture empty of dip_dummy4 is
begin
end architecture;