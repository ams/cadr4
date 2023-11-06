library ieee;
use ieee.std_logic_1164.all;

package unsorted is

  component ic_16dummy port(dummy  : in std_logic); end component;
  component ic_252519 port(o_enb_n : in std_logic; inv : in std_logic; i0 : in std_logic; i1 : in std_logic; i2 : in std_logic; i3 : in std_logic; out_enb_n : in std_logic; clk : in std_logic; clk_enb_n : in std_logic; asyn_clr_n : in std_logic; q0a : out std_logic; q1a : out std_logic; q2a : out std_logic; q3a : out std_logic; q0b : out std_logic; q1b : out std_logic; q2b : out std_logic; q3b : out std_logic); end component;
  component ic_93425a port(a0      : in std_logic; a1 : in std_logic; a2 : in std_logic; a3 : in std_logic; a4 : in std_logic; a5 : in std_logic; a6 : in std_logic; a7 : in std_logic; a8 : in std_logic; a9 : in std_logic; ce_n : in std_logic; we_n : in std_logic; di : in std_logic; do : out std_logic); end component;
  component ic_9346 port(a5        : in std_logic; a4 : in std_logic; a3 : in std_logic; a2 : in std_logic; a1 : in std_logic; a0 : in std_logic; b5 : in std_logic; b4 : in std_logic; b3 : in std_logic; b2 : in std_logic; b1 : in std_logic; b0 : in std_logic; enb : in std_logic; eq : out std_logic); end component;
  component ic_942_1 port(g1a1     : in std_logic; g1b1 : in std_logic; g2a1 : in std_logic; g2b1 : in std_logic; g2c1 : in std_logic; g2d1 : in std_logic; out1 : out std_logic; g1a2 : in std_logic; g1b2 : in std_logic; g2a2 : in std_logic; g2b2 : in std_logic; g2c2 : in std_logic; g2d2 : in std_logic; out2 : out std_logic); end component;

  alias ic_25ls2519 is ic_252519;
  alias ic_93s46 is ic_9346;
  alias ic_9s42_1 is ic_942_1;

end;

package body unsorted is

end;
