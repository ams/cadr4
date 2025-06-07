library ieee;
use ieee.std_logic_1164.all;


entity dip_74s157 is
  port (
    p1  : in  std_logic;                -- sel
    p2  : in  std_logic;                -- a4
    p3  : in  std_logic;                -- b4
    p4  : out std_logic;                -- y4
    p5  : in  std_logic;                -- a3
    p6  : in  std_logic;                -- b3
    p7  : out std_logic;                -- y3
    p9  : out std_logic;                -- y2
    p10 : in  std_logic;                -- b2
    p11 : in  std_logic;                -- a2
    p12 : out std_logic;                -- y1
    p13 : in  std_logic;                -- b1
    p14 : in  std_logic;                -- a1
    p15 : in  std_logic                 -- enb_n
    );
end entity;

architecture dip of dip_74s157 is
begin
  U_74s157 : entity work.sn74157
    port map (
      sel   => p1,
      a1    => p14,
      b1    => p13,
      y1    => p12,
      a2    => p11,
      b2    => p10,
      y2    => p9,
      a3    => p5,
      b3    => p6,
      y3    => p7,
      a4    => p2,
      b4    => p3,
      y4    => p4,
      enb_n => p15
      );
end architecture; 