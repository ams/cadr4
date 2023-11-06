library ieee;
use ieee.std_logic_1164.all;

package unsorted is

  component ic_16dummy port(dummy   : in  std_logic); end component;
  component ic_2147 port(a0         : in  std_logic; a1 : in std_logic; a2 : in std_logic; a3 : in std_logic; a4 : in std_logic; a5 : in std_logic; do : out std_logic; we_n : in std_logic; ce_n : in std_logic; di : in std_logic; a11 : in std_logic; a10 : in std_logic; a9 : in std_logic; a8 : in std_logic; a7 : in std_logic; a6 : in std_logic); end component;
  component ic_2507 port(i0         : in  std_logic; i1 : in std_logic; i2 : in std_logic; i3 : in std_logic; i4 : in std_logic; i5 : in std_logic; d0 : out std_logic; d1 : out std_logic; d2 : out std_logic; d3 : out std_logic; d4 : out std_logic; d5 : out std_logic; clk : in std_logic; enb_n : in std_logic); end component;
  component ic_2509 port(a0         : in  std_logic; a1 : in std_logic; aq : out std_logic; b0 : in std_logic; b1 : in std_logic; bq : out std_logic; c0 : in std_logic; c1 : in std_logic; cq : out std_logic; d0 : in std_logic; d1 : in std_logic; dq : out std_logic; sel : in std_logic; clk : in std_logic); end component;
  component ic_2510 port(i3         : in  std_logic; i2 : in std_logic; i1 : in std_logic; i0 : in std_logic; i_1 : in std_logic; i_2 : in std_logic; i_3 : in std_logic; sel1 : in std_logic; sel0 : in std_logic; ce_n : in std_logic; o3 : out std_logic; o2 : out std_logic; o1 : out std_logic; o0 : out std_logic); end component;
  component ic_252519 port(o_enb_n  : in  std_logic; inv : in std_logic; i0 : in std_logic; i1 : in std_logic; i2 : in std_logic; i3 : in std_logic; out_enb_n : in std_logic; clk : in std_logic; clk_enb_n : in std_logic; asyn_clr_n : in std_logic; q0a : out std_logic; q1a : out std_logic; q2a : out std_logic; q3a : out std_logic; q0b : out std_logic; q1b : out std_logic; q2b : out std_logic; q3b : out std_logic); end component;
  component ic_5600 port(o7         : out std_logic; o6 : out std_logic; o5 : out std_logic; o4 : out std_logic; o3 : out std_logic; o2 : out std_logic; o1 : out std_logic; o0 : out std_logic; a4 : in std_logic; a3 : in std_logic; a2 : in std_logic; a1 : in std_logic; a0 : in std_logic; ce_n : in std_logic); end component;
  component ic_5610 port(o7         : out std_logic; o6 : out std_logic; o5 : out std_logic; o4 : out std_logic; o3 : out std_logic; o2 : out std_logic; o1 : out std_logic; o0 : out std_logic; a4 : in std_logic; a3 : in std_logic; a2 : in std_logic; a1 : in std_logic; a0 : in std_logic; ce_n : in std_logic); end component;
  component ic_8221 port(d1         : out std_logic; i1 : in std_logic; we1_n : in std_logic; i0 : in std_logic; d0 : out std_logic; we0_n : in std_logic; a0 : in std_logic; a1 : in std_logic; a2 : in std_logic; a3 : in std_logic; a4 : in std_logic; strobe : in std_logic; wclk_n : in std_logic; ce : in std_logic); end component;
  component ic_9328 port(clr_n      : in  std_logic; aq_n : in std_logic; aq : in std_logic; asel : in std_logic; ai1 : in std_logic; ai0 : in std_logic; aclk : in std_logic; comclk : in std_logic; bclk : in std_logic; bi0 : in std_logic; bi1 : in std_logic; bsel : in std_logic; bq : in std_logic; bq_n : in std_logic); end component;
  component ic_93425a port(a0       : in  std_logic; a1 : in std_logic; a2 : in std_logic; a3 : in std_logic; a4 : in std_logic; a5 : in std_logic; a6 : in std_logic; a7 : in std_logic; a8 : in std_logic; a9 : in std_logic; ce_n : in std_logic; we_n : in std_logic; di : in std_logic; do : out std_logic); end component;
  component ic_9346 port(a5         : in  std_logic; a4 : in std_logic; a3 : in std_logic; a2 : in std_logic; a1 : in std_logic; a0 : in std_logic; b5 : in std_logic; b4 : in std_logic; b3 : in std_logic; b2 : in std_logic; b1 : in std_logic; b0 : in std_logic; enb : in std_logic; eq : out std_logic); end component;
  component ic_942_1 port(g1a1      : in  std_logic; g1b1 : in std_logic; g2a1 : in std_logic; g2b1 : in std_logic; g2c1 : in std_logic; g2d1 : in std_logic; out1 : out std_logic; g1a2 : in std_logic; g1b2 : in std_logic; g2a2 : in std_logic; g2b2 : in std_logic; g2c2 : in std_logic; g2d2 : in std_logic; out2 : out std_logic); end component;
  component ic_res20 port(r2        : in  std_logic; r3 : in std_logic; r4 : in std_logic; r5 : in std_logic; r6 : in std_logic; r7 : in std_logic; r8 : in std_logic; r9 : in std_logic; r10 : in std_logic; r11 : in std_logic; r12 : in std_logic; r13 : in std_logic; r14 : in std_logic; r15 : in std_logic; r16 : in std_logic; r17 : in std_logic; r18 : in std_logic; r19 : in std_logic); end component;
  component ic_sip220_330_8 port(r2 : in  std_logic; r3 : in std_logic; r4 : in std_logic; r5 : in std_logic; r6 : in std_logic; r7 : in std_logic); end component;
  component ic_sip330_470_8 port(r2 : in  std_logic; r3 : in std_logic; r4 : in std_logic; r5 : in std_logic; r6 : in std_logic; r7 : in std_logic); end component;
  component ic_til309 port(l2       : in  std_logic; l4 : in std_logic; l8 : in std_logic; l1 : in std_logic; latch : in std_logic; i4 : in std_logic; i8 : in std_logic; i2 : in std_logic; blank_n : in std_logic; dp : in std_logic; test_n : in std_logic; ldp : in std_logic; i1 : in std_logic); end component;

  alias ic_25ls2519 is ic_252519;
  alias ic_25s07 is ic_2507;
  alias ic_25s09 is ic_2509;
  alias ic_25s10 is ic_2510;
  alias ic_82s21 is ic_8221;
  alias ic_93s46 is ic_9346;
  alias ic_9s42_1 is ic_942_1;

end;

package body unsorted is

end;
