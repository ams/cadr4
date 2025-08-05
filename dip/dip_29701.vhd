-- dip_29701.vhd -- 29701 Quad Latch

library ieee;
use ieee.std_logic_1164.all;

entity dip_29701 is port (
  p1 : in std_logic;    -- VCC
  p2 : in std_logic;    -- D3
  p3 : in std_logic;    -- D2
  p4 : in std_logic;    -- Q3
  p5 : in std_logic;    -- Q2
  p6 : in std_logic;    -- Q1
  p7 : in std_logic;    -- Q0
  p8 : in std_logic;    -- GND
  p9 : in std_logic;    -- D1
  p10 : in std_logic;   -- D0
  p11 : in std_logic;   -- D1
  p12 : in std_logic;   -- D0
  p13 : in std_logic;   -- G1
  p14 : in std_logic;   -- G2
  p15 : in std_logic;   -- LE
  p16 : in std_logic    -- VCC
  );
end entity;

architecture dip of dip_29701 is
begin
  -- TODO: Implement 29701 functionality
end architecture;