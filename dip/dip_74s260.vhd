library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity dip_74s260 is
  port (
    p1  : in  std_logic;  -- g1a
    p2  : in  std_logic;  -- g1b
    p3  : in  std_logic;  -- g1c
    p4  : in  std_logic;  -- g2a
    p5  : out std_logic;  -- g1y_n
    p6  : out std_logic;  -- g2y_n
    p8  : in  std_logic;  -- g2b
    p9  : in  std_logic;  -- g2c
    p10 : in  std_logic;  -- g2d
    p11 : in  std_logic;  -- g2e
    p12 : in  std_logic;  -- g1d
    p13 : in  std_logic   -- g1e
    );
end entity;

architecture dip of dip_74s260 is
begin

  U_sn74260 : sn74260
    port map (
      g1a   => p1,
      g1b   => p2,
      g1c   => p3,
      g2a   => p4,
      g1y_n => p5,
      g2y_n => p6,
      g2b   => p8,
      g2c   => p9,
      g2d   => p10,
      g2e   => p11,
      g1d   => p12,
      g1e   => p13
      );

end architecture; 