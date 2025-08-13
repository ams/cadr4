library ieee;
use ieee.std_logic_1164.all;

use work.sn74.sn74124;

-- see sn74124 for more info

entity dip_74ls124 is port (
  --p1  : in  std_logic;                  -- 2fc
  p2  : in std_logic;                  -- 1fc
  p3  : in std_logic;                  -- 1rng
  p4  : in std_logic;                  -- 1cx1
  p5  : in std_logic;                  -- 1cx2
  p6  : in std_logic;                  -- -1en
  p7  : out std_logic                  -- 1y
  --p8  : in  std_logic;                  -- gnd
  --p9  : in  std_logic;                  -- gnd
  --p10 : in  std_logic;                  -- 2y
  --p11 : out std_logic;                  -- -2en
  --p12 : in  std_logic;                  -- 2cx1
  --p13 : out std_logic;                  -- 2cx2
  --p14 : in  std_logic;                  -- 2rng
  --p15 : in  std_logic;                  -- osc vcc
  --p16 : in  std_logic                   -- vcc
  );
end entity;

architecture dip of dip_74ls124 is
begin
  u1 : sn74124 port map (
    en_n => p6,
    y => p7
  );
end architecture;