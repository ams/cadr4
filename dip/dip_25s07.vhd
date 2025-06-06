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
entity dip_25s07 is port (              -- am2507 [25s07]
  p1  : in  std_logic;                  -- enb_n
  p2  : out std_logic;                  -- d0
  p3  : in  std_logic;                  -- i0
  p4  : in  std_logic;                  -- i1
  p5  : out std_logic;                  -- d1
  p6  : in  std_logic;                  -- i2
  p7  : out std_logic;                  -- d2
  p9  : in  std_logic;                  -- clk
  p10 : out std_logic;                  -- d3
  p11 : in  std_logic;                  -- i3
  p12 : out std_logic;                  -- d4
  p13 : in  std_logic;                  -- i4
  p14 : in  std_logic;                  -- i5
  p15 : out std_logic                   -- d5
  );
end;

architecture dip of dip_25s07 is
begin
  ttl : am2507 port map (p1 => enb_n, p2 => d0, p3 => i0, p4 => i1, p5 => d1, p6 => i2, p7 => d2, p9 => clk, p10 => d3, p11 => i3, p12 => d4, p13 => i4, p14 => i5, p15 => d5);
end;
entity dip_25s07 is port (              -- am2507 [25s07]
  p1  : in  std_logic;                  -- enb_n
  p2  : out std_logic;                  -- d0
  p3  : in  std_logic;                  -- i0
  p4  : in  std_logic;                  -- i1
  p5  : out std_logic;                  -- d1
  p6  : in  std_logic;                  -- i2
  p7  : out std_logic;                  -- d2
  p9  : in  std_logic;                  -- clk
  p10 : out std_logic;                  -- d3
  p11 : in  std_logic;                  -- i3
  p12 : out std_logic;                  -- d4
  p13 : in  std_logic;                  -- i4
  p14 : in  std_logic;                  -- i5
  p15 : out std_logic                   -- d5
  );
end;

architecture dip of dip_25s07 is
begin
  ttl : am2507 port map (p1 => enb_n, p2 => d0, p3 => i0, p4 => i1, p5 => d1, p6 => i2, p7 => d2, p9 => clk, p10 => d3, p11 => i3, p12 => d4, p13 => i4, p14 => i5, p15 => d5);
end;

