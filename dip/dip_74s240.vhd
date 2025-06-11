library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity dip_74s240 is
  port (
    p1  : in  std_logic;  -- aenb_n
    p2  : in  std_logic;  -- ain0
    p3  : out std_logic;  -- bout3
    p4  : in  std_logic;  -- ain1
    p5  : out std_logic;  -- bout2
    p6  : in  std_logic;  -- ain2
    p7  : out std_logic;  -- bout1
    p8  : in  std_logic;  -- ain3
    p9  : out std_logic;  -- bout0
    p11 : in  std_logic;  -- bin0
    p12 : out std_logic;  -- aout3
    p13 : in  std_logic;  -- bin1
    p14 : out std_logic;  -- aout2
    p15 : in  std_logic;  -- bin2
    p16 : out std_logic;  -- aout1
    p17 : in  std_logic;  -- bin3
    p18 : out std_logic;  -- aout0
    p19 : in  std_logic   -- benb_n
    );
end entity;

architecture dip of dip_74s240 is
begin

  U_sn74240 : sn74240
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