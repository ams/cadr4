-- CADR1_REQLM
-- Generated entity from suds architecture

library ieee;
use ieee.std_logic_1164.all;

entity cadr1_reqlm is
  port (
    \--ubx grant\ : in std_logic;
    \-adr17\ : in std_logic;
    \-adr18\ : in std_logic;
    \-adr19\ : in std_logic;
    \-adr20\ : in std_logic;
    \-adr21\ : in std_logic;
    \-lm grant\ : out std_logic;
    \-lm ignpar\ : out std_logic;
    \-lm ub master\ : in std_logic;
    \-lmack\ : out std_logic;
    \-lmub grant\ : in std_logic;
    \-lmxrq\ : inout std_logic;
    \-loadmd\ : out std_logic;
    \-loadmd ack\ : inout std_logic;
    \-memrq\ : in std_logic;
    \-ub to md\ : in std_logic;
    \-xack\ : inout std_logic;
    \-xbus request\ : out std_logic;
    \adr=unibus\ : inout std_logic;
    \int busy t100\ : in std_logic;
    \int busy t80\ : in std_logic;
    \lm memdrive enb\ : out std_logic;
    \lmneedub (early\ : out std_logic;
    lmrd : in std_logic;
    \lmub grant\ : in std_logic;
    \lmx grant\ : in std_logic;
    \lmx grant a\ : in std_logic;
    lmxrq : inout std_logic;
    \loadmd ack\ : out std_logic;
    \msyn in\ : in std_logic;
    \nxm timeout\ : in std_logic;
    \ssyn t150\ : in std_logic;
    \ub md load\ : in std_logic;
    ubxrq : in std_logic;
    \unibus request\ : in std_logic;
    xack : inout std_logic;
    \xbus ack in\ : in std_logic;
    \xbus ignpar in\ : in std_logic;
    \xbus request\ : inout std_logic;
    xrd : in std_logic;
    xwr : in std_logic;
    \hi 1-14\ : in std_logic
  );
end entity;
