library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_flag is
  port (
    ir45                : in  std_logic;
    \-nopa\             : in  std_logic;
    \-ilong\            : out std_logic;
    ob29                : in  std_logic;
    \lc_byte_mode\      : out std_logic;
    ob28                : in  std_logic;
    \prog.unibus.reset\ : out std_logic;
    hi4                 : in  std_logic;
    gnd                 : in  std_logic;
    clk3c               : in  std_logic;
    \int.enable\        : out std_logic;
    ob27                : in  std_logic;
    \sequence.break\    : out std_logic;
    ob26                : in  std_logic;
    \-destintctl\       : in  std_logic;
    \-reset\            : in  std_logic;
    \-statbit\          : out std_logic;
    ir46                : in  std_logic;
    aeqm                : in  std_logic;
    alu32               : in  std_logic;
    aluneg              : out std_logic;
    r0                  : in  std_logic;
    jcond               : out std_logic;
    \-jcond\            : out std_logic;
    conds2              : out std_logic;
    conds1              : out std_logic;
    conds0              : out std_logic;
    \pgf.or.int.or.sb\  : out std_logic;
    \pgf.or.int\        : out std_logic;
    \-vmaok\            : in  std_logic;
    ir2                 : in  std_logic;
    ir5                 : in  std_logic;
    ir1                 : in  std_logic;
    ir0                 : in  std_logic;
    \-alu32\            : out std_logic;
    sint                : out std_logic;
    sintr               : in  std_logic);
end;

architecture ttl of cadr4_flag is
  signal internal30 : std_logic;
  signal nc385      : std_logic;
  signal nc386      : std_logic;
  signal nc387      : std_logic;
  signal nc388      : std_logic;
begin
  flag_3e07 : sn74s00 port map(g1b   => ir45, g1a => \-nopa\, g1q_n => \-ilong\, g2b => '0', g2a => '0', g3b => '0', g3a => '0', g4a => '0', g4b => '0');
  flag_3e08 : am25ls2519 port map(i0 => ob29, q0a => nc385, q0b => \lc_byte_mode\, i1 => ob28, q1a => nc386, q1b => \prog.unibus.reset\, o_enb_n => hi4, out_enb_n => gnd, clk => clk3c, q2b => \int.enable\, q2a => nc387, i2 => ob27, q3b => \sequence.break\, q3a => nc388, i3 => ob26, clk_enb_n => \-destintctl\, inv => hi4, asyn_clr_n => \-reset\);
  flag_3e11 : sn74s00 port map(g4q_n => \-statbit\, g4a => \-nopa\, g4b => ir46, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g3b => '0', g3a => '0');
  flag_3e13 : sn74s151 port map(i3   => aeqm, i2 => alu32, i1 => aluneg, i0 => r0, q => jcond, q_n => \-jcond\, ce_n => gnd, sel2 => conds2, sel1 => conds1, sel0 => conds0, i7 => hi4, i6 => \pgf.or.int.or.sb\, i5 => \pgf.or.int\, i4 => \-vmaok\);
  flag_3e14 : sn74s08 port map(g1b   => ir2, g1a => ir5, g1q => conds2, g2b => ir1, g2a => ir5, g2q => conds1, g3q => conds0, g3a => ir5, g3b => ir0, g4a => '0', g4b => '0');
  flag_3e17 : sn74s02 port map(g4b   => \-alu32\, g4a => aeqm, g4q_n => aluneg, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g3b => '0', g3a => '0');
  flag_3e18 : sn74s32 port map(g2a   => \-vmaok\, g2b => sint, g2y => \pgf.or.int\, g3y => internal30, g3a => \sequence.break\, g3b => sint, g4y => \pgf.or.int.or.sb\, g4a => internal30, g4b => \-vmaok\, g1a => '0', g1b => '0');
  flag_3e22 : sn74s04 port map(g4q_n => \-alu32\, g4a => alu32, g1a => '0', g2a => '0', g3a => '0', g5a => '0', g6a => '0');
  flag_4d09 : sn74s08 port map(g3q   => sint, g3a => \int.enable\, g3b => sintr, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g4a => '0', g4b => '0');
end architecture;
