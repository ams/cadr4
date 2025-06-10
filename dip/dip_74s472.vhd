library ieee;
use ieee.std_logic_1164.all;

use work.dip.all;


entity dip_74s472 is
  generic (fn : string := "");
  port (
    p1  : in  std_logic;                 -- a0
    p2  : in  std_logic;                 -- a1
    p3  : in  std_logic;                 -- a2
    p4  : in  std_logic;                 -- a3
    p5  : in  std_logic;                 -- a4
    p6  : out  std_logic;                -- d0
    p7  : out  std_logic;                -- d1
    p8  : out  std_logic;                -- d2
    p9  : out  std_logic;                -- d3
    p11 : out std_logic;                 -- d4
    p12 : out std_logic;                 -- d5
    p13 : out std_logic;                 -- d6
    p14 : out std_logic;                 -- d7
    p15 : in  std_logic;                 -- ce_n
    p16 : in  std_logic;                 -- a5
    p17 : in  std_logic;                 -- a6
    p18 : in  std_logic;                 -- a7
    p19 : in  std_logic                  -- a8
    );
end entity;

architecture dip of dip_74s472 is
begin
  U1 : entity work.dm74472
    generic map (
      fn => "proms/74s472.rom"
      )
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