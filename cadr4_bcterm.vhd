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
    \-memack\   : out std_logic);
end;

architecture ttl of cadr4_bcterm is  
begin
  bcterm_1b15 : sip220_330_8 port map(
    r2 => mem0,        -- p2 (MEM0)
    r3 => mem1,        -- p3 (MEM1)
    r4 => mem2,        -- p4 (MEM2)
    r5 => mem3,        -- p5 (MEM3)
    r6 => mem4,        -- p6 (MEM4)
    r7 => mem5         -- p7 (MEM5)
  );
  bcterm_1b20 : sip220_330_8 port map(
    r2 => mem12,       -- p2 (MEM12)
    r3 => mem13,       -- p3 (MEM13)
    r4 => mem14,       -- p4 (MEM14)
    r5 => mem15,       -- p5 (MEM15)
    r6 => mem16,       -- p6 (MEM16)
    r7 => mem17        -- p7 (MEM17)
  );
  bcterm_1b25 : sip220_330_8 port map(
    r2 => mem24,       -- p2 (MEM24)
    r3 => mem25,       -- p3 (MEM25)
    r4 => mem26,       -- p4 (MEM26)
    r5 => mem27,       -- p5 (MEM27)
    r6 => mem28,       -- p6 (MEM28)
    r7 => mem29        -- p7 (MEM29)
  );
  bcterm_2c25 : sip330_470_8 port map(
    r2 => \-memgrant\, -- p2 (-MEMGRANT)
    r3 => int,         -- p3 (INT)
    r4 => \-loadmd\,   -- p4 (-LOADMD)
    r5 => \-ignpar\,   -- p5 (-IGNPAR)
    r6 => \-memack\,   -- p6 (-MEMACK)
    r7 => open         -- p7 (NC)
  );
end architecture;
