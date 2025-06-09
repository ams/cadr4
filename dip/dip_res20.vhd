library ieee;
use ieee.std_logic_1164.all;


entity dip_res20 is
  port (
    p2  : in std_logic;  -- r2
    p3  : in std_logic;  -- r3
    p4  : in std_logic;  -- r4
    p5  : in std_logic;  -- r5
    p6  : in std_logic;  -- r6
    p7  : in std_logic;  -- r7
    p8  : in std_logic;  -- r8
    p9  : in std_logic;  -- r9
    p10 : in std_logic;  -- r10
    p11 : in std_logic;  -- r11
    p12 : in std_logic;  -- r12
    p13 : in std_logic;  -- r13
    p14 : in std_logic;  -- r14
    p15 : in std_logic;  -- r15
    p16 : in std_logic;  -- r16
    p17 : in std_logic;  -- r17
    p18 : in std_logic;  -- r18
    p19 : in std_logic   -- r19
    );
end entity;

architecture dip of dip_res20 is
begin
  U_res20 : entity work.res20
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