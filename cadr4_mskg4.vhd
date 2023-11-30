library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_mskg4 is
  port (
    msk24   : out std_logic;
    msk25   : out std_logic;
    msk26   : out std_logic;
    msk27   : out std_logic;
    msk28   : out std_logic;
    msk29   : out std_logic;
    msk30   : out std_logic;
    msk31   : out std_logic;
    mskl0   : in  std_logic;
    mskl1   : in  std_logic;
    mskl2   : in  std_logic;
    mskl3   : in  std_logic;
    mskl4   : in  std_logic;
    gnd     : in  std_logic;
    mskr0   : in  std_logic;
    mskr1   : in  std_logic;
    mskr2   : in  std_logic;
    mskr3   : in  std_logic;
    mskr4   : in  std_logic;
    msk8    : out std_logic;
    msk9    : out std_logic;
    msk10   : out std_logic;
    msk11   : out std_logic;
    msk12   : out std_logic;
    msk13   : out std_logic;
    msk14   : out std_logic;
    msk15   : out std_logic;
    nc253   : in  std_logic;
    nc254   : out std_logic;
    ir31    : in  std_logic;
    \-ir31\ : out std_logic;
    ir13    : in  std_logic;
    \-ir13\ : out std_logic;
    \-ir12\ : out std_logic;
    ir12    : in  std_logic;
    nc255   : out std_logic;
    nc256   : in  std_logic;
    nc257   : out std_logic;
    nc258   : in  std_logic;
    msk16   : out std_logic;
    msk17   : out std_logic;
    msk18   : out std_logic;
    msk19   : out std_logic;
    msk20   : out std_logic;
    msk21   : out std_logic;
    msk22   : out std_logic;
    msk23   : out std_logic;
    aeqm    : out std_logic;
    msk0    : out std_logic;
    msk1    : out std_logic;
    msk2    : out std_logic;
    msk3    : out std_logic;
    msk4    : out std_logic;
    msk5    : out std_logic;
    msk6    : out std_logic;
    msk7    : out std_logic;
    nc252   : out std_logic);
end;

architecture ttl of cadr4_mskg4 is
begin
  mskg4_2d11 : im5600 generic map(fn => "rom/mskg4_2d11.hex") port map(o0 => msk24, o1 => msk25, o2 => msk26, o3 => msk27, o4 => msk28, o5 => msk29, o6 => msk30, o7 => msk31, a0 => mskl0, a1 => mskl1, a2 => mskl2, a3 => mskl3, a4 => mskl4, ce_n => gnd);
  mskg4_2d12 : im5600 generic map(fn => "rom/mskg4_2d12.hex") port map(o0 => msk24, o1 => msk25, o2 => msk26, o3 => msk27, o4 => msk28, o5 => msk29, o6 => msk30, o7 => msk31, a0 => mskr0, a1 => mskr1, a2 => mskr2, a3 => mskr3, a4 => mskr4, ce_n => gnd);
  mskg4_2d16 : im5600 generic map(fn => "rom/mskg4_2d16.hex") port map(o0 => msk8, o1 => msk9, o2 => msk10, o3 => msk11, o4 => msk12, o5 => msk13, o6 => msk14, o7 => msk15, a0 => mskl0, a1 => mskl1, a2 => mskl2, a3 => mskl3, a4 => mskl4, ce_n => gnd);
  mskg4_2d17 : im5600 generic map(fn => "rom/mskg4_2d17.hex") port map(o0 => msk8, o1 => msk9, o2 => msk10, o3 => msk11, o4 => msk12, o5 => msk13, o6 => msk14, o7 => msk15, a0 => mskr0, a1 => mskr1, a2 => mskr2, a3 => mskr3, a4 => mskr4, ce_n => gnd);
  mskg4_2d26 : sn74s04 port map(g1a  => nc253, g1q_n => nc254, g2a => ir31, g2q_n => \-ir31\, g3a => ir13, g3q_n => \-ir13\, g4q_n => \-ir12\, g4a => ir12, g5q_n => nc255, g5a => nc256, g6q_n => nc257, g6a => nc258);
  mskg4_2e11 : im5600 generic map(fn => "rom/mskg4_2e11.hex") port map(o0 => msk16, o1 => msk17, o2 => msk18, o3 => msk19, o4 => msk20, o5 => msk21, o6 => msk22, o7 => msk23, a0 => mskl0, a1 => mskl1, a2 => mskl2, a3 => mskl3, a4 => mskl4, ce_n => gnd);
  mskg4_2e12 : im5600 generic map(fn => "rom/mskg4_2e12.hex") port map(o0 => msk16, o1 => msk17, o2 => msk18, o3 => msk19, o4 => msk20, o5 => msk21, o6 => msk22, o7 => msk23, a0 => mskr0, a1 => mskr1, a2 => mskr2, a3 => mskr3, a4 => mskr4, ce_n => gnd);
  mskg4_2e15 : res20 port map(r2     => aeqm, r3 => msk31, r4 => msk30, r5 => msk29, r6 => msk28, r7 => msk27, r8 => msk26, r9 => msk25, r11 => msk24, r12 => msk23, r13 => msk22, r14 => msk21, r15 => msk20, r16 => msk19, r17 => msk18, r18 => msk17, r19 => msk16);
  mskg4_2e16 : im5600 generic map(fn => "rom/mskg4_2e16.hex") port map(o0 => msk0, o1 => msk1, o2 => msk2, o3 => msk3, o4 => msk4, o5 => msk5, o6 => msk6, o7 => msk7, a0 => mskl0, a1 => mskl1, a2 => mskl2, a3 => mskl3, a4 => mskl4, ce_n => gnd);
  mskg4_2e17 : im5600 generic map(fn => "rom/mskg4_2e17.hex") port map(o0 => msk0, o1 => msk1, o2 => msk2, o3 => msk3, o4 => msk4, o5 => msk5, o6 => msk6, o7 => msk7, a0 => mskr0, a1 => mskr1, a2 => mskr2, a3 => mskr3, a4 => mskr4, ce_n => gnd);
  mskg4_2e20 : res20 port map(r2     => nc252, r3 => msk15, r4 => msk14, r5 => msk13, r6 => msk12, r7 => msk11, r8 => msk10, r9 => msk9, r11 => msk8, r12 => msk7, r13 => msk6, r14 => msk5, r15 => msk4, r16 => msk3, r17 => msk2, r18 => msk1, r19 => msk0);
end architecture;
