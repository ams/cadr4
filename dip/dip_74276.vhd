-- dip_74276.vhd -- 74276 Quad J-K Flip-Flop

library ieee;
use ieee.std_logic_1164.all;

entity dip_74276 is port (
  p1 : in std_logic;    -- 1CLR
  p2 : in std_logic;    -- 1J
  p3 : in std_logic;    -- 1CLK
  p4 : in std_logic;    -- 1K
  p5 : in std_logic;    -- 1Q
  p6 : in std_logic;    -- 1QN
  p7 : in std_logic;    -- 2CLR
  p8 : in std_logic;    -- 2J
  p9 : in std_logic;    -- 2CLK
  p10 : in std_logic;   -- GND
  p11 : in std_logic;   -- 2K
  p12 : in std_logic;   -- 2Q
  p13 : in std_logic;   -- 2QN
  p14 : in std_logic;   -- 3CLR
  p15 : in std_logic;   -- 3J
  p16 : in std_logic;   -- 3CLK
  p17 : in std_logic;   -- 3K
  p18 : in std_logic;   -- 3Q
  p19 : in std_logic;   -- 3QN
  p20 : in std_logic    -- VCC
  );
end entity;

architecture dip of dip_74276 is
begin
  -- TODO: Implement 74276 functionality
end architecture;