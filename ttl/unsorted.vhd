library ieee;
use ieee.std_logic_1164.all;

package unsorted is

  component ic_16dummy port(dummy : in std_logic); end component;
  component ic_9346 port(a5       : in std_logic; a4 : in std_logic; a3 : in std_logic; a2 : in std_logic; a1 : in std_logic; a0 : in std_logic; b5 : in std_logic; b4 : in std_logic; b3 : in std_logic; b2 : in std_logic; b1 : in std_logic; b0 : in std_logic; enb : in std_logic; eq : out std_logic); end component;
  component ic_942_1 port(g1a1    : in std_logic; g1b1 : in std_logic; g2a1 : in std_logic; g2b1 : in std_logic; g2c1 : in std_logic; g2d1 : in std_logic; out1 : out std_logic; g1a2 : in std_logic; g1b2 : in std_logic; g2a2 : in std_logic; g2b2 : in std_logic; g2c2 : in std_logic; g2d2 : in std_logic; out2 : out std_logic); end component;

  alias ic_93s46 is ic_9346;
  alias ic_9s42_1 is ic_942_1;

end;

package body unsorted is

end;
