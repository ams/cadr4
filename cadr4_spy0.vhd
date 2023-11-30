library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_spy0 is
  port (
    eadr0        : in  std_logic;
    eadr1        : in  std_logic;
    eadr2        : in  std_logic;
    \-dbread\    : in  std_logic;
    eadr3        : in  std_logic;
    hi1          : in  std_logic;
    \-spy.obh\   : out std_logic;
    \-spy.obl\   : out std_logic;
    \-spy.pc\    : out std_logic;
    \-spy.opc\   : out std_logic;
    nc3          : out std_logic;
    \-spy.irh\   : out std_logic;
    \-spy.irm\   : out std_logic;
    \-spy.irl\   : out std_logic;
    gnd          : in  std_logic;
    \-spy.sth\   : out std_logic;
    \-spy.stl\   : out std_logic;
    \-spy.ah\    : out std_logic;
    \-spy.al\    : out std_logic;
    \-spy.mh\    : out std_logic;
    \-spy.ml\    : out std_logic;
    \-spy.flag2\ : out std_logic;
    \-spy.flag1\ : out std_logic;
    \-dbwrite\   : in  std_logic;
    nc1          : out std_logic;
    nc2          : out std_logic;
    \-ldmode\    : out std_logic;
    \-ldopc\     : out std_logic;
    \-ldclk\     : out std_logic;
    \-lddbirh\   : out std_logic;
    \-lddbirm\   : out std_logic;
    \-lddbirl\   : out std_logic);
end;

architecture ttl of cadr4_spy0 is
begin
  spy0_1f01 : sn74s138 port map(a => eadr0, b => eadr1, c => eadr2, g2a => \-dbread\, g2b => eadr3, g1 => hi1, y7 => \-spy.obh\, y6 => \-spy.obl\, y5 => \-spy.pc\, y4 => \-spy.opc\, y3 => nc3, y2 => \-spy.irh\, y1 => \-spy.irm\, y0 => \-spy.irl\);
  spy0_1f02 : sn74s138 port map(a => eadr0, b => eadr1, c => eadr2, g2a => \-dbread\, g2b => gnd, g1 => eadr3, y7 => \-spy.sth\, y6 => \-spy.stl\, y5 => \-spy.ah\, y4 => \-spy.al\, y3 => \-spy.mh\, y2 => \-spy.ml\, y1 => \-spy.flag2\, y0 => \-spy.flag1\);
  spy0_1f03 : sn74s138 port map(a => eadr0, b => eadr1, c => eadr2, g2a => \-dbwrite\, g2b => gnd, g1 => hi1, y7 => nc1, y6 => nc2, y5 => \-ldmode\, y4 => \-ldopc\, y3 => \-ldclk\, y2 => \-lddbirh\, y1 => \-lddbirm\, y0 => \-lddbirl\);
end architecture;
