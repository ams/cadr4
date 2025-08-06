-- CADR1_DBGIN
-- Generated entity from suds architecture

library ieee;
use ieee.std_logic_1164.all;

entity cadr1_dbgin is
  port (
    \-db adr0 clk\ : inout std_logic;
    \-db adr1 clk\ : inout std_logic;
    \-db need ub\ : inout std_logic;
    \-db read status\ : inout std_logic;
    \-dbub master\ : inout std_logic;
    \-debug in req\ : inout std_logic;
    \-debug reset\ : in std_logic;
    \-debug timeout inh\ : out std_logic;
    \-debugee reset\ : inout std_logic;
    \-lm power reset\ : in std_logic;
    \-lm unibus reset\ : in std_logic;
    \-local enable\ : inout std_logic;
    \-reset\ : out std_logic;
    \busint lm reset l reset processor\ : out std_logic;
    \db need ub\ : out std_logic;
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
    \debug ack\ : out std_logic;
    \debug in a0\ : inout std_logic;
    \debug in a1\ : inout std_logic;
    \debug in wr\ : inout std_logic;
    \debug out ack\ : inout std_logic;
    \local enable\ : inout std_logic;
    \reset reset to busses reset arbiter\ : inout std_logic;
    \ssyn t0\ : in std_logic;
    uao1 : inout std_logic;
    uao10 : inout std_logic;
    uao11 : inout std_logic;
    uao12 : inout std_logic;
    uao13 : inout std_logic;
    uao14 : inout std_logic;
    uao15 : inout std_logic;
    uao16 : inout std_logic;
    uao17 : out std_logic;
    uao2 : inout std_logic;
    uao3 : inout std_logic;
    uao4 : inout std_logic;
    uao5 : inout std_logic;
    uao6 : inout std_logic;
    uao7 : inout std_logic;
    uao8 : inout std_logic;
    uao9 : inout std_logic;
    \unibus init in\ : in std_logic;
    \hi 1-14\ : in std_logic;
    \hi 15-30\ : in std_logic
  );
end entity;
