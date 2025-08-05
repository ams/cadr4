-- dip_74ls74.vhd -- 74LS74 Dual D-Type Flip-Flop

library ieee;
use ieee.std_logic_1164.all;

entity dip_74ls74 is port (
  p1 : in std_logic;    -- 1CLR
  p2 : in std_logic;    -- 1D
  p3 : in std_logic;    -- 1CLK
  p4 : in std_logic;    -- 1PR
  p5 : in std_logic;    -- 1Q
  p6 : in std_logic;    -- 1QN
  p7 : in std_logic;    -- GND
  p8 : in std_logic;    -- 2QN
  p9 : in std_logic;    -- 2Q
  p10 : in std_logic;   -- 2PR
  p11 : in std_logic;   -- 2CLK
  p12 : in std_logic;   -- 2D
  p13 : in std_logic;   -- 2CLR
  p14 : in std_logic    -- VCC
  );
end entity;

architecture dip of dip_74ls74 is
begin
  -- TODO: Implement 74LS74 functionality
end architecture;