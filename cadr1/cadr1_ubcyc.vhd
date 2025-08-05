-- CADR1_UBCYC
-- Generated entity from suds architecture

library ieee;
use ieee.std_logic_1164.all;

entity cadr1_ubcyc is
  port (
    \--uba16\ : in std_logic;
    \--uba17\ : in std_logic;
    \-intc drive\ : out std_logic;
    \-load int ctl reg\ : out std_logic;
    \-load int ctl2 reg\ : out std_logic;
    \-reset err\ : inout std_logic;
    \-select debug\ : out std_logic;
    \-select interrupt\ : inout std_logic;
    \-select page\ : inout std_logic;
    \-select spy\ : inout std_logic;
    \-ub err drive\ : out std_logic;
    \-ub read buffer\ : inout std_logic;
    \-ub read xbus\ : out std_logic;
    \-ub reg cyc t150\ : inout std_logic;
    \-ub wr xbus\ : inout std_logic;
    \-ub write buffer\ : inout std_logic;
    \-ub write xbus\ : out std_logic;
    \-uba12\ : in std_logic;
    \-uba14\ : in std_logic;
    \-uba15\ : in std_logic;
    \-uba7\ : in std_logic;
    \-uba8\ : in std_logic;
    \-uba9\ : in std_logic;
    \-ubpn3a\ : in std_logic;
    \-write through\ : inout std_logic;
    \-write through enb\ : inout std_logic;
    \c1 in\ : in std_logic;
    \msyn in\ : in std_logic;
    \select page\ : out std_logic;
    \ub reg cyc t0\ : inout std_logic;
    \ub reg cyc t100\ : out std_logic;
    \ub reg cyc t150\ : inout std_logic;
    \ub reg cyc t200\ : out std_logic;
    \ub reg cyc t250\ : out std_logic;
    \ub reg cyc t50\ : inout std_logic;
    \ub reg write pulse\ : inout std_logic;
    \ub17-14=map\ : inout std_logic;
    \uba 1\ : in std_logic;
    \uba 2\ : in std_logic;
    \uba 5\ : in std_logic;
    \uba 6\ : in std_logic;
    uba1 : in std_logic;
    uba10 : in std_logic;
    uba11 : in std_logic;
    uba13 : in std_logic;
    uba14 : in std_logic;
    uba15 : in std_logic;
    uba16 : in std_logic;
    uba17 : in std_logic;
    ubrd : in std_logic;
    ubwr : in std_logic;
    udi7 : in std_logic;
    \write through enb\ : out std_logic
  );
end entity;
