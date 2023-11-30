library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_actl is
  port (
    clk3e       : in  std_logic;
    wadr0       : out std_logic;
    ir32        : in  std_logic;
    \-aadr0b\   : out std_logic;
    wadr1       : out std_logic;
    ir33        : in  std_logic;
    \-aadr1b\   : out std_logic;
    \-aadr2b\   : out std_logic;
    ir34        : in  std_logic;
    wadr2       : out std_logic;
    \-aadr3b\   : out std_logic;
    ir35        : in  std_logic;
    wadr3       : out std_logic;
    gnd         : in  std_logic;
    clk3d       : in  std_logic;
    wadr4       : out std_logic;
    ir36        : in  std_logic;
    \-aadr4b\   : out std_logic;
    wadr5       : out std_logic;
    ir37        : in  std_logic;
    \-aadr5b\   : out std_logic;
    \-aadr6b\   : out std_logic;
    ir38        : in  std_logic;
    wadr6       : out std_logic;
    \-aadr7b\   : out std_logic;
    ir39        : in  std_logic;
    wadr7       : out std_logic;
    \-aadr0a\   : out std_logic;
    \-aadr1a\   : out std_logic;
    \-aadr2a\   : out std_logic;
    \-aadr3a\   : out std_logic;
    \-aadr4a\   : out std_logic;
    \-aadr5a\   : out std_logic;
    \-aadr6a\   : out std_logic;
    \-aadr7a\   : out std_logic;
    wadr8       : out std_logic;
    ir40        : in  std_logic;
    \-aadr8a\   : out std_logic;
    wadr9       : out std_logic;
    ir41        : in  std_logic;
    \-aadr9a\   : out std_logic;
    \-aadr8b\   : out std_logic;
    \-aadr9b\   : out std_logic;
    apass1      : out std_logic;
    apass2      : out std_logic;
    \-apass\    : out std_logic;
    tse3a       : in  std_logic;
    \-amemenb\  : out std_logic;
    hi3         : in  std_logic;
    \-reset\    : in  std_logic;
    ir14        : in  std_logic;
    ir15        : in  std_logic;
    ir16        : in  std_logic;
    ir17        : in  std_logic;
    destmd      : out std_logic;
    destm       : in  std_logic;
    dest        : in  std_logic;
    destd       : out std_logic;
    ir21        : in  std_logic;
    ir20        : in  std_logic;
    ir19        : in  std_logic;
    ir18        : in  std_logic;
    nc489       : out std_logic;
    nc490       : in  std_logic;
    nc491       : in  std_logic;
    nc492       : in  std_logic;
    nc493       : in  std_logic;
    nc494       : out std_logic;
    ir23        : in  std_logic;
    ir22        : in  std_logic;
    wp3a        : in  std_logic;
    \-awpa\     : out std_logic;
    \-awpb\     : out std_logic;
    \-awpc\     : out std_logic;
    tse4a       : in  std_logic;
    apassenb    : out std_logic;
    \-apassenb\ : out std_logic
    );
end;

architecture ttl of cadr4_actl is
begin
  actl_3a06 : sn74s258 port map(sel   => clk3e, d0 => wadr0, d1 => ir32, dy => \-aadr0b\, c0 => wadr1, c1 => ir33, cy => \-aadr1b\, by => \-aadr2b\, b1 => ir34, b0 => wadr2, ay => \-aadr3b\, a1 => ir35, a0 => wadr3, enb_n => gnd);
  actl_3a12 : sn74s258 port map(sel   => clk3d, d0 => wadr4, d1 => ir36, dy => \-aadr4b\, c0 => wadr5, c1 => ir37, cy => \-aadr5b\, by => \-aadr6b\, b1 => ir38, b0 => wadr6, ay => \-aadr7b\, a1 => ir39, a0 => wadr7, enb_n => gnd);
  actl_3a16 : sn74s258 port map(sel   => clk3d, d0 => wadr0, d1 => ir32, dy => \-aadr0a\, c0 => wadr1, c1 => ir33, cy => \-aadr1a\, by => \-aadr2a\, b1 => ir34, b0 => wadr2, ay => \-aadr3a\, a1 => ir35, a0 => wadr3, enb_n => gnd);
  actl_3a21 : sn74s258 port map(sel   => clk3d, d0 => wadr4, d1 => ir36, dy => \-aadr4a\, c0 => wadr5, c1 => ir37, cy => \-aadr5a\, by => \-aadr6a\, b1 => ir38, b0 => wadr6, ay => \-aadr7a\, a1 => ir39, a0 => wadr7, enb_n => gnd);
  actl_3b15 : sn74s258 port map(sel   => clk3d, d0 => wadr8, d1 => ir40, dy => \-aadr8a\, c0 => wadr9, c1 => ir41, cy => \-aadr9a\, by => \-aadr8b\, b1 => ir40, b0 => wadr8, ay => \-aadr9b\, a1 => ir41, a0 => wadr9, enb_n => gnd);
  actl_3b16 : sn74s00 port map(g1b    => apass1, g1a => apass2, g1q_n => \-apass\, g2b => \-apass\, g2a => tse3a, g2q_n => \-amemenb\, g3b => '0', g3a => '0', g4a => '0', g4b => '0');
  actl_3b21 : dm93s46 port map(a0     => ir32, b0 => wadr0, a1 => ir33, b1 => wadr1, a2 => ir34, b2 => wadr2, enb => hi3, eq => apass1, a3 => ir35, b3 => wadr3, a4 => ir36, b4 => wadr4, a5 => ir37, b5 => wadr5);
  actl_3b26 : sn74s174 port map(clr_n => \-reset\, q1 => wadr0, d1 => ir14, d2 => ir15, q2 => wadr1, d3 => ir16, q3 => wadr2, clk => clk3d, q4 => wadr3, d4 => ir17, q5 => destmd, d5 => destm, d6 => dest, q6 => destd);
  actl_3b27 : dm93s46 port map(a0     => ir38, b0 => wadr6, a1 => ir39, b1 => wadr7, a2 => ir40, b2 => wadr8, enb => hi3, eq => apass2, a3 => ir41, b3 => wadr9, a4 => hi3, b4 => destd, a5 => gnd, b5 => gnd);
  actl_3b28 : am25s09 port map(sel    => destm, aq => wadr7, a0 => ir21, a1 => gnd, b1 => gnd, b0 => ir20, bq => wadr6, clk => clk3d, cq => wadr5, c0 => ir19, c1 => gnd, d1 => ir18, d0 => ir18, dq => wadr4);
  actl_3b29 : am25s09 port map(sel    => destm, aq => nc489, a0 => nc490, a1 => nc491, b1 => nc492, b0 => nc493, bq => nc494, clk => clk3d, cq => wadr9, c0 => ir23, c1 => gnd, d1 => gnd, d0 => ir22, dq => wadr8);
  actl_3b30 : sn74s37 port map(g1a    => wp3a, g1b => destd, g1y => \-awpa\, g2a => wp3a, g2b => destd, g2y => \-awpb\, g3y => \-awpc\, g3a => destd, g3b => wp3a, g4a => '0', g4b => '0');
  actl_4b11 : sn74s11 port map(g2a    => apass1, g2b => apass2, g2c => tse4a, g2y => apassenb, g1a => '0', g1b => '0', g3a => '0', g3b => '0', g3c => '0', g1c => '0');
  actl_4b14 : sn74s10 port map(g3y_n  => \-apassenb\, g3a => tse4a, g3b => apass2, g3c => apass1, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g2c => '0', g1c => '0');
end architecture;
