library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity dip_74s258 is
  port (
    p1  : in  std_logic;  -- sel
    p2  : in  std_logic;  -- d0
    p3  : in  std_logic;  -- d1
    p4  : out std_logic;  -- dy
    p5  : in  std_logic;  -- c0
    p6  : in  std_logic;  -- c1
    p7  : out std_logic;  -- cy
    p9  : out std_logic;  -- by
    p10 : in  std_logic;  -- b1
    p11 : in  std_logic;  -- b0
    p12 : out std_logic;  -- ay
    p13 : in  std_logic;  -- a1
    p14 : in  std_logic;  -- a0
    p15 : in  std_logic   -- enb_n
    );
end entity;

architecture dip of dip_74s258 is
begin

  U_sn74258 : sn74258
    port map (
      sel   => p1,
      d0    => p2,
      d1    => p3,
      dy    => p4,
      c0    => p5,
      c1    => p6,
      cy    => p7,
      by    => p9,
      b1    => p10,
      b0    => p11,
      ay    => p12,
      a1    => p13,
      a0    => p14,
      enb_n => p15
      );

end architecture; 