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
entity dip_25s10 is port (              -- am2510 [25s10]
  p1  : in  std_logic;                  -- i_3
  p2  : in  std_logic;                  -- i_2
  p3  : in  std_logic;                  -- i_1
  p4  : in  std_logic;                  -- i0
  p5  : in  std_logic;                  -- i1
  p6  : in  std_logic;                  -- i2
  p7  : in  std_logic;                  -- i3
  p9  : in  std_logic;                  -- sel1
  p10 : in  std_logic;                  -- sel0
  p11 : out std_logic;                  -- o3
  p12 : out std_logic;                  -- o2
  p13 : in  std_logic;                  -- ce_n
  p14 : out std_logic;                  -- o1
  p15 : out std_logic                   -- o0
  );
end;

architecture dip of dip_25s10 is
begin
  ttl : am2510 port map (p1 => i_3, p2 => i_2, p3 => i_1, p4 => i0, p5 => i1, p6 => i2, p7 => i3, p9 => sel1, p10 => sel0, p11 => o3, p12 => o2, p13 => ce_n, p14 => o1, p15 => o0);
end;
entity dip_25s10 is port (              -- am2510 [25s10]
  p1  : in  std_logic;                  -- i_3
  p2  : in  std_logic;                  -- i_2
  p3  : in  std_logic;                  -- i_1
  p4  : in  std_logic;                  -- i0
  p5  : in  std_logic;                  -- i1
  p6  : in  std_logic;                  -- i2
  p7  : in  std_logic;                  -- i3
  p9  : in  std_logic;                  -- sel1
  p10 : in  std_logic;                  -- sel0
  p11 : out std_logic;                  -- o3
  p12 : out std_logic;                  -- o2
  p13 : in  std_logic;                  -- ce_n
  p14 : out std_logic;                  -- o1
  p15 : out std_logic                   -- o0
  );
end;

architecture dip of dip_25s10 is
begin
  ttl : am2510 port map (p1 => i_3, p2 => i_2, p3 => i_1, p4 => i0, p5 => i1, p6 => i2, p7 => i3, p9 => sel1, p10 => sel0, p11 => o3, p12 => o2, p13 => ce_n, p14 => o1, p15 => o0);
end;

