library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_vmem0 is
  port (
    \-vmap0\   : out std_logic;
    \-vmap1\   : out std_logic;
    \-vmap2\   : out std_logic;
    \-vmap3\   : out std_logic;
    \-vmap4\   : out std_logic;
    vpari      : out std_logic;
    gnd        : in  std_logic;
    \-vma27\   : in  std_logic;
    \-vma28\   : in  std_logic;
    \-vma29\   : in  std_logic;
    vm0pari    : out std_logic;
    \-vma30\   : in  std_logic;
    \-vma31\   : in  std_logic;
    \-mapi23\  : out std_logic;
    mapi22     : in  std_logic;
    mapi21     : in  std_logic;
    mapi20     : in  std_logic;
    mapi19     : in  std_logic;
    mapi18     : in  std_logic;
    mapi17     : in  std_logic;
    mapi16     : in  std_logic;
    mapi15     : in  std_logic;
    mapi14     : in  std_logic;
    mapi13     : in  std_logic;
    \-vm0wpb\  : in  std_logic;
    mapi23     : in  std_logic;
    \-vm0wpa\  : in  std_logic;
    memstart   : in  std_logic;
    srcmap     : in  std_logic;
    \-use.map\ : out std_logic;
    v0parok    : out std_logic;
    vmoparodd  : in  std_logic;
    vmoparok   : out std_logic);
end;

architecture ttl of cadr4_vmem0 is
  signal internal14 : std_logic;
  signal nc113      : std_logic;
  signal nc114      : std_logic;
begin
  vmem0_1c01 : sn74s280 port map(i0   => \-vmap0\, i1 => \-vmap1\, i2 => \-vmap2\, even => nc113, odd => internal14, i3 => \-vmap3\, i4 => \-vmap4\, i5 => vpari, i6 => gnd, i7 => gnd, i8 => gnd);
  vmem0_1c02 : sn74s280 port map(i0   => \-vma27\, i1 => \-vma28\, i2 => \-vma29\, even => vm0pari, odd => nc114, i3 => \-vma30\, i4 => \-vma31\, i5 => gnd, i6 => gnd, i7 => gnd, i8 => gnd);
  vmem0_1c06 : am93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap2\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\, di => \-vma29\);
  vmem0_1c07 : am93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap0\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\, di => \-vma27\);
  vmem0_1c08 : am93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap1\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\, di => \-vma28\);
  vmem0_1c09 : am93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap2\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\, di => \-vma29\);
  vmem0_1c11 : am93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap3\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\, di => \-vma30\);
  vmem0_1c12 : am93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap4\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\, di => \-vma31\);
  vmem0_1c13 : am93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap3\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\, di => \-vma30\);
  vmem0_1c14 : am93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap4\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\, di => \-vma31\);
  vmem0_1d04 : am93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => vpari, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\, di => vm0pari);
  vmem0_1d05 : am93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => vpari, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\, di => vm0pari);
  vmem0_1d09 : am93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap0\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\, di => \-vma27\);
  vmem0_1d10 : am93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap1\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\, di => \-vma28\);
  vmem0_1d18 : sn74s04 port map(g1a   => mapi23, g1q_n => \-mapi23\, g2a => '0', g3a => '0', g4a => '0', g5a => '0', g6a => '0');
  vmem0_1d27 : sn74s02 port map(g4b   => memstart, g4a => srcmap, g4q_n => \-use.map\, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g3b => '0', g3a => '0');
  vmem0_1e26 : sn74s32 port map(g1a   => \-use.map\, g1b => internal14, g1y => v0parok, g2a => \-use.map\, g2b => vmoparodd, g2y => vmoparok, g3a => '0', g3b => '0', g4a => '0', g4b => '0');
end architecture;
