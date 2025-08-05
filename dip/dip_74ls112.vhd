-- dip_74ls112.vhd -- 74LS112 Dual J-K Flip-Flop

library ieee;
use ieee.std_logic_1164.all;

entity dip_74ls112 is port (
  p1 : in std_logic;    -- 1CLK
  p2 : in std_logic;    -- 1K
  p3 : in std_logic;    -- 1J
  p4 : in std_logic;    -- 1PR
  p5 : in std_logic;    -- 1Q
  p6 : in std_logic;    -- 1QN
  p7 : in std_logic;    -- 1CLR
  p8 : in std_logic;    -- GND
  p9 : in std_logic;    -- 2CLR
  p10 : in std_logic;   -- 2QN
  p11 : in std_logic;   -- 2Q
  p12 : in std_logic;   -- 2PR
  p13 : in std_logic;   -- 2J
  p14 : in std_logic;   -- 2K
  p15 : in std_logic;   -- 2CLK
  p16 : in std_logic    -- VCC
  );
end entity;

architecture dip of dip_74ls112 is
begin
  -- TODO: Implement 74LS112 functionality
end architecture;