-- CADR1_REQU
-- Generated entity from suds architecture

library ieee;
use ieee.std_logic_1164.all;

entity cadr1_requ is
  port (
    \--mapvalid\ : in std_logic;
    \--writeok\ : in std_logic;
    \-rbufwe\ : out std_logic;
    \-ub invalid\ : out std_logic;
    \-ub read xbus\ : in std_logic;
    \-ub to md\ : out std_logic;
    \-ub write xbus\ : in std_logic;
    \-uback\ : inout std_logic;
    \-ubwr\ : in std_logic;
    \-ubxrq\ : inout std_logic;
    \-write through\ : in std_logic;
    \debug ssyn\ : in std_logic;
    \intr ssyn\ : in std_logic;
    \loadmd ack\ : in std_logic;
    \msyn in\ : in std_logic;
    \ssyn out\ : out std_logic;
    \ub reg cyc t250\ : in std_logic;
    \ub xbus t0\ : inout std_logic;
    \ub xbus t100\ : inout std_logic;
    ubma17 : in std_logic;
    ubma18 : in std_logic;
    ubma19 : in std_logic;
    ubma20 : in std_logic;
    ubma21 : in std_logic;
    ubwr : in std_logic;
    \ubx grant a\ : in std_logic;
    ubxrq : inout std_logic;
    xack : in std_logic
  );
end entity;
