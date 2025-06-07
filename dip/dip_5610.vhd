library ieee;
use ieee.std_logic_1164.all;

use work.dip.all;


entity dip_5610 is
  generic (fn : string := "");
  port (
    p1  : out std_logic;                -- o0
    p2  : out std_logic;                -- o1
    p3  : out std_logic;                -- o2
    p4  : out std_logic;                -- o3
    p5  : out std_logic;                -- o4
    p6  : out std_logic;                -- o5
    p7  : out std_logic;                -- o6
    p9  : out std_logic;                -- o7
    p10 : in  std_logic;                -- a0
    p11 : in  std_logic;                -- a1
    p12 : in  std_logic;                -- a2
    p13 : in  std_logic;                -- a3
    p14 : in  std_logic;                -- a4
    p15 : in  std_logic                 -- ce_n
    );
end dip_5610;

architecture dip of dip_5610 is
begin

  -- p8 and p16 are gnd and vcc for dip_5610
  -- im5600 doesn't have gnd and vcc
  -- so they are not mapped.

  ttl_inst : entity work.im5600
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