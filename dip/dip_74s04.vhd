library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library ttl;
	use ttl.sn74.all;
	use ttl.other.all;

      entity dip_74s04 is port (
        <dip-pin-name> : <direction> std_logic;
        ...
        );
      end component;

      architecture dip of dip_74s04entity dip_74s04 is port (              -- sn7404 [74s04]
  p1  : in  std_logic;                  -- g1a
  p2  : out std_logic;                  -- g1q_n
  p3  : in  std_logic;                  -- g2a
  p4  : out std_logic;                  -- g2q_n
  p5  : in  std_logic;                  -- g3a
  p6  : out std_logic;                  -- g3q_n
  p8  : out std_logic;                  -- g4q
  p9  : in  std_logic;                  -- g4a
  p10 : out std_logic;                  -- g5q_n
  p11 : in  std_logic;                  -- g5a
  p12 : out std_logic;                  -- g6q_n
  p13 : in  std_logic                   -- g6a
  );
end;

architecture dip of dip_74s04 is
begin
  ttl : sn7404 port map (p1 => g1a, p2 => g1q_n, p3 => g2a, p4 => g2q_n, p5 => g3a, p6 => g3q_n, p8 => g4q, p9 => g4a, p10 => g5q_n, p11 => g5a, p12 => g6q_n, p13 => g6a);
end; is
      begin
        ttl : <ttl-name> port map (<dip-pin-name> => <ttl-pin-name>, ...);
      end;
