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





architecture dip of dip_74s02 is
begin
  ttl : sn7402 port map (p1 => g1q_n, p2 => g1a, p3 => g1b, p4 => g2q_n, p5 => g2a, p6 => g2b, p8 => g3b, p9 => g3a, p10 => g3q_n, p11 => g4b, p12 => g4a, p13 => g4q_n);
end;



architecture dip of dip_74s04 is
begin
  ttl : sn7404 port map (p1 => g1a, p2 => g1q_n, p3 => g2a, p4 => g2q_n, p5 => g3a, p6 => g3q_n, p8 => g4q, p9 => g4a, p10 => g5q_n, p11 => g5a, p12 => g6q_n, p13 => g6a);
end;



architecture dip of dip_74s08 is
begin
  ttl : sn7408 port map (p1 => g1b, p2 => g1a, p3 => g1q, p4 => g2b, p5 => g2a, p6 => g2q, p8 => g3q, p9 => g3a, p10 => g3b, p11 => g4q, p12 => g4a, p13 => g4b);
end;



architecture dip of dip_74s10 is
begin
  ttl : sn7410 port map (p1 => g1a, p2 => g1b, p3 => g2a, p4 => g2b, p5 => g2c, p6 => g2y_n, p8 => g3y_n, p9 => g3a, p10 => g3b, p11 => g3c, p12 => g1y_n, p13 => g1c);
end;



architecture dip of dip_74s11 is
begin
  ttl : sn7411 port map (p1 => g1a, p2 => g1b, p3 => g2a, p4 => g2b, p5 => g2c, p6 => g2y_n, p8 => g3y_n, p9 => g3a, p10 => g3b, p11 => g3c, p12 => g1y_n, p13 => g1c);
end;



architecture dip of dip_74s133 is
begin
  ttl : sn74133 port map (p1 => g, p2 => f, p3 => e, p4 => d, p5 => c, p6 => b, p7 => a, p9 => q_n, p10 => h, p11 => i, p12 => j, p13 => k, p14 => l, p15 => m);
end;



architecture dip of dip_74s138 is
begin
  ttl : sn74138 port map (p1 => a, p2 => b, p3 => c, p4 => g2a, p5 => g2b, p6 => g1, p7 => y7, p9 => y6, p10 => y5, p11 => y4, p12 => y3, p13 => y2, p14 => y1, p15 => y0);
end;

























architecture dip of dip_74s240 is
begin
  ttl : sn74240 port map (p1 => aenb_n, p2 => ain0, p3 => bout3, p4 => ain1, p5 => bout2, p6 => ain2, p7 => bout1, p8 => ain3, p9 => bout0, p11 => bin0, p12 => aout3, p13 => bin1, p14 => aout2, p15 => bin2, p16 => aout1, p17 => bin3, p18 => aout0, p19 => benb_n);
end;
entity dip_9s42_1 is port (             -- dm942 [9s42-1]
  p1  : in  std_logic;                  -- g1a1
  p2  : in  std_logic;                  -- g1b1
  p3  : in  std_logic;                  -- g2a1
  p4  : in  std_logic;                  -- g2b1
  p5  : in  std_logic;                  -- g2c1
  p6  : in  std_logic;                  -- g2d1
  p7  : out std_logic;                  -- out1
  p9  : out std_logic;                  -- out2
  p10 : in  std_logic;                  -- g2d2
  p11 : in  std_logic;                  -- g2c2
  p12 : in  std_logic;                  -- g2b2
  p13 : in  std_logic;                  -- g2a2
  p14 : in  std_logic;                  -- g1b2
  p15 : in  std_logic                   -- g1a2
  );
end;

architecture dip of dip_9s42_1 is
begin
  ttl : dm942 port map (p1 => g1a1, p2 => g1b1, p3 => g2a1, p4 => g2b1, p5 => g2c1, p6 => g2d1, p7 => out1, p9 => out2, p10 => g2d2, p11 => g2c2, p12 => g2b2, p13 => g2a2, p14 => g1b2, p15 => g1a2);
end;
entity dip_9s42_1 is port (             -- dm942 [9s42-1]
  p1  : in  std_logic;                  -- g1a1
  p2  : in  std_logic;                  -- g1b1
  p3  : in  std_logic;                  -- g2a1
  p4  : in  std_logic;                  -- g2b1
  p5  : in  std_logic;                  -- g2c1
  p6  : in  std_logic;                  -- g2d1
  p7  : out std_logic;                  -- out1
  p9  : out std_logic;                  -- out2
  p10 : in  std_logic;                  -- g2d2
  p11 : in  std_logic;                  -- g2c2
  p12 : in  std_logic;                  -- g2b2
  p13 : in  std_logic;                  -- g2a2
  p14 : in  std_logic;                  -- g1b2
  p15 : in  std_logic                   -- g1a2
  );
end;

architecture dip of dip_9s42_1 is
begin
  ttl : dm942 port map (p1 => g1a1, p2 => g1b1, p3 => g2a1, p4 => g2b1, p5 => g2c1, p6 => g2d1, p7 => out1, p9 => out2, p10 => g2d2, p11 => g2c2, p12 => g2b2, p13 => g2a2, p14 => g1b2, p15 => g1a2);
end;

