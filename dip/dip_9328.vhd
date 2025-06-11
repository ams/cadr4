library ieee;
use ieee.std_logic_1164.all;


entity dip_9328 is
  port (
    p1  : in  std_logic;  -- clr_n
    p2  : out std_logic;  -- aq_n
    p3  : out std_logic;  -- aq
    p4  : in  std_logic;  -- asel
    p5  : in  std_logic;  -- ai1
    p6  : in  std_logic;  -- ai0
    p7  : in  std_logic;  -- aclk
    p9  : in  std_logic;  -- comclk
    p10 : in  std_logic;  -- bclk
    p11 : in  std_logic;  -- bi0
    p12 : in  std_logic;  -- bi1
    p13 : in  std_logic;  -- bsel
    p14 : out std_logic;  -- bq
    p15 : out std_logic   -- bq_n
    );
end entity;

architecture dip of dip_9328 is
begin
  U_9328 : entity work.dm9328
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