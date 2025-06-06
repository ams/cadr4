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
entity dip_5610 is port (               -- im5600 [5610]
  p1  : out std_logic;                  -- o0
  p2  : out std_logic;                  -- o1
  p3  : out std_logic;                  -- o2
  p4  : out std_logic;                  -- o3
  p5  : out std_logic;                  -- o4
  p6  : out std_logic;                  -- o5
  p7  : out std_logic;                  -- o6
  p9  : out std_logic;                  -- o7
  p10 : in  std_logic;                  -- a0
  p11 : in  std_logic;                  -- a1
  p12 : in  std_logic;                  -- a2
  p13 : in  std_logic;                  -- a3
  p14 : in  std_logic;                  -- a4
  p15 : in  std_logic                   -- ce_n
  );
end;

architecture dip of dip_5610 is
begin
  ttl : im5600 port map (p1 => o0, p2 => o1, p3 => o2, p4 => o3, p5 => o4, p6 => o5, p7 => o6, p9 => o7, p10 => a0, p11 => a1, p12 => a2, p13 => a3, p14 => a4, p15 => ce_n);
end;
entity dip_5610 is port (               -- im5600 [5610]
  p1  : out std_logic;                  -- o0
  p2  : out std_logic;                  -- o1
  p3  : out std_logic;                  -- o2
  p4  : out std_logic;                  -- o3
  p5  : out std_logic;                  -- o4
  p6  : out std_logic;                  -- o5
  p7  : out std_logic;                  -- o6
  p9  : out std_logic;                  -- o7
  p10 : in  std_logic;                  -- a0
  p11 : in  std_logic;                  -- a1
  p12 : in  std_logic;                  -- a2
  p13 : in  std_logic;                  -- a3
  p14 : in  std_logic;                  -- a4
  p15 : in  std_logic                   -- ce_n
  );
end;

architecture dip of dip_5610 is
begin
  ttl : im5600 port map (p1 => o0, p2 => o1, p3 => o2, p4 => o3, p5 => o4, p6 => o5, p7 => o6, p9 => o7, p10 => a0, p11 => a1, p12 => a2, p13 => a3, p14 => a4, p15 => ce_n);
end;

