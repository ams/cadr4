library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.sn74138;

entity dip_74s138 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : out std_logic;
    p11 : out std_logic;
    p12 : out std_logic;
    p13 : out std_logic;
    p14 : out std_logic;
    p15 : out std_logic
    );
end entity;

architecture dip of dip_74s138 is
begin
  U1 : sn74138
    port map (
      y7  => p7,
      y6  => p9,
      y5  => p10,
      y4  => p11,
      y3  => p12,
      y2  => p13,
      y1  => p14,
      y0  => p15,
      sel2 => p3,
      sel1 => p2,
      sel0 => p1,
      g1  => p6,
      g2a => p5,
      g2b => p4
      );
end architecture;
