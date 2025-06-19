library ieee;
use ieee.std_logic_1164.all;

library work;
use work.other.all;

entity dip_res20 is
  port (
    p2  : out std_logic;
    p3  : out std_logic;
    p4  : out std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p7  : out std_logic;
    p8  : out std_logic;
    p9  : out std_logic;
    p10 : out std_logic;
    p11 : out std_logic;
    p12 : out std_logic;
    p13 : out std_logic;
    p14 : out std_logic;
    p15 : out std_logic;
    p16 : out std_logic;
    p17 : out std_logic;
    p18 : out std_logic;
    p19 : out std_logic
    );
end entity;

architecture dip of dip_res20 is
begin
  U1 : res20
    port map (
      r2  => p2,
      r3  => p3,
      r4  => p4,
      r5  => p5,
      r6  => p6,
      r7  => p7,
      r8  => p8,
      r9  => p9,
      r10 => p10,
      r11 => p11,
      r12 => p12,
      r13 => p13,
      r14 => p14,
      r15 => p15,
      r16 => p16,
      r17 => p17,
      r18 => p18,
      r19 => p19
      );
end architecture;
