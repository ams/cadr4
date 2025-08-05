-- dip_26s10.vhd -- 26S10 Quad Bus Driver

library ieee;
use ieee.std_logic_1164.all;

entity dip_26s10 is port (
  p1 : in std_logic;    -- VCC
  p2 : in std_logic;    -- I1
  p3 : in std_logic;    -- I2
  p4 : in std_logic;    -- O1
  p5 : in std_logic;    -- O2
  p6 : in std_logic;    -- I3
  p7 : in std_logic;    -- I4
  p8 : in std_logic;    -- GND
  p9 : in std_logic;    -- O4
  p10 : in std_logic;   -- I4
  p11 : in std_logic;   -- O3
  p12 : in std_logic;   -- G
  p13 : in std_logic;   -- O1
  p14 : in std_logic;   -- I1
  p15 : in std_logic;   -- O2
  p16 : in std_logic    -- VCC
  );
end entity;

architecture dip of dip_26s10 is
begin
  -- TODO: Implement 26S10 functionality
end architecture;