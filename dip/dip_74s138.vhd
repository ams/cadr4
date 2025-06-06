library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library ttl;
	use ttl.sn74.all;
	use ttl.other.all;

      entity <dip-name> is port (
        <dip-pin-name> : <direction> std_logic;
        ...
        );
      end component;

      architecture dip of <dip-name> is
      begin
        ttl : <ttl-name> port map (<dip-pin-name> => <ttl-pin-name>, ...);
      end;
entity dip_74s138 is port (             -- sn74138 [74s138]
  p1  : in  std_logic;                  -- a
  p2  : in  std_logic;                  -- b
  p3  : in  std_logic;                  -- c
  p4  : in  std_logic;                  -- g2a
  p5  : in  std_logic;                  -- g2b
  p6  : in  std_logic;                  -- g1
  p7  : out std_logic;                  -- y7
  p9  : out std_logic;                  -- y6
  p10 : out std_logic;                  -- y5
  p11 : out std_logic;                  -- y4
  p12 : out std_logic;                  -- y3
  p13 : out std_logic;                  -- y2
  p14 : out std_logic;                  -- y1
  p15 : out std_logic                   -- y0
  );
end;

architecture dip of dip_74s138 is
begin
  ttl : sn74138 port map (p1 => a, p2 => b, p3 => c, p4 => g2a, p5 => g2b, p6 => g1, p7 => y7, p9 => y6, p10 => y5, p11 => y4, p12 => y3, p13 => y2, p14 => y1, p15 => y0);
end;
