library ieee;
use ieee.std_logic_1164.all;

entity dip_74s153 is
  port (
    p1  : in  std_logic;                -- sel
    p2  : in  std_logic;                -- i0a
    p3  : in  std_logic;                -- i1a
    p4  : in  std_logic;                -- i2a
    p5  : in  std_logic;                -- i3a
    p6  : in  std_logic;                -- ce_a_n
    p7  : out std_logic;                -- qa
    p9  : out std_logic;                -- qb
    p10 : in  std_logic;                -- ce_b_n
    p11 : in  std_logic;                -- i3b
    p12 : in  std_logic;                -- i2b
    p13 : in  std_logic;                -- i1b
    p14 : in  std_logic;                -- i0b
    p15 : in  std_logic                 -- sel_b
    );
end entity;

architecture dip of dip_74s153 is
begin
  u : entity work.sn74153
    port map (
      sela   => p1,
      selb   => p15,
      enb1_n => p6,
      g1c0   => p2,
      g1c1   => p3,
      g1c2   => p4,
      g1c3   => p5,
      g1y    => p7,
      enb2_n => p10,
      g2c0   => p14,
      g2c1   => p13,
      g2c2   => p12,
      g2c3   => p11,
      g2y    => p9
      );
end architecture; 
