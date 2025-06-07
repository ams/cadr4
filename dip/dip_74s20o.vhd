library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity dip_74s20o is
  port (
    p1  : in  std_logic;  -- g1a
    p2  : in  std_logic;  -- g1b
    p4  : in  std_logic;  -- g1c
    p5  : in  std_logic;  -- g1d
    p6  : out std_logic;  -- g1y_n
    p8  : out std_logic;  -- g2y_n
    p9  : in  std_logic;  -- g2a
    p10 : in  std_logic;  -- g2b
    p12 : in  std_logic;  -- g2c
    p13 : in  std_logic   -- g2d
    );
end entity;

architecture dip of dip_74s20o is
begin

  U_sn7420 : sn7420
    port map (
      g1a   => p1,
      g1b   => p2,
      g1c   => p4,
      g1d   => p5,
      g1y_n => p6,
      g2y_n => p8,
      g2a   => p9,
      g2b   => p10,
      g2c   => p12,
      g2d   => p13
      );

end architecture; 