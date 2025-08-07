library ieee;
use ieee.std_logic_1164.all;

library work;
use work.amd.am29701;

entity dip_29701 is 
  port (
    p4 : in std_logic; -- I1
    p6 : in std_logic; -- I2
    p10 : in std_logic; -- I3
    p12 : in std_logic; -- I4

    p5 : out std_logic; -- O1
    p7 : out std_logic; -- O2
    p9 : out std_logic; -- O3
    p11 : out std_logic; -- O4

    p1 : in std_logic; -- A3
    p15 : in std_logic; -- A2
    p14 : in std_logic; -- A1
    p13 : in std_logic; -- A0

    p3 : in std_logic; -- WRITE_n
    p2 : in std_logic -- CE_n
  );
end entity;

architecture dip of dip_29701 is
begin
  
  u1: am29701
  port map (
    i1      => p4,
    i2      => p6,
    i3      => p10,
    i4      => p12,
    o1      => p5,
    o2      => p7,
    o3      => p9,
    o4      => p11,
    a0      => p13,
    a1      => p14,
    a2      => p15,
    a3      => p1,
    write_n => p3,
    ce_n    => p2
  );

end architecture;