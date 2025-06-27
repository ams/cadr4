library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.all;

entity dip_74s181 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p8  : in  std_logic;
    p9  : out std_logic;
    p10 : out std_logic;
    p11 : out std_logic;
    p13 : out std_logic;
    p14 : out std_logic;
    p15 : out std_logic;
    p16 : out std_logic;
    p17 : out std_logic;
    p18 : in  std_logic;
    p19 : in  std_logic;
    p20 : in  std_logic;
    p21 : in  std_logic;
    p22 : in  std_logic;
    p23 : in  std_logic
    );
end entity;

architecture dip of dip_74s181 is
begin
  U1 : sn74s181
    port map (
      cout_n => p16,
      y      => p17,
      x      => p15,
      aeb    => p14,

      f3     => p13,
      f2     => p11,
      f1     => p10,
      f0     => p9,
      
      b3     => p18,
      b2     => p20,
      b1     => p22,
      b0     => p1,

      a3     => p19,
      a2     => p21,
      a1     => p23,
      a0     => p2,

      m      => p8,
      s3     => p3,
      s2     => p4,
      s1     => p5,
      s0     => p6,

      cin_n  => p7
      
      );
end architecture;
