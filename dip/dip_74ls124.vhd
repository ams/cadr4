library ieee;
use ieee.std_logic_1164.all;

entity dip_74ls124 is port (
  p1  : in  std_logic;                  -- c1a
  p2  : in  std_logic;                  -- c1b
  p3  : out std_logic;                  -- y1
  p4  : in  std_logic;                  -- r1/c1
  p5  : in  std_logic;                  -- r2/c2
  p6  : out std_logic;                  -- y2
  p7  : in  std_logic;                  -- c2b
  p8  : in  std_logic;                  -- gnd
  p9  : in  std_logic;                  -- c2a
  p10 : in  std_logic;                  -- disable2
  p11 : out std_logic;                  -- freq range2
  p12 : in  std_logic;                  -- disable1
  p13 : out std_logic;                  -- freq range1
  p14 : in  std_logic;                  -- vcc
  p15 : in  std_logic;                  -- enable2
  p16 : in  std_logic                   -- enable1
  );
end entity;

architecture empty of dip_74ls124 is
begin
end architecture;