library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_iwrpar is
  port (
    iwr41 : in  std_logic;
    iwr42 : in  std_logic;
    iwr43 : in  std_logic;
    iwr44 : in  std_logic;
    iwr45 : in  std_logic;
    iwr46 : in  std_logic;
    iwr47 : in  std_logic;
    iwrp4 : out std_logic;
    nc98  : out std_logic;
    iwr36 : in  std_logic;
    iwr37 : in  std_logic;
    iwr38 : in  std_logic;
    iwr39 : in  std_logic;
    iwr40 : in  std_logic;
    iwr29 : in  std_logic;
    iwr30 : in  std_logic;
    iwr31 : in  std_logic;
    iwr32 : in  std_logic;
    iwr33 : in  std_logic;
    iwr34 : in  std_logic;
    iwr35 : in  std_logic;
    iwrp3 : out std_logic;
    nc97  : out std_logic;
    iwr24 : in  std_logic;
    iwr25 : in  std_logic;
    iwr26 : in  std_logic;
    iwr27 : in  std_logic;
    iwr28 : in  std_logic;
    iwr17 : in  std_logic;
    iwr18 : in  std_logic;
    iwr19 : in  std_logic;
    iwr20 : in  std_logic;
    iwr21 : in  std_logic;
    iwr22 : in  std_logic;
    iwr23 : in  std_logic;
    iwrp2 : out std_logic;
    nc96  : out std_logic;
    iwr12 : in  std_logic;
    iwr13 : in  std_logic;
    iwr14 : in  std_logic;
    iwr15 : in  std_logic;
    iwr16 : in  std_logic;
    iwr5  : in  std_logic;
    iwr6  : in  std_logic;
    iwr7  : in  std_logic;
    iwr8  : in  std_logic;
    iwr9  : in  std_logic;
    iwr10 : in  std_logic;
    iwr11 : in  std_logic;
    iwrp1 : out std_logic;
    nc95  : out std_logic;
    iwr0  : in  std_logic;
    iwr1  : in  std_logic;
    iwr2  : in  std_logic;
    iwr3  : in  std_logic;
    iwr4  : in  std_logic;
    gnd   : in  std_logic;
    nc94  : out std_logic;
    iwr48 : out std_logic);
end;

architecture ttl of cadr4_iwrpar is
begin
  iwrpar_1b11 : am93s48 port map(i6 => iwr41, i5 => iwr42, i4 => iwr43, i3 => iwr44, i2 => iwr45, i1 => iwr46, i0 => iwr47, po => iwrp4, pe => nc98, i11 => iwr36, i10 => iwr37, i9 => iwr38, i8 => iwr39, i7 => iwr40);
  iwrpar_1b12 : am93s48 port map(i6 => iwr29, i5 => iwr30, i4 => iwr31, i3 => iwr32, i2 => iwr33, i1 => iwr34, i0 => iwr35, po => iwrp3, pe => nc97, i11 => iwr24, i10 => iwr25, i9 => iwr26, i8 => iwr27, i7 => iwr28);
  iwrpar_1b13 : am93s48 port map(i6 => iwr17, i5 => iwr18, i4 => iwr19, i3 => iwr20, i2 => iwr21, i1 => iwr22, i0 => iwr23, po => iwrp2, pe => nc96, i11 => iwr12, i10 => iwr13, i9 => iwr14, i8 => iwr15, i7 => iwr16);
  iwrpar_1b14 : am93s48 port map(i6 => iwr5, i5 => iwr6, i4 => iwr7, i3 => iwr8, i2 => iwr9, i1 => iwr10, i0 => iwr11, po => iwrp1, pe => nc95, i11 => iwr0, i10 => iwr1, i9 => iwr2, i8 => iwr3, i7 => iwr4);
  iwrpar_1b15 : am93s48 port map(i6 => gnd, i5 => gnd, i4 => gnd, i3 => gnd, i2 => gnd, i1 => gnd, i0 => gnd, po => nc94, pe => iwr48, i11 => iwrp1, i10 => iwrp2, i9 => iwrp3, i8 => iwrp4, i7 => gnd);
end architecture;
