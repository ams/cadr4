library ieee;
use ieee.std_logic_1164.all;

use work.dip.all;


entity dip_7428 is
  port (
    p1  : out std_logic;                -- g1q_n
    p2  : in  std_logic;                -- g1a
    p3  : in  std_logic;                -- g1b
    p4  : out std_logic;                -- g2q_n
    p5  : in  std_logic;                -- g2a
    p6  : in  std_logic;                -- g2b
    p8  : in  std_logic;                -- g3a
    p9  : in  std_logic;                -- g3b
    p10 : out std_logic;                -- g3q_n
    p11 : in  std_logic;                -- g4a
    p12 : in  std_logic;                -- g4b
    p13 : out std_logic                 -- g4q_n
    );
end dip_7428;

architecture dip of dip_7428 is
begin

  -- p7 and p14 are gnd and vcc for dip_7428
  -- sn7428 doesn't have gnd and vcc
  -- so they are not mapped.

  ttl_inst : entity work.sn7428
    port map (
      g1y_n => p1,
      g1a   => p2,
      g1b   => p3,
      g2y_n => p4,
      g2a   => p5,
      g2b   => p6,
      g3a   => p8,
      g3b   => p9,
      g3y_n => p10,
      g4a   => p11,
      g4b   => p12,
      g4y_n => p13
      );

end architecture; 