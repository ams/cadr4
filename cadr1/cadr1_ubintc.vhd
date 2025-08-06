-- CADR1_UBINTC
-- Generated entity from suds architecture

library ieee;
use ieee.std_logic_1164.all;

entity cadr1_ubintc is
  port (
    \--intr in\ : inout std_logic;
    \-adr20\ : inout std_logic;
    \-adr21\ : inout std_logic;
    \-clk\ : inout std_logic;
    \-disable int grant\ : inout std_logic;
    \-intc drive\ : inout std_logic;
    \-intr ssyn\ : inout std_logic;
    \-lmadr_xbus\ : inout std_logic;
    \-load int ctl reg\ : inout std_logic;
    \-load int ctl2 reg\ : inout std_logic;
    \-local enable\ : inout std_logic;
    \-reset\ : inout std_logic;
    \-ub int\ : inout std_logic;
    \-xbus intr in\ : inout std_logic;
    \disable int grant\ : inout std_logic;
    \enable ub ints\ : inout std_logic;
    \int stops grants\ : inout std_logic;
    \intr in\ : inout std_logic;
    \intr ssyn\ : inout std_logic;
    level0 : out std_logic;
    level1 : out std_logic;
    \lm int\ : out std_logic;
    \local enable\ : in std_logic;
    \ub int\ : inout std_logic;
    udi0 : inout std_logic;
    udi10 : in std_logic;
    udi11 : in std_logic;
    udi12 : in std_logic;
    udi13 : in std_logic;
    udi15 : inout std_logic;
    udi2 : inout std_logic;
    udi3 : inout std_logic;
    udi4 : inout std_logic;
    udi5 : inout std_logic;
    udi6 : inout std_logic;
    udi7 : inout std_logic;
    udi8 : inout std_logic;
    udi9 : inout std_logic;
    udo0 : inout std_logic;
    udo1 : inout std_logic;
    udo10 : out std_logic;
    udo11 : out std_logic;
    udo12 : out std_logic;
    udo13 : out std_logic;
    udo14 : inout std_logic;
    udo15 : inout std_logic;
    udo2 : inout std_logic;
    udo3 : inout std_logic;
    udo4 : inout std_logic;
    udo5 : inout std_logic;
    udo6 : inout std_logic;
    udo7 : inout std_logic;
    udo8 : inout std_logic;
    udo9 : inout std_logic;
    \unibus intr in\ : in std_logic;
    xao20 : inout std_logic;
    xao21 : inout std_logic;
    \xbus intr in\ : in std_logic;
    \hi 15-30\ : in std_logic
  );
end entity;
