library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_ipar is
  port (
    ir41    : in  std_logic;
    ir42    : in  std_logic;
    ir43    : in  std_logic;
    ir44    : in  std_logic;
    ir45    : in  std_logic;
    ir46    : in  std_logic;
    ir47    : in  std_logic;
    ipar3   : out std_logic;
    nc381   : out std_logic;
    ir36    : in  std_logic;
    ir37    : in  std_logic;
    ir38    : in  std_logic;
    ir39    : in  std_logic;
    ir40    : in  std_logic;
    ir5     : in  std_logic;
    ir6     : in  std_logic;
    ir7     : in  std_logic;
    ir8     : in  std_logic;
    ir9     : in  std_logic;
    ir10    : in  std_logic;
    ir11    : in  std_logic;
    ipar0   : out std_logic;
    nc384   : out std_logic;
    ir0     : in  std_logic;
    ir1     : in  std_logic;
    ir2     : in  std_logic;
    ir3     : in  std_logic;
    ir4     : in  std_logic;
    ir29    : in  std_logic;
    ir30    : in  std_logic;
    ir31    : in  std_logic;
    ir32    : in  std_logic;
    ir33    : in  std_logic;
    ir34    : in  std_logic;
    ir35    : in  std_logic;
    ipar2   : out std_logic;
    nc382   : out std_logic;
    ir24    : in  std_logic;
    ir25    : in  std_logic;
    ir26    : in  std_logic;
    ir27    : in  std_logic;
    ir28    : in  std_logic;
    gnd     : in  std_logic;
    iparity : out std_logic;
    nc380   : out std_logic;
    ipar1   : out std_logic;
    ir48    : in  std_logic;
    ir17    : in  std_logic;
    ir18    : in  std_logic;
    ir19    : in  std_logic;
    ir20    : in  std_logic;
    ir21    : in  std_logic;
    ir22    : in  std_logic;
    ir23    : in  std_logic;
    nc383   : out std_logic;
    ir12    : in  std_logic;
    ir13    : in  std_logic;
    ir14    : in  std_logic;
    ir15    : in  std_logic;
    ir16    : in  std_logic;
    imodd   : in  std_logic;
    iparok  : out std_logic
    );
end;

architecture ttl of cadr4_ipar is
begin
  ipar_3e02 : am93s48 port map(i6  => ir41, i5 => ir42, i4 => ir43, i3 => ir44, i2 => ir45, i1 => ir46, i0 => ir47, po => ipar3, pe => nc381, i11 => ir36, i10 => ir37, i9 => ir38, i8 => ir39, i7 => ir40);
  ipar_3e04 : am93s48 port map(i6  => ir5, i5 => ir6, i4 => ir7, i3 => ir8, i2 => ir9, i1 => ir10, i0 => ir11, po => ipar0, pe => nc384, i11 => ir0, i10 => ir1, i9 => ir2, i8 => ir3, i7 => ir4);
  ipar_3e21 : am93s48 port map(i6  => ir29, i5 => ir30, i4 => ir31, i3 => ir32, i2 => ir33, i1 => ir34, i0 => ir35, po => ipar2, pe => nc382, i11 => ir24, i10 => ir25, i9 => ir26, i8 => ir27, i7 => ir28);
  ipar_3f22 : am93s48 port map(i6  => gnd, i5 => gnd, i4 => gnd, i3 => gnd, i2 => gnd, i1 => gnd, i0 => gnd, po => iparity, pe => nc380, i11 => ipar0, i10 => ipar1, i9 => ipar2, i8 => ipar3, i7 => ir48);
  ipar_3f24 : am93s48 port map(i6  => ir17, i5 => ir18, i4 => ir19, i3 => ir20, i2 => ir21, i1 => ir22, i0 => ir23, po => ipar1, pe => nc383, i11 => ir12, i10 => ir13, i9 => ir14, i8 => ir15, i7 => ir16);
  ipar_4e03 : sn74s32 port map(g2a => imodd, g2b => iparity, g2y => iparok, g1a => '0', g1b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
end architecture;
