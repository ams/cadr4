library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity dip_74s175 is
  port (
    p1  : in  std_logic;  -- clr_n
    p2  : out std_logic;  -- q0
    p3  : out std_logic;  -- q0_n
    p4  : in  std_logic;  -- d0
    p5  : in  std_logic;  -- d1
    p6  : out std_logic;  -- q1_n
    p7  : out std_logic;  -- q1
    p9  : in  std_logic;  -- clk
    p10 : out std_logic;  -- q2
    p11 : out std_logic;  -- q2_n
    p12 : in  std_logic;  -- d2
    p13 : in  std_logic;  -- d3
    p14 : out std_logic;  -- q3_n
    p15 : out std_logic   -- q3
    );
end entity;

architecture dip of dip_74s175 is
begin

  U_sn74175 : sn74175
    port map (
      clr_n => p1,
      q0    => p2,
      q0_n  => p3,
      d0    => p4,
      d1    => p5,
      q1_n  => p6,
      q1    => p7,
      clk   => p9,
      q2    => p10,
      q2_n  => p11,
      d2    => p12,
      d3    => p13,
      q3_n  => p14,
      q3    => p15
      );

end architecture; 