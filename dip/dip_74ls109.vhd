library ieee;
use ieee.std_logic_1164.all;

library dip;
use dip.dip.all;

library ttl;

entity dip_74ls109 is
  port (
    p1  : in  std_logic;                -- clr1_n
    p2  : in  std_logic;                -- j1
    p3  : in  std_logic;                -- k1_n
    p4  : in  std_logic;                -- clk1
    p5  : in  std_logic;                -- pre1_n
    p6  : out std_logic;                -- q1
    p7  : out std_logic;                -- q1_n
    p9  : out std_logic;                -- q2_n
    p10 : out std_logic;                -- q2
    p11 : in  std_logic;                -- pre2_n
    p12 : in  std_logic;                -- clk2
    p13 : in  std_logic;                -- k2_n
    p14 : in  std_logic;                -- j2
    p15 : in  std_logic                 -- clr2_n
    );
end dip_74ls109;

architecture dip of dip_74ls109 is
begin

  -- p8 and p16 are gnd and vcc for dip_74ls109
  -- sn74109 doesn't have gnd and vcc
  -- so they are not mapped.

  ttl_inst : entity ttl.sn74109
    port map (
      clr1_n => p1,
      j1     => p2,
      k1_n   => p3,
      clk1   => p4,
      pre1_n => p5,
      q1     => p6,
      q1_n   => p7,
      q2_n   => p9,
      q2     => p10,
      pre2_n => p11,
      clk2   => p12,
      k2_n   => p13,
      j2     => p14,
      clr2_n => p15
      );

end architecture; 