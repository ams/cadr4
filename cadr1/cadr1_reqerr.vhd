-- CADR1_REQERR
-- Generated entity from suds architecture

library ieee;
use ieee.std_logic_1164.all;

entity cadr1_reqerr is
  port (
    \--xbus request\ : inout std_logic;
    \-adrpar\ : in std_logic;
    \-any par error\ : inout std_logic;
    \-db read status\ : inout std_logic;
    \-free\ : inout std_logic;
    \-int busy t80\ : inout std_logic;
    \-lmx grant\ : in std_logic;
    \-nxm timeout\ : inout std_logic;
    \-reset err\ : inout std_logic;
    \-ub err drive\ : in std_logic;
    \-ub invalid\ : in std_logic;
    \-xao par even\ : in std_logic;
    \-xbus ignpar in\ : inout std_logic;
    \bus par even\ : in std_logic;
    \dbd 0\ : inout std_logic;
    \dbd 1\ : inout std_logic;
    \dbd 2\ : inout std_logic;
    \dbd 3\ : inout std_logic;
    \dbd 4\ : inout std_logic;
    \dbd 5\ : inout std_logic;
    \dbd 6\ : inout std_logic;
    \dbd 7\ : inout std_logic;
    \lm adr par error\ : inout std_logic;
    \lm par error\ : inout std_logic;
    lmwr : in std_logic;
    \lmx grant a\ : in std_logic;
    \mempar from lm\ : in std_logic;
    \ub map error\ : inout std_logic;
    \ub nxm error\ : inout std_logic;
    \ub xbus t100\ : inout std_logic;
    \udo 0\ : out std_logic;
    \udo 1\ : out std_logic;
    \udo 2\ : out std_logic;
    \udo 3\ : out std_logic;
    \udo 4\ : out std_logic;
    \udo 5\ : out std_logic;
    \udo 6\ : out std_logic;
    \udo 7\ : out std_logic;
    \unibus request\ : inout std_logic;
    \write through enb\ : inout std_logic;
    \xb nxm error\ : inout std_logic;
    \xb par error\ : inout std_logic;
    \xbus ignpar in\ : in std_logic;
    \xbus par in\ : in std_logic;
    \xbus par out\ : out std_logic;
    \xbus request\ : inout std_logic;
    xrd : in std_logic;
    \hi 1-14\ : in std_logic
  );
end entity;
