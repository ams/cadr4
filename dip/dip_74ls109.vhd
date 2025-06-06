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
entity dip_74ls109 is port (            -- sn74109 [74ls109]
  p1  : in  std_logic;                  -- clr1_n
  p2  : in  std_logic;                  -- j1
  p3  : in  std_logic;                  -- k1_n
  p4  : in  std_logic;                  -- clk1
  p5  : in  std_logic;                  -- pre1_n
  p6  : out std_logic;                  -- q1
  p7  : out std_logic;                  -- q1_n
  p9  : out std_logic;                  -- q2_n
  p10 : out std_logic;                  -- q2
  p11 : in  std_logic;                  -- pre2_n
  p12 : in  std_logic;                  -- clk2
  p13 : in  std_logic;                  -- k2_n
  p14 : in  std_logic;                  -- j2
  p15 : in  std_logic                   -- clr2_n
  );
end;

architecture dip of dip_74ls109 is
begin
  ttl : sn74109 port map (p1 => clr1_n, p2 => j1, p3 => k1_n, p4 => clk1, p5 => pre1_n, p6 => q1, p7 => q1_n, p9 => q2_n, p10 => q2, p11 => pre2_n, p12 => clk2, p13 => k2_n, p14 => j2, p15 => clr2_n);
end;
entity dip_74ls109 is port (            -- sn74109 [74ls109]
  p1  : in  std_logic;                  -- clr1_n
  p2  : in  std_logic;                  -- j1
  p3  : in  std_logic;                  -- k1_n
  p4  : in  std_logic;                  -- clk1
  p5  : in  std_logic;                  -- pre1_n
  p6  : out std_logic;                  -- q1
  p7  : out std_logic;                  -- q1_n
  p9  : out std_logic;                  -- q2_n
  p10 : out std_logic;                  -- q2
  p11 : in  std_logic;                  -- pre2_n
  p12 : in  std_logic;                  -- clk2
  p13 : in  std_logic;                  -- k2_n
  p14 : in  std_logic;                  -- j2
  p15 : in  std_logic                   -- clr2_n
  );
end;

architecture dip of dip_74ls109 is
begin
  ttl : sn74109 port map (p1 => clr1_n, p2 => j1, p3 => k1_n, p4 => clk1, p5 => pre1_n, p6 => q1, p7 => q1_n, p9 => q2_n, p10 => q2, p11 => pre2_n, p12 => clk2, p13 => k2_n, p14 => j2, p15 => clr2_n);
end;

