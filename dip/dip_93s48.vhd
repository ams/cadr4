library ieee;
use ieee.std_logic_1164.all;


entity dip_93s48 is
  port (
    p1  : in  std_logic;  -- i6
    p2  : in  std_logic;  -- i5
    p3  : in  std_logic;  -- i4
    p4  : in  std_logic;  -- i3
    p5  : in  std_logic;  -- i2
    p6  : in  std_logic;  -- i1
    p7  : in  std_logic;  -- i0
    p9  : out std_logic;  -- po
    p10 : out std_logic;  -- pe
    p11 : in  std_logic;  -- i11
    p12 : in  std_logic;  -- i10
    p13 : in  std_logic;  -- i9
    p14 : in  std_logic;  -- i8
    p15 : in  std_logic   -- i7
    );
end entity;

architecture dip of dip_93s48 is
begin
  U_93s48 : entity work.am93s48
    port map (
      i0  => p7,
      i1  => p6,
      i2  => p5,
      i3  => p4,
      i4  => p3,
      i5  => p2,
      i6  => p1,
      i7  => p15,
      i8  => p14,
      i9  => p13,
      i10 => p12,
      i11 => p11,
      pe  => p10,
      po  => p9
      );
end architecture; 