library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_smctl is
  port (
    \-sh4\    : in  std_logic;
    \-sr\     : out std_logic;
    \-s4\     : out std_logic;
    \-mr\     : out std_logic;
    \-irbyte\ : in  std_logic;
    ir13      : in  std_logic;
    ir12      : in  std_logic;
    \-ir0\    : in  std_logic;
    s0        : out std_logic;
    \-ir1\    : in  std_logic;
    s1        : out std_logic;
    mskl4     : out std_logic;
    ir9       : in  std_logic;
    mskr4     : out std_logic;
    mskl3cry  : out std_logic;
    s3a       : out std_logic;
    \-sh3\    : in  std_logic;
    s3b       : out std_logic;
    \-ir2\    : in  std_logic;
    s2a       : out std_logic;
    s2b       : out std_logic;
    s4        : out std_logic;
    mskr0     : out std_logic;
    mskr1     : out std_logic;
    mskr2     : out std_logic;
    mskl1     : out std_logic;
    ir6       : in  std_logic;
    mskl0     : out std_logic;
    ir5       : in  std_logic;
    gnd       : in  std_logic;
    mskl3     : out std_logic;
    mskr3     : out std_logic;
    ir8       : in  std_logic;
    mskl2     : out std_logic;
    ir7       : in  std_logic);
end;

architecture ttl of cadr4_smctl is
  signal nc209 : std_logic;
  signal nc210 : std_logic;
  signal nc211 : std_logic;
  signal nc212 : std_logic;
  signal nc213 : std_logic;
  signal nc214 : std_logic;
  signal nc215 : std_logic;
  signal nc216 : std_logic;
  signal nc217 : std_logic;
  signal nc218 : std_logic;
begin
  smctl_2d15 : sn74s32 port map(g1a   => \-sh4\, g1b => \-sr\, g1y => \-s4\, g2a => '0', g2b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
  smctl_2d20 : sn74s02 port map(g1q_n => \-mr\, g1a => \-irbyte\, g1b => ir13, g2q_n => \-sr\, g2a => \-irbyte\, g2b => ir12, g3b => \-ir0\, g3a => \-sr\, g3q_n => s0, g4b => \-ir1\, g4a => \-sr\, g4q_n => s1);
  smctl_2e10 : sn74s283 port map(s1   => nc209, b1 => nc210, a1 => nc211, s0 => mskl4, a0 => ir9, b0 => mskr4, c0 => mskl3cry, c4 => nc212, s3 => nc213, b3 => nc214, a3 => nc215, s2 => nc216, a2 => nc217, b2 => nc218);
  smctl_2e14 : sn74s02 port map(g1q_n => s3a, g1a => \-sr\, g1b => \-sh3\, g2q_n => s3b, g2a => \-sh3\, g2b => \-sr\, g3b => \-ir2\, g3a => \-sr\, g3q_n => s2a, g4b => \-sr\, g4a => \-ir2\, g4q_n => s2b);
  smctl_2e19 : sn74s02 port map(g1q_n => s4, g1a => \-sr\, g1b => \-sh4\, g2q_n => mskr0, g2a => \-mr\, g2b => \-ir0\, g3b => \-ir1\, g3a => \-mr\, g3q_n => mskr1, g4b => \-ir2\, g4a => \-mr\, g4q_n => mskr2);
  smctl_2e25 : sn74s283 port map(s1   => mskl1, b1 => mskr1, a1 => ir6, s0 => mskl0, a0 => ir5, b0 => mskr0, c0 => gnd, c4 => mskl3cry, s3 => mskl3, b3 => mskr3, a3 => ir8, s2 => mskl2, a2 => ir7, b2 => mskr2);
  smctl_2e30 : sn74s02 port map(g1q_n => mskr3, g1a => \-mr\, g1b => \-sh3\, g2q_n => mskr4, g2a => \-mr\, g2b => \-sh4\, g3b => '0', g3a => '0', g4b => '0', g4a => '0');
end architecture;
