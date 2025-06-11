library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity dip_74s181 is
  port (
    p1  : in  std_logic;  -- b0
    p2  : in  std_logic;  -- a0
    p3  : in  std_logic;  -- s3
    p4  : in  std_logic;  -- s2
    p5  : in  std_logic;  -- s1
    p6  : in  std_logic;  -- s0
    p7  : in  std_logic;  -- cin_n
    p8  : in  std_logic;  -- m
    p9  : out std_logic;  -- f0
    p10 : out std_logic;  -- f1
    p11 : out std_logic;  -- f2
    p13 : out std_logic;  -- f3
    p14 : out std_logic;  -- aeb
    p15 : out std_logic;  -- x
    p16 : out std_logic;  -- cout_n
    p17 : out std_logic;  -- y
    p18 : in  std_logic;  -- b3
    p19 : in  std_logic;  -- a3
    p20 : in  std_logic;  -- b2
    p21 : in  std_logic;  -- a2
    p22 : in  std_logic;  -- b1
    p23 : in  std_logic   -- a1
    );
end entity;

architecture dip of dip_74s181 is
begin

  U_sn74181 : sn74181
    port map (
      b0     => p1,
      a0     => p2,
      s3     => p3,
      s2     => p4,
      s1     => p5,
      s0     => p6,
      cin_n  => p7,
      m      => p8,
      f0     => p9,
      f1     => p10,
      f2     => p11,
      f3     => p13,
      aeb    => p14,
      x      => p15,
      cout_n => p16,
      y      => p17,
      b3     => p18,
      a3     => p19,
      b2     => p20,
      a2     => p21,
      b1     => p22,
      a1     => p23
      );

end architecture; 