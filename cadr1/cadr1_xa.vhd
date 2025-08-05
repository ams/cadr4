-- CADR1_XA
-- Generated entity from suds architecture

library ieee;
use ieee.std_logic_1164.all;

entity cadr1_xa is
  port (
    \-lm power reset\ : in std_logic;
    \-xaddr par\ : inout std_logic;
    \-xaddr0\ : inout std_logic;
    \-xaddr1\ : inout std_logic;
    \-xaddr10\ : inout std_logic;
    \-xaddr11\ : inout std_logic;
    \-xaddr12\ : inout std_logic;
    \-xaddr13\ : inout std_logic;
    \-xaddr14\ : inout std_logic;
    \-xaddr15\ : inout std_logic;
    \-xaddr16\ : inout std_logic;
    \-xaddr17\ : inout std_logic;
    \-xaddr18\ : inout std_logic;
    \-xaddr19\ : inout std_logic;
    \-xaddr2\ : inout std_logic;
    \-xaddr20\ : inout std_logic;
    \-xaddr21\ : inout std_logic;
    \-xaddr3\ : inout std_logic;
    \-xaddr4\ : inout std_logic;
    \-xaddr5\ : inout std_logic;
    \-xaddr6\ : inout std_logic;
    \-xaddr7\ : inout std_logic;
    \-xaddr8\ : inout std_logic;
    \-xaddr9\ : inout std_logic;
    \-xaddrdrive\ : inout std_logic;
    \-xbus ack\ : inout std_logic;
    \-xbus busy\ : inout std_logic;
    \-xbus extgrant out\ : inout std_logic;
    \-xbus extrq\ : inout std_logic;
    \-xbus init\ : inout std_logic;
    \-xbus intr\ : inout std_logic;
    \-xbus power reset\ : inout std_logic;
    \-xbus rq\ : inout std_logic;
    \-xbus sync\ : inout std_logic;
    clk0 : inout std_logic;
    \lm power reset\ : inout std_logic;
    reset : inout std_logic;
    \xaddr par out\ : inout std_logic;
    xao0 : inout std_logic;
    xao1 : inout std_logic;
    xao10 : inout std_logic;
    xao11 : inout std_logic;
    xao12 : inout std_logic;
    xao13 : inout std_logic;
    xao14 : inout std_logic;
    xao15 : inout std_logic;
    xao16 : inout std_logic;
    xao17 : inout std_logic;
    xao18 : inout std_logic;
    xao19 : inout std_logic;
    xao2 : inout std_logic;
    xao20 : inout std_logic;
    xao21 : inout std_logic;
    xao3 : inout std_logic;
    xao4 : inout std_logic;
    xao5 : inout std_logic;
    xao6 : inout std_logic;
    xao7 : inout std_logic;
    xao8 : inout std_logic;
    xao9 : inout std_logic;
    \xbus ack in\ : inout std_logic;
    \xbus busy in\ : inout std_logic;
    \xbus extgrant out\ : inout std_logic;
    \xbus extrq in\ : inout std_logic;
    \xbus intr in\ : inout std_logic;
    \xbus request\ : inout std_logic
  );
end entity;
