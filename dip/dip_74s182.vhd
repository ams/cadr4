library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity dip_74s182 is
  port (
    p1  : in  std_logic;  -- y1
    p2  : in  std_logic;  -- x1
    p3  : in  std_logic;  -- y0
    p4  : in  std_logic;  -- x0
    p5  : in  std_logic;  -- y3
    p6  : in  std_logic;  -- x3
    p7  : out std_logic;  -- xout
    p9  : out std_logic;  -- cout2_n
    p10 : out std_logic;  -- yout
    p11 : out std_logic;  -- cout1_n
    p12 : out std_logic;  -- cout0_n
    p13 : in  std_logic;  -- cin_n
    p14 : in  std_logic;  -- y2
    p15 : in  std_logic   -- x2
    );
end entity;

architecture dip of dip_74s182 is
begin

  U_sn74182 : sn74182
    port map (
      y1      => p1,
      x1      => p2,
      y0      => p3,
      x0      => p4,
      y3      => p5,
      x3      => p6,
      xout    => p7,
      cout2_n => p9,
      yout    => p10,
      cout1_n => p11,
      cout0_n => p12,
      cin_n   => p13,
      y2      => p14,
      x2      => p15
      );

end architecture; 