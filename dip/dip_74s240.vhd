library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sn74.sn74240;

entity dip_74s240 is
  port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p8  : in  std_logic;
    p9  : out std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : out std_logic;
    p15 : in  std_logic;
    p16 : out std_logic;
    p17 : in  std_logic;
    p18 : out std_logic;
    p19 : in  std_logic
    );
end entity;

architecture dip of dip_74s240 is
begin
  U1 : sn74240
    port map (
      aenb_n => p1,
      ain0   => p2,
      bout3  => p3,
      ain1   => p4,
      bout2  => p5,
      ain2   => p6,
      bout1  => p7,
      ain3   => p8,
      bout0  => p9,
      bin0   => p11,
      aout3  => p12,
      bin1   => p13,
      aout2  => p14,
      bin2   => p15,
      aout1  => p16,
      bin3   => p17,
      aout0  => p18,
      benb_n => p19
      );
end architecture;
