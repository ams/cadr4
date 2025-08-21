library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.sn7400;

entity dip_74s00 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : out std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic
    );
end entity;

architecture dip of dip_74s00 is
begin
  U1 : sn7400
    port map (
      g1a   => p2,
      g1b   => p1,
      g1q_n => p3,
      g2a   => p5,
      g2b   => p4,
      g2q_n => p6,
      g3a   => p9,
      g3b   => p10,
      g3q_n => p8,
      g4a   => p12,
      g4b   => p13,
      g4q_n => p11
      );
end architecture;
