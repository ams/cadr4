-- dip_74ls27.vhd -- 74LS27 Triple 3-Input NOR Gate

library ieee;
use ieee.std_logic_1164.all;

entity dip_74ls27 is port (
  p1 : in std_logic;    -- 1A
  p2 : in std_logic;    -- 1B
  p3 : in std_logic;    -- 1C
  p4 : in std_logic;    -- 1Y
  p5 : in std_logic;    -- 2A
  p6 : in std_logic;    -- 2B
  p7 : in std_logic;    -- GND
  p8 : in std_logic;    -- 2Y
  p9 : in std_logic;    -- 2C
  p10 : in std_logic;   -- 3A
  p11 : in std_logic;   -- 3B
  p12 : in std_logic;   -- 3Y
  p13 : in std_logic;   -- 3C
  p14 : in std_logic    -- VCC
  );
end entity;

architecture dip of dip_74ls27 is
begin
  -- TODO: Implement 74LS27 functionality
end architecture;