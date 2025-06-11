library ieee;
use ieee.std_logic_1164.all;

use work.dip.all;


entity dip_25s10 is
  port (
    p1  : in  std_logic;                -- i_3
    p2  : in  std_logic;                -- i_2
    p3  : in  std_logic;                -- i_1
    p4  : in  std_logic;                -- i0
    p5  : in  std_logic;                -- i1
    p6  : in  std_logic;                -- i2
    p7  : in  std_logic;                -- i3
    p9  : in  std_logic;                -- sel1
    p10 : in  std_logic;                -- sel0
    p11 : out std_logic;                -- o3
    p12 : out std_logic;                -- o2
    p13 : in  std_logic;                -- ce_n
    p14 : out std_logic;                -- o1
    p15 : out std_logic                 -- o0
    );
end dip_25s10;

architecture dip of dip_25s10 is
begin

  -- p8 and p16 are gnd and vcc for dip_25s10
  -- am2510 doesn't have gnd and vcc
  -- so they are not mapped.

  ttl_inst : entity work.am2510
    port map (
      i_3  => p1,
      i_2  => p2,
      i_1  => p3,
      i0   => p4,
      i1   => p5,
      i2   => p6,
      i3   => p7,
      sel1 => p9,
      sel0 => p10,
      o3   => p11,
      o2   => p12,
      ce_n => p13,
      o1   => p14,
      o0   => p15
      );

end architecture; 