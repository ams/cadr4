library ieee;
use ieee.std_logic_1164.all;

entity cadr_spy0 is
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
    \-spy.irh\   : out std_logic;
    \-spy.irm\   : out std_logic;
    \-spy.irl\   : out std_logic;
    \-spy.sth\   : out std_logic;
    \-spy.stl\   : out std_logic;
    \-spy.ah\    : out std_logic;
    \-spy.al\    : out std_logic;
    \-spy.mh\    : out std_logic;
    \-spy.ml\    : out std_logic;
    \-spy.flag2\ : out std_logic;
    \-spy.flag1\ : out std_logic;
    \-dbwrite\   : in  std_logic;
    \-ldmode\    : out std_logic;
    \-ldopc\     : out std_logic;
    \-ldclk\     : out std_logic;
    \-lddbirh\   : out std_logic;
    \-lddbirm\   : out std_logic;
    \-lddbirl\   : out std_logic
    );
end;
