library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity dip_74s174 is
  port (
    p1  : in  std_logic;  -- clr_n
    p2  : out std_logic;  -- q1
    p3  : in  std_logic;  -- d1
    p4  : in  std_logic;  -- d2
    p5  : out std_logic;  -- q2
    p6  : in  std_logic;  -- d3
    p7  : out std_logic;  -- q3
    p9  : in  std_logic;  -- clk
    p10 : out std_logic;  -- q4
    p11 : in  std_logic;  -- d4
    p12 : out std_logic;  -- q5
    p13 : in  std_logic;  -- d5
    p14 : in  std_logic;  -- d6
    p15 : out std_logic   -- q6
    );
end entity;

architecture dip of dip_74s174 is
begin

  U_sn74174 : sn74174
    port map (
      clr_n => p1,
      q1    => p2,
      d1    => p3,
      d2    => p4,
      q2    => p5,
      d3    => p6,
      q3    => p7,
      clk   => p9,
      q4    => p10,
      d4    => p11,
      q5    => p12,
      d5    => p13,
      d6    => p14,
      q6    => p15
      );

end architecture; 