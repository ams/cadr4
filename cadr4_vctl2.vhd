library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_vctl2 is
  port (
    mapwr0d        : out std_logic;
    \-wmapd\       : out std_logic;
    \-vma26\       : in  std_logic;
    mapwr1d        : out std_logic;
    \-vma25\       : in  std_logic;
    wp1a           : in  std_logic;
    \-vm0wpa\      : out std_logic;
    \-vm0wpb\      : out std_logic;
    \-vm1wpa\      : out std_logic;
    wp1b           : in  std_logic;
    \-vm1wpb\      : out std_logic;
    \-lvmo23\      : in  std_logic;
    \-pfr\         : out std_logic;
    \-wmap\        : out std_logic;
    wmap           : out std_logic;
    \-memrq\       : out std_logic;
    memrq          : in  std_logic;
    \-memprepare\  : out std_logic;
    memprepare     : in  std_logic;
    destmem        : out std_logic;
    \-destmem\     : in  std_logic;
    mdsela         : out std_logic;
    \-destmdr\     : in  std_logic;
    clk2c          : in  std_logic;
    mdselb         : out std_logic;
    \-destvma\     : in  std_logic;
    \-ifetch\      : in  std_logic;
    \-vmaenb\      : out std_logic;
    hi11           : in  std_logic;
    vmasela        : out std_logic;
    vmaselb        : out std_logic;
    wrcyc          : in  std_logic;
    \lm_drive_enb\ : in  std_logic;
    \-memdrive.a\  : out std_logic;
    \-memdrive.b\  : out std_logic;
    \-memwr\       : out std_logic;
    \-memrd\       : out std_logic;
    ir20           : in  std_logic;
    ir19           : in  std_logic;
    \use.md\       : out std_logic;
    \-srcmd\       : in  std_logic;
    nopa           : out std_logic;
    \-nopa\        : in  std_logic);
end;

architecture ttl of cadr4_vctl2 is
  signal nc123 : std_logic;
  signal nc124 : std_logic;
  signal nc125 : std_logic;
begin
  vctl2_1c15 : sn74s02 port map(g1q_n => mapwr0d, g1a => \-wmapd\, g1b => \-vma26\, g2q_n => mapwr1d, g2a => \-wmapd\, g2b => \-vma25\, g3b => '0', g3a => '0', g4b => '0', g4a => '0');
  vctl2_1d07 : sn74s37 port map(g1a   => mapwr0d, g1b => wp1a, g1y => \-vm0wpa\, g2a => mapwr0d, g2b => wp1a, g2y => \-vm0wpb\, g3y => \-vm1wpa\, g3a => wp1b, g3b => mapwr1d, g4y => \-vm1wpb\, g4a => wp1b, g4b => mapwr1d);
  vctl2_1d26 : sn74s04 port map(g1a   => nc123, g1q_n => nc124, g2a => \-lvmo23\, g2q_n => \-pfr\, g3a => \-wmap\, g3q_n => wmap, g4q_n => \-memrq\, g4a => memrq, g5q_n => \-memprepare\, g5a => memprepare, g6q_n => destmem, g6a => \-destmem\);
  vctl2_1d27 : sn74s02 port map(g1q_n => mdsela, g1a => \-destmdr\, g1b => clk2c, g2q_n => mdselb, g2a => \-destmdr\, g2b => clk2c, g3b => '0', g3a => '0', g4b => '0', g4a => '0');
  vctl2_1d28 : sn74s08 port map(g1b   => \-destvma\, g1a => \-ifetch\, g1q => \-vmaenb\, g2b => \-ifetch\, g2a => hi11, g2q => vmasela, g3q => vmaselb, g3a => hi11, g3b => \-ifetch\, g4a => '0', g4b => '0');
  vctl2_1e06 : sn74s00 port map(g1b   => wrcyc, g1a => \lm_drive_enb\, g1q_n => \-memdrive.a\, g2b => wrcyc, g2a => \lm_drive_enb\, g2q_n => \-memdrive.b\, g3b => '0', g3a => '0', g4a => '0', g4b => '0');
  vctl2_3d04 : sn74s139 port map(g2y3 => \-wmap\, g2y2 => \-memwr\, g2y1 => \-memrd\, g2y0 => nc125, b2 => ir20, a2 => ir19, g2 => \-destmem\, g1 => '0', a1 => '0', b1 => '0');
  vctl2_3f18 : sn74s02 port map(g1q_n => \use.md\, g1a => \-srcmd\, g1b => nopa, g2a => '0', g2b => '0', g3b => '0', g3a => '0', g4b => '0', g4a => '0');
  vctl2_3f19 : sn74s04 port map(g5q_n => nopa, g5a => \-nopa\, g1a => '0', g2a => '0', g3a => '0', g4a => '0', g6a => '0');
end architecture;
