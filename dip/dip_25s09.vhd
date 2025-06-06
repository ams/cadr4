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
entity dip_25s09 is port (              -- am2509 [25s09]
  p1  : in  std_logic;                  -- sel
  p2  : out std_logic;                  -- aq
  p3  : in  std_logic;                  -- a0
  p4  : in  std_logic;                  -- a1
  p5  : in  std_logic;                  -- b1
  p6  : in  std_logic;                  -- b0
  p7  : out std_logic;                  -- bq
  p9  : in  std_logic;                  -- clk
  p10 : out std_logic;                  -- cq
  p11 : in  std_logic;                  -- c0
  p12 : in  std_logic;                  -- c1
  p13 : in  std_logic;                  -- d1
  p14 : in  std_logic;                  -- d0
  p15 : out std_logic                   -- dq
  );
end;

architecture dip of dip_25s09 is
begin
  ttl : am2509 port map (p1 => sel, p2 => aq, p3 => a0, p4 => a1, p5 => b1, p6 => b0, p7 => bq, p9 => clk, p10 => cq, p11 => c0, p12 => c1, p13 => d1, p14 => d0, p15 => dq);
end;
entity dip_25s09 is port (              -- am2509 [25s09]
  p1  : in  std_logic;                  -- sel
  p2  : out std_logic;                  -- aq
  p3  : in  std_logic;                  -- a0
  p4  : in  std_logic;                  -- a1
  p5  : in  std_logic;                  -- b1
  p6  : in  std_logic;                  -- b0
  p7  : out std_logic;                  -- bq
  p9  : in  std_logic;                  -- clk
  p10 : out std_logic;                  -- cq
  p11 : in  std_logic;                  -- c0
  p12 : in  std_logic;                  -- c1
  p13 : in  std_logic;                  -- d1
  p14 : in  std_logic;                  -- d0
  p15 : out std_logic                   -- dq
  );
end;

architecture dip of dip_25s09 is
begin
  ttl : am2509 port map (p1 => sel, p2 => aq, p3 => a0, p4 => a1, p5 => b1, p6 => b0, p7 => bq, p9 => clk, p10 => cq, p11 => c0, p12 => c1, p13 => d1, p14 => d0, p15 => dq);
end;

