library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_dspctl is
  port (
    dmask0      : out std_logic;
    dmask1      : out std_logic;
    dmask2      : out std_logic;
    dmask3      : out std_logic;
    dmask4      : out std_logic;
    dmask5      : out std_logic;
    dmask6      : out std_logic;
    ir5         : in  std_logic;
    ir6         : in  std_logic;
    ir7         : in  std_logic;
    gnd         : in  std_logic;
    \-irdisp\   : in  std_logic;
    dc6         : out std_logic;
    ir38        : in  std_logic;
    ir39        : in  std_logic;
    dc7         : out std_logic;
    ir40        : in  std_logic;
    dc8         : out std_logic;
    clk3e       : in  std_logic;
    dc9         : out std_logic;
    ir41        : in  std_logic;
    dc0         : out std_logic;
    ir32        : in  std_logic;
    ir33        : in  std_logic;
    dc1         : out std_logic;
    ir34        : in  std_logic;
    dc2         : out std_logic;
    dc3         : out std_logic;
    ir35        : in  std_logic;
    dc4         : out std_logic;
    ir36        : in  std_logic;
    ir37        : in  std_logic;
    dc5         : out std_logic;
    dpareven    : out std_logic;
    dispenb     : in  std_logic;
    dparok      : out std_logic;
    \-dparh\    : out std_logic;
    dparl       : out std_logic;
    hi4         : in  std_logic;
    aa16        : out std_logic;
    aa17        : out std_logic;
    a17         : in  std_logic;
    a16         : in  std_logic;
    a15         : in  std_logic;
    aa8         : out std_logic;
    a14         : in  std_logic;
    aa9         : out std_logic;
    a13         : in  std_logic;
    aa10        : out std_logic;
    a12         : in  std_logic;
    aa11        : out std_logic;
    a11         : in  std_logic;
    aa12        : out std_logic;
    a10         : in  std_logic;
    aa13        : out std_logic;
    a9          : in  std_logic;
    aa14        : out std_logic;
    a8          : in  std_logic;
    aa15        : out std_logic;
    a7          : in  std_logic;
    aa0         : out std_logic;
    a6          : in  std_logic;
    aa1         : out std_logic;
    a5          : in  std_logic;
    aa2         : out std_logic;
    a4          : in  std_logic;
    aa3         : out std_logic;
    a3          : in  std_logic;
    aa4         : out std_logic;
    a2          : in  std_logic;
    aa5         : out std_logic;
    a1          : in  std_logic;
    aa6         : out std_logic;
    a0          : in  std_logic;
    aa7         : out std_logic;
    \-dmapbenb\ : out std_logic;
    ir8         : in  std_logic;
    ir9         : in  std_logic;
    dispwr      : out std_logic;
    \-funct2\   : in  std_logic;
    dpc9        : in  std_logic;
    dpc10       : in  std_logic;
    dpc11       : in  std_logic;
    dpc12       : in  std_logic;
    dpc13       : in  std_logic;
    dn          : in  std_logic;
    dp          : in  std_logic;
    dr          : in  std_logic;
    dpar        : in  std_logic;
    dpc0        : in  std_logic;
    dpc1        : in  std_logic;
    dpc2        : in  std_logic;
    dpc3        : in  std_logic;
    dpc4        : in  std_logic;
    dpc5        : in  std_logic;
    dpc6        : in  std_logic;
    dpc7        : in  std_logic;
    dpc8        : in  std_logic);
end;

architecture ttl of cadr_dspctl is
begin
  dspctl_2f22 : im5610 generic map (fn   => "rom/dspctl_2f22.hex") port map(
    o0   => dmask0,
    o1   => dmask1,
    o2   => dmask2,
    o3   => dmask3,
    o4   => dmask4,
    o5   => dmask5,
    o6   => dmask6,
    o7   => open,
    a0   => ir5,
    a1   => ir6,
    a2   => ir7,
    a3   => gnd,
    a4   => gnd,
    ce_n => gnd
    );
  dspctl_3c14 : am25s07 port map(
    enb_n => \-irdisp\,
    d0    => dc6,
    i0    => ir38,
    i1    => ir39,
    d1    => dc7,
    i2    => ir40,
    d2    => dc8,
    clk   => clk3e,
    d3    => dc9,
    i3    => ir41,
    d4    => open,
    i4    => '0',
    i5    => '0',
    d5    => open
    );
  dspctl_3c15 : am25s07 port map(
    enb_n => \-irdisp\,
    d0    => dc0,
    i0    => ir32,
    i1    => ir33,
    d1    => dc1,
    i2    => ir34,
    d2    => dc2,
    clk   => clk3e,
    d3    => dc3,
    i3    => ir35,
    d4    => dc4,
    i4    => ir36,
    i5    => ir37,
    d5    => dc5
    );
  dspctl_3d02 : sn74s00 port map(
    g1b   => dpareven,
    g1a   => dispenb,
    g1q_n => dparok,
    g2a   => '0',
    g2b   => '0',
    g2q_n => open,
    g3a   => '0',
    g3b   => '0',
    g3q_n => open,
    g4a   => '0',
    g4b   => '0',
    g4q_n => open
    );
  dspctl_3e19 : sn74s86 port map(
    g3y => dpareven,
    g3a => \-dparh\,
    g3b => dparl,
    g1a => '0',
    g1b => '0',
    g1y => open,
    g2a => '0',
    g2b => '0',
    g2y => open,
    g4a => '0',
    g4b => '0',
    g4y => open
    );
  dspctl_3f11 : sn74s241 port map(
    aenb_n => hi4,
    ain0   => '0',
    bout3  => aa16,
    ain1   => '0',
    bout2  => aa17,
    ain2   => '0',
    bout1  => open,
    ain3   => '0',
    bout0  => open,
    bin0   => '0',
    aout3  => open,
    bin1   => '0',
    aout2  => open,
    bin2   => a17,
    aout1  => open,
    bin3   => a16,
    aout0  => open,
    benb   => hi4
    );
  dspctl_3f12 : sn74s241 port map(
    aenb_n => gnd,
    ain0   => a15,
    bout3  => aa8,
    ain1   => a14,
    bout2  => aa9,
    ain2   => a13,
    bout1  => aa10,
    ain3   => a12,
    bout0  => aa11,
    bin0   => a11,
    aout3  => aa12,
    bin1   => a10,
    aout2  => aa13,
    bin2   => a9,
    aout1  => aa14,
    bin3   => a8,
    aout0  => aa15,
    benb   => hi4
    );
  dspctl_3f13 : sn74s241 port map(
    aenb_n => gnd,
    ain0   => a7,
    bout3  => aa0,
    ain1   => a6,
    bout2  => aa1,
    ain2   => a5,
    bout1  => aa2,
    ain3   => a4,
    bout0  => aa3,
    bin0   => a3,
    aout3  => aa4,
    bin1   => a2,
    aout2  => aa5,
    bin2   => a1,
    aout1  => aa6,
    bin3   => a0,
    aout0  => aa7,
    benb   => hi4
    );
  dspctl_3f14_gate1 : sn74s02 port map(
    g1q_n => \-dmapbenb\,
    g1a   => ir8,
    g1b   => ir9,
    g2a   => '0',
    g2b   => '0',
    g2q_n => open,
    g3a   => '0',
    g3b   => '0',
    g3q_n => open,
    g4a   => '0',
    g4b   => '0',
    g4q_n => open
    );
  dspctl_3f14_gate2 : sn74s02 port map(
    g2q_n => dispwr,
    g2a   => \-irdisp\,
    g2b   => \-funct2\,
    g1a   => '0',
    g1b   => '0',
    g1q_n => open,
    g3a   => '0',
    g3b   => '0',
    g3q_n => open,
    g4a   => '0',
    g4b   => '0',
    g4q_n => open
    );
  dspctl_4f09 : sn74s280 port map(
    i0   => dpc9,
    i1   => dpc10,
    i2   => dpc11,
    even => \-dparh\,
    odd  => open,
    i3   => dpc12,
    i4   => dpc13,
    i5   => dn,
    i6   => dp,
    i7   => dr,
    i8   => dpar
    );
  dspctl_4f10 : sn74s280 port map(
    i0   => dpc0,
    i1   => dpc1,
    i2   => dpc2,
    even => open,
    odd  => dparl,
    i3   => dpc3,
    i4   => dpc4,
    i5   => dpc5,
    i6   => dpc6,
    i7   => dpc7,
    i8   => dpc8
    );
end architecture;
