library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.sn74472;

entity dip_74s472 is
  generic (fn : string := "");
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p7  : out std_logic;
    p8  : out std_logic;
    p9  : out std_logic;
    p11 : out std_logic;
    p12 : out std_logic;
    p13 : out std_logic;
    p14 : out std_logic;
    p15 : in  std_logic;
    p16 : in  std_logic;
    p17 : in  std_logic;
    p18 : in  std_logic;
    p19 : in  std_logic
    );
end entity;

architecture dip of dip_74s472 is
begin
  U1 : sn74472
    generic map (fn => fn)
    port map (
      a0   => p1,
      a1   => p2,
      a2   => p3,
      a3   => p4,
      a4   => p5,
      a5   => p16,
      a6   => p17,
      a7   => p18,
      a8   => p19,
      ce_n => p15,
      d0   => p6,
      d1   => p7,
      d2   => p8,
      d3   => p9,
      d4   => p11,
      d5   => p12,
      d6   => p13,
      d7   => p14
      );
end architecture;
