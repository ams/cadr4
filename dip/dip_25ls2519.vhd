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
entity dip_25ls2519 is port (           -- am252519 [25ls2519]
  p1  : in  std_logic;                  -- i0
  p2  : out std_logic;                  -- q0a
  p3  : out std_logic;                  -- q0b
  p4  : in  std_logic;                  -- i1
  p5  : out std_logic;                  -- q1a
  p6  : out std_logic;                  -- q1b
  p7  : in  std_logic;                  -- o_enb_n
  p8  : in  std_logic;                  -- out_enb_n
  p9  : in  std_logic;                  -- clk
  p11 : out std_logic;                  -- q2b
  p12 : out std_logic;                  -- q2a
  p13 : in  std_logic;                  -- i2
  p14 : out std_logic;                  -- q3b
  p15 : out std_logic;                  -- q3a
  p16 : in  std_logic;                  -- i3
  p17 : in  std_logic;                  -- clk_enb_n
  p18 : in  std_logic;                  -- inv
  p19 : in  std_logic                   -- asyn_clr_n
  );
end;

architecture dip of dip_25ls2519 is
begin
  ttl : am252519 port map (p1 => i0, p2 => q0a, p3 => q0b, p4 => i1, p5 => q1a, p6 => q1b, p7 => o_enb_n, p8 => out_enb_n, p9 => clk, p11 => q2b, p12 => q2a, p13 => i2, p14 => q3b, p15 => q3a, p16 => i3, p17 => clk_enb_n, p18 => inv, p19 => asyn_clr_n);
end;
entity dip_25ls2519 is port (           -- am252519 [25ls2519]
  p1  : in  std_logic;                  -- i0
  p2  : out std_logic;                  -- q0a
  p3  : out std_logic;                  -- q0b
  p4  : in  std_logic;                  -- i1
  p5  : out std_logic;                  -- q1a
  p6  : out std_logic;                  -- q1b
  p7  : in  std_logic;                  -- o_enb_n
  p8  : in  std_logic;                  -- out_enb_n
  p9  : in  std_logic;                  -- clk
  p11 : out std_logic;                  -- q2b
  p12 : out std_logic;                  -- q2a
  p13 : in  std_logic;                  -- i2
  p14 : out std_logic;                  -- q3b
  p15 : out std_logic;                  -- q3a
  p16 : in  std_logic;                  -- i3
  p17 : in  std_logic;                  -- clk_enb_n
  p18 : in  std_logic;                  -- inv
  p19 : in  std_logic                   -- asyn_clr_n
  );
end;

architecture dip of dip_25ls2519 is
begin
  ttl : am252519 port map (p1 => i0, p2 => q0a, p3 => q0b, p4 => i1, p5 => q1a, p6 => q1b, p7 => o_enb_n, p8 => out_enb_n, p9 => clk, p11 => q2b, p12 => q2a, p13 => i2, p14 => q3b, p15 => q3a, p16 => i3, p17 => clk_enb_n, p18 => inv, p19 => asyn_clr_n);
end;

