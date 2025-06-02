library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_spcpar is
  port (
    spcwparh    : out std_logic;
    \-spcwparl\ : out std_logic;
    spcwpar     : out std_logic;
    spcw17      : in  std_logic;
    spcw18      : in  std_logic;
    gnd         : in  std_logic;
    spcw12      : in  std_logic;
    spcw13      : in  std_logic;
    spcw14      : in  std_logic;
    spcw15      : in  std_logic;
    spcw16      : in  std_logic;
    spcw5       : in  std_logic;
    spcw6       : in  std_logic;
    spcw7       : in  std_logic;
    spcw8       : in  std_logic;
    spcw9       : in  std_logic;
    spcw10      : in  std_logic;
    spcw11      : in  std_logic;
    spcw0       : in  std_logic;
    spcw1       : in  std_logic;
    spcw2       : in  std_logic;
    spcw3       : in  std_logic;
    spcw4       : in  std_logic;
    spc16       : in  std_logic;
    spc17       : in  std_logic;
    spc18       : in  std_logic;
    spcpar      : in  std_logic;
    spcparh     : out std_logic;
    spc11       : in  std_logic;
    spc12       : in  std_logic;
    spc13       : in  std_logic;
    spc14       : in  std_logic;
    spc15       : in  std_logic;
    spc5        : in  std_logic;
    spc6        : in  std_logic;
    spc7        : in  std_logic;
    spc8        : in  std_logic;
    spc9        : in  std_logic;
    spc10       : in  std_logic;
    spcparok    : out std_logic;
    spc0        : in  std_logic;
    spc1        : in  std_logic;
    spc2        : in  std_logic;
    spc3        : in  std_logic;
    spc4        : in  std_logic);
end;

architecture ttl of cadr_spcpar is
  signal nc162 : std_logic;
  signal nc163 : std_logic;
  signal nc164 : std_logic;
  signal nc165 : std_logic;
begin
  spcpar_3e19 : sn74s86 port map(g2a => spcwparh, g2b => \-spcwparl\, g2y => spcwpar, g1a => '0', g1b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
  spcpar_4f16 : am93s48 port map(i6  => spcw17, i5 => spcw18, i4 => gnd, i3 => gnd, i2 => gnd, i1 => gnd, i0 => gnd, po => spcwparh, pe => nc162, i11 => spcw12, i10 => spcw13, i9 => spcw14, i8 => spcw15, i7 => spcw16);
  spcpar_4f17 : am93s48 port map(i6  => spcw5, i5 => spcw6, i4 => spcw7, i3 => spcw8, i2 => spcw9, i1 => spcw10, i0 => spcw11, po => nc163, pe => \-spcwparl\, i11 => spcw0, i10 => spcw1, i9 => spcw2, i8 => spcw3, i7 => spcw4);
  spcpar_4f21 : am93s48 port map(i6  => spc16, i5 => spc17, i4 => spc18, i3 => spcpar, i2 => gnd, i1 => gnd, i0 => gnd, po => spcparh, pe => nc164, i11 => spc11, i10 => spc12, i9 => spc13, i8 => spc14, i7 => spc15);
  spcpar_4f26 : am93s48 port map(i6  => spc5, i5 => spc6, i4 => spc7, i3 => spc8, i2 => spc9, i1 => spc10, i0 => spcparh, po => spcparok, pe => nc165, i11 => spc0, i10 => spc1, i9 => spc2, i8 => spc3, i7 => spc4);
end architecture;
