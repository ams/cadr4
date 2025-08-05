-- dip_dm8838.vhd -- DM8838 Quad 2-Input Multiplexer

library ieee;
use ieee.std_logic_1164.all;

entity dip_dm8838 is port (
  p1 : in std_logic;    -- S1B
  p2 : in std_logic;    -- I1B
  p3 : in std_logic;    -- I0B
  p4 : in std_logic;    -- ZB
  p5 : in std_logic;    -- I0A
  p6 : in std_logic;    -- I1A
  p7 : in std_logic;    -- GND
  p8 : in std_logic;    -- S1A
  p9 : in std_logic;    -- S0
  p10 : in std_logic;   -- I1C
  p11 : in std_logic;   -- I0C
  p12 : in std_logic;   -- S1C
  p13 : in std_logic;   -- I0D
  p14 : in std_logic;   -- VCC
  p15 : in std_logic;   -- S1D
  p16 : in std_logic    -- I1D
  );
end entity;

architecture dip of dip_dm8838 is
begin
  -- TODO: Implement DM8838 functionality
end architecture;