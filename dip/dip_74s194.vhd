library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity dip_74s194 is
  port (
    p1  : in  std_logic;  -- clr_n
    p2  : in  std_logic;  -- sir
    p3  : in  std_logic;  -- i0
    p4  : in  std_logic;  -- i1
    p5  : in  std_logic;  -- i2
    p6  : in  std_logic;  -- i3
    p7  : in  std_logic;  -- sil
    p9  : in  std_logic;  -- s0
    p10 : in  std_logic;  -- s1
    p11 : in  std_logic;  -- clk
    p12 : out std_logic;  -- q3
    p13 : out std_logic;  -- q2
    p14 : out std_logic;  -- q1
    p15 : out std_logic   -- q0
    );
end entity;

architecture dip of dip_74s194 is
begin

  U_sn74194 : sn74194
    port map (
      clr_n => p1,
      sir   => p2,
      i0    => p3,
      i1    => p4,
      i2    => p5,
      i3    => p6,
      sil   => p7,
      s0    => p9,
      s1    => p10,
      clk   => p11,
      q3    => p12,
      q2    => p13,
      q1    => p14,
      q0    => p15
      );

end architecture; 