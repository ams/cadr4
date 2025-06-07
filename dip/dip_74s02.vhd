         library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity dip_74s02 is
  port (
    p1  : out std_logic;  -- g1q_n
    p2  : in  std_logic;  -- g1a
    p3  : in  std_logic;  -- g1b
    p4  : out std_logic;  -- g2q_n
    p5  : in  std_logic;  -- g2a
    p6  : in  std_logic;  -- g2b
    p8  : in  std_logic;  -- g3b
    p9  : in  std_logic;  -- g3a
    p10 : out std_logic;  -- g3q_n
    p11 : in  std_logic;  -- g4b
    p12 : in  std_logic;  -- g4a
    p13 : out std_logic   -- g4q_n
    );
end entity;

architecture dip of dip_74s02 is
begin
  U_74s02 : sn7402
    port map (
      g1a   => p2,
      g1b   => p3,
      g1q_n => p1,
      g2a   => p5,
      g2b   => p6,
      g2q_n => p4,
      g3a   => p9,
      g3b   => p8,
      g3q_n => p10,
      g4a   => p12,
      g4b   => p11,
      g4q_n => p13
      );
end architecture; 