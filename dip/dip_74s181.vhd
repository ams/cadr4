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
entity dip_74s181 is port (             -- sn74181 [74s181]
  p1  : in  std_logic;                  -- b0
  p2  : in  std_logic;                  -- a0
  p3  : in  std_logic;                  -- s3
  p4  : in  std_logic;                  -- s2
  p5  : in  std_logic;                  -- s1
  p6  : in  std_logic;                  -- s0
  p7  : in  std_logic;                  -- cin_n
  p8  : in  std_logic;                  -- m
  p9  : out std_logic;                  -- f0
  p10 : out std_logic;                  -- f1
  p11 : out std_logic;                  -- f2
  p13 : out std_logic;                  -- f3
  p14 : out std_logic;                  -- aeb
  p15 : out std_logic;                  -- x
  p16 : out std_logic;                  -- cout_n
  p17 : out std_logic;                  -- y
  p18 : in  std_logic;                  -- b3
  p19 : in  std_logic;                  -- a3
  p20 : in  std_logic;                  -- b2
  p21 : in  std_logic;                  -- a2
  p22 : in  std_logic;                  -- b1
  p23 : in  std_logic                   -- a1
  );
end;

architecture dip of dip_74s181 is
begin
  ttl : sn74181 port map (p1 => b0, p2 => a0, p3 => s3, p4 => s2, p5 => s1, p6 => s0, p7 => cin_n, p8 => m, p9 => f0, p10 => f1, p11 => f2, p13 => f3, p14 => aeb, p15 => x, p16 => cout_n, p17 => y, p18 => b3, p19 => a3, p20 => b2, p21 => a2, p22 => b1, p23 => a1);
end;
entity dip_74s181 is port (             -- sn74181 [74s181]
  p1  : in  std_logic;                  -- b0
  p2  : in  std_logic;                  -- a0
  p3  : in  std_logic;                  -- s3
  p4  : in  std_logic;                  -- s2
  p5  : in  std_logic;                  -- s1
  p6  : in  std_logic;                  -- s0
  p7  : in  std_logic;                  -- cin_n
  p8  : in  std_logic;                  -- m
  p9  : out std_logic;                  -- f0
  p10 : out std_logic;                  -- f1
  p11 : out std_logic;                  -- f2
  p13 : out std_logic;                  -- f3
  p14 : out std_logic;                  -- aeb
  p15 : out std_logic;                  -- x
  p16 : out std_logic;                  -- cout_n
  p17 : out std_logic;                  -- y
  p18 : in  std_logic;                  -- b3
  p19 : in  std_logic;                  -- a3
  p20 : in  std_logic;                  -- b2
  p21 : in  std_logic;                  -- a2
  p22 : in  std_logic;                  -- b1
  p23 : in  std_logic                   -- a1
  );
end;

architecture dip of dip_74s181 is
begin
  ttl : sn74181 port map (p1 => b0, p2 => a0, p3 => s3, p4 => s2, p5 => s1, p6 => s0, p7 => cin_n, p8 => m, p9 => f0, p10 => f1, p11 => f2, p13 => f3, p14 => aeb, p15 => x, p16 => cout_n, p17 => y, p18 => b3, p19 => a3, p20 => b2, p21 => a2, p22 => b1, p23 => a1);
end;

