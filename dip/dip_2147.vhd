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
entity dip_2147 is port (               -- am2147 [2147]
  p1  : in  std_logic;                  -- a0
  p2  : in  std_logic;                  -- a1
  p3  : in  std_logic;                  -- a2
  p4  : in  std_logic;                  -- a3
  p5  : in  std_logic;                  -- a4
  p6  : in  std_logic;                  -- a5
  p7  : out std_logic;                  -- do
  p8  : in  std_logic;                  -- we_n
  p10 : in  std_logic;                  -- ce_n
  p11 : in  std_logic;                  -- di
  p12 : in  std_logic;                  -- a11
  p13 : in  std_logic;                  -- a10
  p14 : in  std_logic;                  -- a9
  p15 : in  std_logic;                  -- a8
  p16 : in  std_logic;                  -- a7
  p17 : in  std_logic                   -- a6
  );
end;

architecture dip of dip_2147 is
begin
  ttl : am2147 port map (p1 => a0, p2 => a1, p3 => a2, p4 => a3, p5 => a4, p6 => a5, p7 => do, p8 => we_n, p10 => ce_n, p11 => di, p12 => a11, p13 => a10, p14 => a9, p15 => a8, p16 => a7, p17 => a6);
end;
entity dip_2147 is port (               -- am2147 [2147]
  p1  : in  std_logic;                  -- a0
  p2  : in  std_logic;                  -- a1
  p3  : in  std_logic;                  -- a2
  p4  : in  std_logic;                  -- a3
  p5  : in  std_logic;                  -- a4
  p6  : in  std_logic;                  -- a5
  p7  : out std_logic;                  -- do
  p8  : in  std_logic;                  -- we_n
  p10 : in  std_logic;                  -- ce_n
  p11 : in  std_logic;                  -- di
  p12 : in  std_logic;                  -- a11
  p13 : in  std_logic;                  -- a10
  p14 : in  std_logic;                  -- a9
  p15 : in  std_logic;                  -- a8
  p16 : in  std_logic;                  -- a7
  p17 : in  std_logic                   -- a6
  );
end;

architecture dip of dip_2147 is
begin
  ttl : am2147 port map (p1 => a0, p2 => a1, p3 => a2, p4 => a3, p5 => a4, p6 => a5, p7 => do, p8 => we_n, p10 => ce_n, p11 => di, p12 => a11, p13 => a10, p14 => a9, p15 => a8, p16 => a7, p17 => a6);
end;

