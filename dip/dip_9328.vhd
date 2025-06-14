library ieee;
use ieee.std_logic_1164.all;

entity dip_9328 is
  port (
    p1  : in  std_logic;
    p2  : out std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : out std_logic;
    p15 : out std_logic
    );
end entity;

architecture dip of dip_9328 is
begin
  U1 : dm9328
    port map (
      clr_n  => p1,
      aq_n   => p2,
      aq     => p3,
      asel   => p4,
      ai1    => p5,
      ai0    => p6,
      aclk   => p7,
      comclk => p9,
      bclk   => p10,
      bi0    => p11,
      bi1    => p12,
      bsel   => p13,
      bq     => p14,
      bq_n   => p15
      );
end architecture;
