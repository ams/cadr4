library ieee;
use ieee.std_logic_1164.all;

use work.dip.all;


entity dip_74s472 is
  generic (fn : string := "");
  port (
    p1  : in  std_logic;                 -- a8
    p2  : in  std_logic;                 -- a7
    p3  : in  std_logic;                 -- a6
    p4  : in  std_logic;                 -- a5
    p5  : in  std_logic;                 -- a4
    p6  : in  std_logic;                 -- a3
    p7  : in  std_logic;                 -- a2
    p8  : in  std_logic;                 -- a1
    p9  : in  std_logic;                 -- a0
    p11 : out std_logic;                 -- d0
    p12 : out std_logic;                 -- d1
    p13 : out std_logic;                 -- d2
    p14 : out std_logic;                 -- d3
    p15 : out std_logic;                 -- d4
    p16 : out std_logic;                 -- d5
    p17 : out std_logic;                 -- d6
    p18 : out std_logic;                 -- d7
    p19 : in  std_logic                  -- ce_n
    );
end entity;

architecture dip of dip_74s472 is
begin
  U1 : entity work.dm74472
    generic map (
      fn => "proms/74s472.rom"
      )
    port map (
      a0   => p9,
      a1   => p8,
      a2   => p7,
      a3   => p6,
      a4   => p5,
      a5   => p4,
      a6   => p3,
      a7   => p2,
      a8   => p1,
      ce_n => p19,
      d0   => p11,
      d1   => p12,
      d2   => p13,
      d3   => p14,
      d4   => p15,
      d5   => p16,
      d6   => p17,
      d7   => p18
      );
end architecture; 