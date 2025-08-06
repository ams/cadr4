-- CADR1_RQSYNC
-- Generated entity from suds architecture

library ieee;
use ieee.std_logic_1164.all;

entity cadr1_rqsync is
  port (
    \--int busy\ : in std_logic;
    \--int busy t40\ : in std_logic;
    \--lmubrqs\ : in std_logic;
    \--ubxrqs\ : in std_logic;
    \--xbus busy in\ : in std_logic;
    \--xrqs\ : in std_logic;
    \-clk\ : in std_logic;
    \-free\ : inout std_logic;
    \-grant reset\ : inout std_logic;
    \-hung timeout\ : in std_logic;
    \-int busy t80\ : out std_logic;
    \-lmub grant\ : inout std_logic;
    \-lmubrqs\ : inout std_logic;
    \-lmx grant\ : inout std_logic;
    \-lmxrq\ : in std_logic;
    \-loadmd ack\ : in std_logic;
    \-ubx grant\ : inout std_logic;
    \-ubxrqs\ : inout std_logic;
    \-xbus request\ : in std_logic;
    \-xrqs\ : inout std_logic;
    clk0 : in std_logic;
    free : inout std_logic;
    \grant reset\ : out std_logic;
    \int busy\ : inout std_logic;
    \int busy t100\ : out std_logic;
    \int busy t20\ : out std_logic;
    \int busy t40\ : out std_logic;
    \int busy t60\ : out std_logic;
    \int busy t80\ : inout std_logic;
    \lmub grant\ : inout std_logic;
    \lmub grant set\ : inout std_logic;
    lmubrq : in std_logic;
    lmubrqs : out std_logic;
    \lmx grant\ : out std_logic;
    \lmx grant a\ : out std_logic;
    \lmx grant set\ : inout std_logic;
    \ubx grant\ : out std_logic;
    \ubx grant a\ : out std_logic;
    \ubx grant set\ : inout std_logic;
    ubxrq : in std_logic;
    ubxrqs : out std_logic;
    \xbus extgrant out\ : out std_logic;
    \xbus extrq in\ : in std_logic;
    xrqs : out std_logic;
    \hi 1-14\ : in std_logic;
    \hi 15-30\ : in std_logic
  );
end entity;
