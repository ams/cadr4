library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.sn74188;

entity dip_5600 is
  generic (fn : string := "");
  port (
    p1  : out std_logic;
    p2  : out std_logic;
    p3  : out std_logic;
    p4  : out std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
end entity;

architecture dip of dip_5600 is
begin
  U1 : sn74188
    generic map (fn => fn)
    port map (
      o0   => p1,
      o1   => p2,
      o2   => p3,
      o3   => p4,
      o4   => p5,
      o5   => p6,
      o6   => p7,
      o7   => p9,
      a0   => p10,
      a1   => p11,
      a2   => p12,
      a3   => p13,
      a4   => p14,
      ce_n => p15
      );
end architecture;
