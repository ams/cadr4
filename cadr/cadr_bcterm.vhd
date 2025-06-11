library ieee;
use ieee.std_logic_1164.all;

entity cadr_bcterm is
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
