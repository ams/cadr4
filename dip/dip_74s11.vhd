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
entity dip_74s11 is port (              -- sn7411 [74s11]
  p1  : in  std_logic;                  -- g1a
  p2  : in  std_logic;                  -- g1b
  p3  : in  std_logic;                  -- g2a
  p4  : in  std_logic;                  -- g2b
  p5  : in  std_logic;                  -- g2c
  p6  : out std_logic;                  -- g2y_n
  p8  : out std_logic;                  -- g3y_n
  p9  : in  std_logic;                  -- g3a
  p10 : in  std_logic;                  -- g3b
  p11 : in  std_logic;                  -- g3c
  p12 : out std_logic;                  -- g1y_n
  p13 : in  std_logic                   -- g1c
  );
end;

architecture dip of dip_74s11 is
begin
  ttl : sn7411 port map (p1 => g1a, p2 => g1b, p3 => g2a, p4 => g2b, p5 => g2c, p6 => g2y_n, p8 => g3y_n, p9 => g3a, p10 => g3b, p11 => g3c, p12 => g1y_n, p13 => g1c);
end;
