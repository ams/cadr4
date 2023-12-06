library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_vmem2 is
  port (
    gnd        : in  std_logic;
    vmap4b     : out std_logic;
    vmap3b     : out std_logic;
    vmap2b     : out std_logic;
    vmap1b     : out std_logic;
    vmap0b     : out std_logic;
    \-vmo20\   : out std_logic;
    \-mapi12b\ : in  std_logic;
    \-mapi11b\ : in  std_logic;
    \-mapi10b\ : in  std_logic;
    \-mapi9b\  : in  std_logic;
    \-mapi8b\  : in  std_logic;
    \-vm1wpb\  : in  std_logic;
    \-vma20\   : in  std_logic;
    \-vmo21\   : out std_logic;
    \-vma21\   : in  std_logic;
    \-vmo22\   : out std_logic;
    \-vma22\   : in  std_logic;
    \-vmo23\   : out std_logic;
    \-vma23\   : in  std_logic;
    \-vmo16\   : out std_logic;
    \-vma16\   : in  std_logic;
    \-vmo17\   : out std_logic;
    \-vma17\   : in  std_logic;
    \-vmo18\   : out std_logic;
    \-vma18\   : in  std_logic;
    \-vmo19\   : out std_logic;
    \-vma19\   : in  std_logic;
    \-vmo12\   : out std_logic;
    \-vma12\   : in  std_logic;
    \-vmo13\   : out std_logic;
    \-vma13\   : in  std_logic;
    \-vmo14\   : out std_logic;
    \-vma14\   : in  std_logic;
    \-vmo15\   : out std_logic;
    \-vma15\   : in  std_logic;
    vmoparm    : out std_logic;
    nc107      : out std_logic;
    vmopar     : out std_logic;
    vm1pari    : in  std_logic;
    nc101      : in  std_logic;
    nc102      : in  std_logic;
    nc103      : in  std_logic;
    \-vmap4\   : in  std_logic;
    \-vmap3\   : in  std_logic;
    \-vmap2\   : in  std_logic;
    nc104      : out std_logic;
    \-vmap1\   : in  std_logic;
    nc105      : out std_logic;
    \-vmap0\   : in  std_logic;
    nc106      : out std_logic;
    \-vmo5\    : in  std_logic;
    \-vmo6\    : in  std_logic;
    \-vmo7\    : in  std_logic;
    \-vmo8\    : in  std_logic;
    \-vmo9\    : in  std_logic;
    \-vmo10\   : in  std_logic;
    \-vmo11\   : in  std_logic;
    vmoparl    : out std_logic;
    nc108      : out std_logic;
    \-vmo0\    : in  std_logic;
    \-vmo1\    : in  std_logic;
    \-vmo2\    : in  std_logic;
    \-vmo3\    : in  std_logic;
    \-vmo4\    : in  std_logic;
    vmoparck   : out std_logic;
    vmoparodd  : out std_logic
    );
end;

architecture ttl of cadr4_vmem2 is
begin
  vmem2_1b01 : am93425a port map(ce_n   => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo20\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma20\);
  vmem2_1b02 : am93425a port map(ce_n   => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo21\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma21\);
  vmem2_1b03 : am93425a port map(ce_n   => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo22\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma22\);
  vmem2_1b04 : am93425a port map(ce_n   => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo23\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma23\);
  vmem2_1b06 : am93425a port map(ce_n   => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo16\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma16\);
  vmem2_1b07 : am93425a port map(ce_n   => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo17\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma17\);
  vmem2_1b08 : am93425a port map(ce_n   => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo18\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma18\);
  vmem2_1b09 : am93425a port map(ce_n   => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo19\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma19\);
  vmem2_1b11 : am93425a port map(ce_n   => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo12\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma12\);
  vmem2_1b12 : am93425a port map(ce_n   => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo13\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma13\);
  vmem2_1b13 : am93425a port map(ce_n   => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo14\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma14\);
  vmem2_1b14 : am93425a port map(ce_n   => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo15\, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma15\);
  vmem2_1b17 : am93s48 port map(i6      => \-vmo17\, i5 => \-vmo18\, i4 => \-vmo19\, i3 => \-vmo20\, i2 => \-vmo21\, i1 => \-vmo22\, i0 => \-vmo23\, po => vmoparm, pe => nc107, i11 => \-vmo12\, i10 => \-vmo13\, i9 => \-vmo14\, i8 => \-vmo15\, i7 => \-vmo16\);
  vmem2_1c05 : am93425a port map(ce_n   => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => vmopar, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => vm1pari);
  vmem2_1c10 : sn74s240 port map(aenb_n => gnd, ain0 => nc101, bout3 => vmap0b, ain1 => nc102, bout2 => vmap1b, ain2 => nc103, bout1 => vmap2b, ain3 => \-vmap4\, bout0 => vmap3b, bin0 => \-vmap3\, aout3 => vmap4b, bin1 => \-vmap2\, aout2 => nc104, bin2 => \-vmap1\, aout1 => nc105, bin3 => \-vmap0\, aout0 => nc106, benb_n => gnd);
  vmem2_1d03 : am93s48 port map(i6      => \-vmo5\, i5 => \-vmo6\, i4 => \-vmo7\, i3 => \-vmo8\, i2 => \-vmo9\, i1 => \-vmo10\, i0 => \-vmo11\, po => vmoparl, pe => nc108, i11 => \-vmo0\, i10 => \-vmo1\, i9 => \-vmo2\, i8 => \-vmo3\, i7 => \-vmo4\);
  vmem2_1d12 : sn74s86 port map(g2a     => vmoparm, g2b => vmoparl, g2y => vmoparck, g3y => vmoparodd, g3a => vmopar, g3b => vmoparck, g1a => '0', g1b => '0', g4a => '0', g4b => '0');
end architecture;