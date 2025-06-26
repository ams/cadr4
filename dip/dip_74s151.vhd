library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.all;

entity dip_74s151 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p7  : in  std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
end entity;

architecture dip of dip_74s151 is
begin
  U1 : sn74s151
    port map (
      i0   => p4,
      i1   => p3,
      i2   => p2,
      i3   => p1,
      i4   => p15,
      i5   => p14,
      i6   => p13,
      i7   => p12,

      sel2 => p9,
      sel1 => p10,
      sel0 => p11,
      
      ce_n => p7,
      
      q    => p5,
      q_n  => p6
      );
end architecture;
