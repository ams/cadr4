library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_bcterm is
  port (
    mem0        : out std_logic;
    mem1        : out std_logic;
    mem2        : out std_logic;
    mem3        : out std_logic;
    mem4        : out std_logic;
    mem5        : out std_logic;
    mem12       : out std_logic;
    mem13       : out std_logic;
    mem14       : out std_logic;
    mem15       : out std_logic;
    mem16       : out std_logic;
    mem17       : out std_logic;
    mem24       : out std_logic;
    mem25       : out std_logic;
    mem26       : out std_logic;
    mem27       : out std_logic;
    mem28       : out std_logic;
    mem29       : out std_logic;
    \-memgrant\ : out std_logic;
    int         : out std_logic;
    \-loadmd\   : out std_logic;
    \-ignpar\   : out std_logic;
    \-memack\   : out std_logic;
    nc431       : out std_logic);
end;

architecture ttl of cadr4_bcterm is
begin
  bcterm_1b15 : sip220_330_8 port map(r2 => mem0, r3 => mem1, r4 => mem2, r5 => mem3, r6 => mem4, r7 => mem5);
  bcterm_1b20 : sip220_330_8 port map(r2 => mem12, r3 => mem13, r4 => mem14, r5 => mem15, r6 => mem16, r7 => mem17);
  bcterm_1b25 : sip220_330_8 port map(r2 => mem24, r3 => mem25, r4 => mem26, r5 => mem27, r6 => mem28, r7 => mem29);
  bcterm_2c25 : sip330_470_8 port map(r2 => \-memgrant\, r3 => int, r4 => \-loadmd\, r5 => \-ignpar\, r6 => \-memack\, r7 => nc431);
end architecture;
