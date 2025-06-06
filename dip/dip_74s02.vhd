library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library ttl;
	use ttl.sn74.all;
	use ttl.other.all;

      entity dip_74s02 is port (
        <dip-pin-name> : <direction> std_logic;
        ...
        );
      end component;

      architecture dip of dip_74s02entity dip_74s02 is port (              -- sn7402 [74s02]
  p1  : out std_logic;                  -- g1q_n
  p2  : in  std_logic;                  -- g1a
  p3  : in  std_logic;                  -- g1b
  p4  : out std_logic;                  -- g2q_n
  p5  : in  std_logic;                  -- g2a
  p6  : in  std_logic;                  -- g2b
  p8  : in  std_logic;                  -- g3b
  p9  : in  std_logic;                  -- g3a
  p10 : out std_logic;                  -- g3q_n
  p11 : in  std_logic;                  -- g4b
  p12 : in  std_logic;                  -- g4a
  p13 : out std_logic                   -- g4q_n
  );
end;

architecture dip of dip_74s02 is
begin
  ttl : sn7402 port map (p1 => g1q_n, p2 => g1a, p3 => g1b, p4 => g2q_n, p5 => g2a, p6 => g2b, p8 => g3b, p9 => g3a, p10 => g3q_n, p11 => g4b, p12 => g4a, p13 => g4q_n);
end; is
      begin
        ttl : <ttl-name> port map (<dip-pin-name> => <ttl-pin-name>, ...);
      end;
