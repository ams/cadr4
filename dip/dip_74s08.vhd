library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library ttl;
	use ttl.sn74.all;
	use ttl.other.all;

      entity dip_74s08 is port (
        <dip-pin-name> : <direction> std_logic;
        ...
        );
      end component;

      architecture dip of dip_74s08entity dip_74s08 is port (              -- sn7408 [74s08]
  p1  : in  std_logic;                  -- g1b
  p2  : in  std_logic;                  -- g1a
  p3  : out std_logic;                  -- g1q
  p4  : in  std_logic;                  -- g2b
  p5  : in  std_logic;                  -- g2a
  p6  : out std_logic;                  -- g2q
  p8  : out std_logic;                  -- g3q
  p9  : in  std_logic;                  -- g3a
  p10 : in  std_logic;                  -- g3b
  p11 : out std_logic;                  -- g4q
  p12 : in  std_logic;                  -- g4a
  p13 : in  std_logic                   -- g4b
  );
end;

architecture dip of dip_74s08 is
begin
  ttl : sn7408 port map (p1 => g1b, p2 => g1a, p3 => g1q, p4 => g2b, p5 => g2a, p6 => g2q, p8 => g3q, p9 => g3a, p10 => g3b, p11 => g4q, p12 => g4a, p13 => g4b);
end; is
      begin
        ttl : <ttl-name> port map (<dip-pin-name> => <ttl-pin-name>, ...);
      end;
