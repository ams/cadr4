library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;
entity dip_7428 is port (               -- sn7428 [7428]
  p1  : out std_logic;                  -- g1q_n
  p2  : in  std_logic;                  -- g1a
  p3  : in  std_logic;                  -- g1b
  p4  : out std_logic;                  -- g2q_n
  p5  : in  std_logic;                  -- g2a
  p6  : in  std_logic;                  -- g3b
  p8  : in  std_logic;                  -- g3a
  p9  : in  std_logic;                  -- g3b
  p10 : out std_logic;                  -- g3q_n
  p11 : in  std_logic;                  -- g4a
  p12 : in  std_logic;                  -- g4b
  p13 : out std_logic                   -- g4q_n
  );
end;

architecture dip of dip_7428 is
begin
  ttl : sn7428 port map (p1 => g1q_n, p2 => g1a, p3 => g1b, p4 => g2q_n, p5 => g2a, p6 => g3b, p8 => g3a, p9 => g3b, p10 => g3q_n, p11 => g4a, p12 => g4b, p13 => g4q_n);
end;
entity dip_7428 is port (               -- sn7428 [7428]
  p1  : out std_logic;                  -- g1q_n
  p2  : in  std_logic;                  -- g1a
  p3  : in  std_logic;                  -- g1b
  p4  : out std_logic;                  -- g2q_n
  p5  : in  std_logic;                  -- g2a
  p6  : in  std_logic;                  -- g3b
  p8  : in  std_logic;                  -- g3a
  p9  : in  std_logic;                  -- g3b
  p10 : out std_logic;                  -- g3q_n
  p11 : in  std_logic;                  -- g4a
  p12 : in  std_logic;                  -- g4b
  p13 : out std_logic                   -- g4q_n
  );
end;

architecture dip of dip_7428 is
begin
  ttl : sn7428 port map (p1 => g1q_n, p2 => g1a, p3 => g1b, p4 => g2q_n, p5 => g2a, p6 => g3b, p8 => g3a, p9 => g3b, p10 => g3q_n, p11 => g4a, p12 => g4b, p13 => g4q_n);
end;

