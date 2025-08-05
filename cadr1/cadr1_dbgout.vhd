-- CADR1_DBGOUT
-- Generated entity from suds architecture

library ieee;
use ieee.std_logic_1164.all;

entity cadr1_dbgout is
  port (
    \-dbd enb\ : inout std_logic;
    \-debug _ ud\ : out std_logic;
    \-debug out req\ : out std_logic;
    \-select debug\ : in std_logic;
    dbd0 : inout std_logic;
    dbd1 : inout std_logic;
    dbd10 : inout std_logic;
    dbd11 : inout std_logic;
    dbd12 : inout std_logic;
    dbd13 : inout std_logic;
    dbd14 : inout std_logic;
    dbd15 : inout std_logic;
    dbd2 : inout std_logic;
    dbd3 : inout std_logic;
    dbd4 : inout std_logic;
    dbd5 : inout std_logic;
    dbd6 : inout std_logic;
    dbd7 : inout std_logic;
    dbd8 : inout std_logic;
    dbd9 : inout std_logic;
    \dbub master\ : in std_logic;
    \debug ack\ : in std_logic;
    \debug active\ : inout std_logic;
    \debug in ack\ : out std_logic;
    \debug in wr\ : in std_logic;
    \debug out a0\ : out std_logic;
    \debug out a1\ : out std_logic;
    \debug out ack\ : in std_logic;
    \debug out wr\ : out std_logic;
    \debug ssyn\ : out std_logic;
    \mempar to lm\ : out std_logic;
    \select debug\ : inout std_logic;
    \select debug dlyd\ : inout std_logic;
    \spy adr 1\ : out std_logic;
    \spy adr 2\ : out std_logic;
    \spy adr 3\ : out std_logic;
    \spy adr 4\ : out std_logic;
    \uba 1\ : in std_logic;
    \uba 2\ : in std_logic;
    \uba 3\ : in std_logic;
    \uba 4\ : in std_logic;
    ubrd : in std_logic;
    ubwr : in std_logic;
    \ud _ debug\ : inout std_logic;
    \udo 0\ : inout std_logic;
    \udo 1\ : inout std_logic;
    \udo 10\ : inout std_logic;
    \udo 11\ : inout std_logic;
    \udo 12\ : inout std_logic;
    \udo 13\ : inout std_logic;
    \udo 14\ : inout std_logic;
    \udo 15\ : inout std_logic;
    \udo 2\ : inout std_logic;
    \udo 3\ : inout std_logic;
    \udo 4\ : inout std_logic;
    \udo 5\ : inout std_logic;
    \udo 6\ : inout std_logic;
    \udo 7\ : inout std_logic;
    \udo 8\ : inout std_logic;
    \udo 9\ : inout std_logic;
    \xbus par in\ : in std_logic
  );
end entity;
