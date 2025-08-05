-- dip_8304.vhd -- 8304 Octal Latch

library ieee;
use ieee.std_logic_1164.all;

entity dip_8304 is port (
  p1 : in std_logic;    -- D0
  p2 : in std_logic;    -- D1
  p3 : in std_logic;    -- D2
  p4 : in std_logic;    -- D3
  p5 : in std_logic;    -- D4
  p6 : in std_logic;    -- D5
  p7 : in std_logic;    -- D6
  p8 : in std_logic;    -- D7
  p9 : in std_logic;    -- G
  p10 : in std_logic;   -- GND
  p11 : in std_logic;   -- LE
  p12 : in std_logic;   -- Q7
  p13 : in std_logic;   -- Q6
  p14 : in std_logic;   -- Q5
  p15 : in std_logic;   -- Q4
  p16 : in std_logic;   -- Q3
  p17 : in std_logic;   -- Q2
  p18 : in std_logic;   -- Q1
  p19 : in std_logic;   -- Q0
  p20 : in std_logic    -- VCC
  );
end entity;

architecture dip of dip_8304 is
begin
  -- TODO: Implement 8304 functionality
end architecture;