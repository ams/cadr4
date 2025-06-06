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
entity dip_74s133 is port (             -- sn74133 [74s133]
  p1  : in std_logic;                   -- g
  p2  : in std_logic;                   -- f
  p3  : in std_logic;                   -- e
  p4  : in std_logic;                   -- d
  p5  : in std_logic;                   -- c
  p6  : in std_logic;                   -- b
  p7  : in std_logic;                   -- a
  p9  : in std_logic;                   -- q_n
  p10 : in std_logic;                   -- h
  p11 : in std_logic;                   -- i
  p12 : in std_logic;                   -- j
  p13 : in std_logic;                   -- k
  p14 : in std_logic;                   -- l
  p15 : in std_logic                    -- m
  );
end;

architecture dip of dip_74s133 is
begin
  ttl : sn74133 port map (p1 => g, p2 => f, p3 => e, p4 => d, p5 => c, p6 => b, p7 => a, p9 => q_n, p10 => h, p11 => i, p12 => j, p13 => k, p14 => l, p15 => m);
end;
