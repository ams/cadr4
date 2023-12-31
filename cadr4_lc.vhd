library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_lc is
  port (
    \-lcdrive\          : out std_logic;
    needfetch           : in  std_logic;
    mf24                : out std_logic;
    gnd                 : in  std_logic;
    mf25                : out std_logic;
    \lc_byte_mode\      : in  std_logic;
    mf26                : out std_logic;
    \prog.unibus.reset\ : in  std_logic;
    mf27                : out std_logic;
    \int.enable\        : in  std_logic;
    mf28                : out std_logic;
    \sequence.break\    : in  std_logic;
    mf29                : out std_logic;
    lc25                : out std_logic;
    mf30                : out std_logic;
    lc24                : out std_logic;
    mf31                : out std_logic;
    lcdrive             : out std_logic;
    srclc               : out std_logic;
    tse1a               : in  std_logic;
    lc7                 : out std_logic;
    mf0                 : out std_logic;
    lc6                 : out std_logic;
    mf1                 : out std_logic;
    lc5                 : out std_logic;
    mf2                 : out std_logic;
    lc4                 : out std_logic;
    mf3                 : out std_logic;
    lc3                 : in  std_logic;
    mf4                 : out std_logic;
    lc2                 : in  std_logic;
    mf5                 : out std_logic;
    lc1                 : in  std_logic;
    mf6                 : out std_logic;
    lc0b                : in  std_logic;
    mf7                 : out std_logic;
    lc23                : out std_logic;
    mf16                : out std_logic;
    lc22                : out std_logic;
    mf17                : out std_logic;
    lc21                : out std_logic;
    mf18                : out std_logic;
    lc20                : out std_logic;
    mf19                : out std_logic;
    lc19                : out std_logic;
    mf20                : out std_logic;
    lc18                : out std_logic;
    mf21                : out std_logic;
    lc17                : out std_logic;
    mf22                : out std_logic;
    lc16                : out std_logic;
    mf23                : out std_logic;
    lc15                : out std_logic;
    mf8                 : out std_logic;
    lc14                : out std_logic;
    mf9                 : out std_logic;
    lc13                : out std_logic;
    mf10                : out std_logic;
    lc12                : out std_logic;
    mf11                : out std_logic;
    lc11                : out std_logic;
    mf12                : out std_logic;
    lc10                : out std_logic;
    mf13                : out std_logic;
    lc9                 : out std_logic;
    mf14                : out std_logic;
    lc8                 : out std_logic;
    mf15                : out std_logic;
    hi11                : in  std_logic;
    clk1a               : in  std_logic;
    ob20                : in  std_logic;
    ob21                : in  std_logic;
    ob22                : in  std_logic;
    ob23                : in  std_logic;
    \-destlc\           : in  std_logic;
    \-lcry19\           : out std_logic;
    \-lcry23\           : out std_logic;
    ob16                : in  std_logic;
    ob17                : in  std_logic;
    ob18                : in  std_logic;
    ob19                : in  std_logic;
    \-lcry15\           : out std_logic;
    clk2a               : in  std_logic;
    ob12                : in  std_logic;
    ob13                : in  std_logic;
    ob14                : in  std_logic;
    ob15                : in  std_logic;
    \-lcry11\           : out std_logic;
    clk2c               : in  std_logic;
    ob8                 : in  std_logic;
    ob9                 : in  std_logic;
    ob10                : in  std_logic;
    ob11                : in  std_logic;
    \-lcry7\            : out std_logic;
    \-srclc\            : in  std_logic;
    ob24                : in  std_logic;
    ob25                : in  std_logic;
    ob4                 : in  std_logic;
    ob5                 : in  std_logic;
    ob6                 : in  std_logic;
    ob7                 : in  std_logic;
    \-lcry3\            : in  std_logic);
end;

architecture ttl of cadr4_lc is
  signal nc364 : std_logic;
  signal nc365 : std_logic;
  signal nc366 : std_logic;
  signal nc367 : std_logic;
  signal nc368 : std_logic;
begin
  lc_1a16 : sn74s241 port map(aenb_n => \-lcdrive\, ain0 => needfetch, bout3 => mf24, ain1 => gnd, bout2 => mf25, ain2 => \lc_byte_mode\, bout1 => mf26, ain3 => \prog.unibus.reset\, bout0 => mf27, bin0 => \int.enable\, aout3 => mf28, bin1 => \sequence.break\, aout2 => mf29, bin2 => lc25, aout1 => mf30, bin3 => lc24, aout0 => mf31, benb => lcdrive);
  lc_1a18 : sn74s00 port map(g2b     => srclc, g2a => tse1a, g2q_n => \-lcdrive\, g1b => '0', g1a => '0', g3b => '0', g3a => '0', g4a => '0', g4b => '0');
  lc_1a20 : sn74s241 port map(aenb_n => \-lcdrive\, ain0 => lc7, bout3 => mf0, ain1 => lc6, bout2 => mf1, ain2 => lc5, bout1 => mf2, ain3 => lc4, bout0 => mf3, bin0 => lc3, aout3 => mf4, bin1 => lc2, aout2 => mf5, bin2 => lc1, aout1 => mf6, bin3 => lc0b, aout0 => mf7, benb => lcdrive);
  lc_1a22 : sn74s241 port map(aenb_n => \-lcdrive\, ain0 => lc23, bout3 => mf16, ain1 => lc22, bout2 => mf17, ain2 => lc21, bout1 => mf18, ain3 => lc20, bout0 => mf19, bin0 => lc19, aout3 => mf20, bin1 => lc18, aout2 => mf21, bin2 => lc17, aout1 => mf22, bin3 => lc16, aout0 => mf23, benb => lcdrive);
  lc_1a24 : sn74s241 port map(aenb_n => \-lcdrive\, ain0 => lc15, bout3 => mf8, ain1 => lc14, bout2 => mf9, ain2 => lc13, bout1 => mf10, ain3 => lc12, bout0 => mf11, bin0 => lc11, aout3 => mf12, bin1 => lc10, aout2 => mf13, bin2 => lc9, aout1 => mf14, bin3 => lc8, aout0 => mf15, benb => lcdrive);
  lc_1a26 : sn74s169 port map(up_dn  => hi11, clk => clk1a, i0 => ob20, i1 => ob21, i2 => ob22, i3 => ob23, enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry19\, o3 => lc23, o2 => lc22, o1 => lc21, o0 => lc20, co_n => \-lcry23\);
  lc_1b28 : sn74s169 port map(up_dn  => hi11, clk => clk1a, i0 => ob16, i1 => ob17, i2 => ob18, i3 => ob19, enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry15\, o3 => lc19, o2 => lc18, o1 => lc17, o0 => lc16, co_n => \-lcry19\);
  lc_1c30 : sn74s169 port map(up_dn  => hi11, clk => clk2a, i0 => ob12, i1 => ob13, i2 => ob14, i3 => ob15, enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry11\, o3 => lc15, o2 => lc14, o1 => lc13, o0 => lc12, co_n => \-lcry15\);
  lc_1d29 : sn74s169 port map(up_dn  => hi11, clk => clk2c, i0 => ob8, i1 => ob9, i2 => ob10, i3 => ob11, enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry7\, o3 => lc11, o2 => lc10, o1 => lc9, o0 => lc8, co_n => \-lcry11\);
  lc_2a04 : sn74s08 port map(g3q     => lcdrive, g3a => tse1a, g3b => srclc, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g4a => '0', g4b => '0');
  lc_2a05 : sn74s04 port map(g1a     => \-srclc\, g1q_n => srclc, g2a => '0', g3a => '0', g4a => '0', g5a => '0', g6a => '0');
  lc_2b03 : sn74s169 port map(up_dn  => hi11, clk => clk1a, i0 => ob24, i1 => ob25, i2 => nc364, i3 => nc365, enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry23\, o3 => nc366, o2 => nc367, o1 => lc25, o0 => lc24, co_n => nc368);
  lc_2c05 : sn74s169 port map(up_dn  => hi11, clk => clk2a, i0 => ob4, i1 => ob5, i2 => ob6, i3 => ob7, enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry3\, o3 => lc7, o2 => lc6, o1 => lc5, o0 => lc4, co_n => \-lcry7\);
end architecture;
