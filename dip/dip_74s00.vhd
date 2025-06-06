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

























architecture dip of dip_74ls244 is
begin
  ttl : sn74244 port map (p1 => aenb_n, p2 => ain0, p3 => bout3, p4 => ain1, p5 => bout2, p6 => ain2, p7 => bout1, p8 => ain3, p9 => bout0, p11 => bin0, p12 => aout3, p13 => bin1, p14 => aout2, p15 => bin2, p16 => aout1, p17 => bin3, p18 => aout0, p19 => benb_n);
end;
entity dip_74s00 is port (              -- sn7400 [74s00]
  p1  : in  std_logic;                  -- g1b
  p2  : in  std_logic;                  -- g1a
  p3  : out std_logic;                  -- g1q_n
  p4  : in  std_logic;                  -- g2b
  p5  : in  std_logic;                  -- g2a
  p6  : out std_logic;                  -- g2q_n
  p8  : out std_logic;                  -- g3q_n
  p9  : in  std_logic;                  -- g3b
  p10 : in  std_logic;                  -- g3a
  p11 : out std_logic;                  -- g4q_n
  p12 : in  std_logic;                  -- g4a
  p13 : in  std_logic                   -- g4b
  );
end;

architecture dip of dip_74s00 is
begin
  ttl : sn7400 port map (p1 => g1b, p2 => g1a, p3 => g1q_n, p4 => g2b, p5 => g2a, p6 => g2q_n, p8 => g3q_n, p9 => g3b, p10 => g3a, p11 => g4q_n, p12 => g4a, p13 => g4b);
end;
entity dip_74s00 is port (              -- sn7400 [74s00]
  p1  : in  std_logic;                  -- g1b
  p2  : in  std_logic;                  -- g1a
  p3  : out std_logic;                  -- g1q_n
  p4  : in  std_logic;                  -- g2b
  p5  : in  std_logic;                  -- g2a
  p6  : out std_logic;                  -- g2q_n
  p8  : out std_logic;                  -- g3q_n
  p9  : in  std_logic;                  -- g3b
  p10 : in  std_logic;                  -- g3a
  p11 : out std_logic;                  -- g4q_n
  p12 : in  std_logic;                  -- g4a
  p13 : in  std_logic                   -- g4b
  );
end;

architecture dip of dip_74s00 is
begin
  ttl : sn7400 port map (p1 => g1b, p2 => g1a, p3 => g1q_n, p4 => g2b, p5 => g2a, p6 => g2q_n, p8 => g3q_n, p9 => g3b, p10 => g3a, p11 => g4q_n, p12 => g4a, p13 => g4b);
end;

