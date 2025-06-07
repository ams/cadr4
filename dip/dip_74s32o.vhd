library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity dip_74s32o is
  port (
    p1  : in  std_logic;  -- g1a
    p2  : in  std_logic;  -- g1b
    p3  : out std_logic;  -- g1y
    p4  : in  std_logic;  -- g2a
    p5  : in  std_logic;  -- g2b
    p6  : out std_logic;  -- g2y
    p8  : out std_logic;  -- g3y
    p9  : in  std_logic;  -- g3b
    p10 : in  std_logic;  -- g3a
    p11 : out std_logic;  -- g4y
    p12 : in  std_logic;  -- g4b
    p13 : in  std_logic   -- g4a
    );
end entity;

architecture dip of dip_74s32o is
begin

  U_sn7432 : sn7432
    port map (
      g1a => p1,
      g1b => p2,
      g1y => p3,
      g2a => p4,
      g2b => p5,
      g2y => p6,
      g3y => p8,
      g3b => p9,
      g3a => p10,
      g4y => p11,
      g4b => p12,
      g4a => p13
      );

end architecture; 