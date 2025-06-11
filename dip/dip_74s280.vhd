library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity dip_74s280 is
  port (
    p1  : in  std_logic;  -- i0
    p2  : in  std_logic;  -- i1
    p4  : in  std_logic;  -- i2
    p5  : out std_logic;  -- even
    p6  : out std_logic;  -- odd
    p8  : in  std_logic;  -- i3
    p9  : in  std_logic;  -- i4
    p10 : in  std_logic;  -- i5
    p11 : in  std_logic;  -- i6
    p12 : in  std_logic;  -- i7
    p13 : in  std_logic   -- i8
    );
end entity;

architecture dip of dip_74s280 is
begin

  U_sn74280 : sn74280
    port map (
      i0   => p1,
      i1   => p2,
      i2   => p4,
      even => p5,
      odd  => p6,
      i3   => p8,
      i4   => p9,
      i5   => p10,
      i6   => p11,
      i7   => p12,
      i8   => p13
      );

end architecture; 