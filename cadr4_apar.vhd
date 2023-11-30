library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_apar is
  port (
    a26       : in  std_logic;
    a27       : in  std_logic;
    a28       : in  std_logic;
    a29       : in  std_logic;
    a30       : in  std_logic;
    a31b      : in  std_logic;
    aparity   : in  std_logic;
    aparok    : out std_logic;
    nc432     : out std_logic;
    aparl     : out std_logic;
    aparm     : out std_logic;
    gnd       : in  std_logic;
    a24       : in  std_logic;
    a25       : in  std_logic;
    a17       : in  std_logic;
    a18       : in  std_logic;
    a19       : in  std_logic;
    a20       : in  std_logic;
    a21       : in  std_logic;
    a22       : in  std_logic;
    a23       : in  std_logic;
    nc433     : out std_logic;
    a12       : in  std_logic;
    a13       : in  std_logic;
    a14       : in  std_logic;
    a15       : in  std_logic;
    a16       : in  std_logic;
    a5        : in  std_logic;
    a6        : in  std_logic;
    a7        : in  std_logic;
    a8        : in  std_logic;
    a9        : in  std_logic;
    a10       : in  std_logic;
    a11       : in  std_logic;
    nc434     : out std_logic;
    a0        : in  std_logic;
    a1        : in  std_logic;
    a2        : in  std_logic;
    a3        : in  std_logic;
    a4        : in  std_logic;
    m17       : in  std_logic;
    m18       : in  std_logic;
    m19       : in  std_logic;
    m20       : in  std_logic;
    m21       : in  std_logic;
    m22       : in  std_logic;
    m23       : in  std_logic;
    mparm     : out std_logic;
    nc436     : out std_logic;
    m12       : in  std_logic;
    m13       : in  std_logic;
    m14       : in  std_logic;
    m15       : in  std_logic;
    m16       : in  std_logic;
    m5        : in  std_logic;
    m6        : in  std_logic;
    m7        : in  std_logic;
    m8        : in  std_logic;
    m9        : in  std_logic;
    m10       : in  std_logic;
    m11       : in  std_logic;
    mparl     : out std_logic;
    nc435     : out std_logic;
    m0        : in  std_logic;
    m1        : in  std_logic;
    m2        : in  std_logic;
    m3        : in  std_logic;
    m4        : in  std_logic;
    mpareven  : out std_logic;
    srcm      : in  std_logic;
    mmemparok : out std_logic;
    pdlenb    : in  std_logic;
    pdlparok  : out std_logic;
    m26       : in  std_logic;
    m27       : in  std_logic;
    m28       : in  std_logic;
    m29       : in  std_logic;
    m30       : in  std_logic;
    m31       : in  std_logic;
    mparity   : in  std_logic;
    mparodd   : out std_logic;
    m24       : in  std_logic;
    m25       : in  std_logic);
end;

architecture ttl of cadr4_apar is
begin
  apar_3a28 : am93s48 port map(i6  => a26, i5 => a27, i4 => a28, i3 => a29, i2 => a30, i1 => a31b, i0 => aparity, po => aparok, pe => nc432, i11 => aparl, i10 => aparm, i9 => gnd, i8 => a24, i7 => a25);
  apar_3a29 : am93s48 port map(i6  => a17, i5 => a18, i4 => a19, i3 => a20, i2 => a21, i1 => a22, i0 => a23, po => aparm, pe => nc433, i11 => a12, i10 => a13, i9 => a14, i8 => a15, i7 => a16);
  apar_3a30 : am93s48 port map(i6  => a5, i5 => a6, i4 => a7, i3 => a8, i2 => a9, i1 => a10, i0 => a11, po => aparl, pe => nc434, i11 => a0, i10 => a1, i9 => a2, i8 => a3, i7 => a4);
  apar_4a12 : am93s48 port map(i6  => m17, i5 => m18, i4 => m19, i3 => m20, i2 => m21, i1 => m22, i0 => m23, po => mparm, pe => nc436, i11 => m12, i10 => m13, i9 => m14, i8 => m15, i7 => m16);
  apar_4a14 : am93s48 port map(i6  => m5, i5 => m6, i4 => m7, i3 => m8, i2 => m9, i1 => m10, i0 => m11, po => mparl, pe => nc435, i11 => m0, i10 => m1, i9 => m2, i8 => m3, i7 => m4);
  apar_4a17 : sn74s00 port map(g1b => mpareven, g1a => srcm, g1q_n => mmemparok, g2b => mpareven, g2a => pdlenb, g2q_n => pdlparok, g3b => '0', g3a => '0', g4a => '0', g4b => '0');
  apar_4b15 : am93s48 port map(i6  => m26, i5 => m27, i4 => m28, i3 => m29, i2 => m30, i1 => m31, i0 => mparity, po => mparodd, pe => mpareven, i11 => mparl, i10 => mparm, i9 => gnd, i8 => m24, i7 => m25);
end architecture;
