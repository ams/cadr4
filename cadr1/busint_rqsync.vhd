library ieee;
use ieee.std_logic_1164.all;

entity busint_rqsync is
  port (
    \-clk\          : in     std_logic;
    \-hung timeout\ : in     std_logic;
    \-lmxrq\        : in     std_logic;
    \-loadmd ack\   : in     std_logic;
    \-xbus request\ : in     std_logic;
    \hi 1-14\       : in     std_logic;
    \hi 15-30\      : in     std_logic;
    \xbus busy in\  : in     std_logic;
    \xbus extrq in\ : in     std_logic;
    clk0            : in     std_logic;
    lmubrq          : in     std_logic;
    ubxrq           : in     std_logic;
    \-free\         : out    std_logic;
    \-grant reset\  : out    std_logic;
    \-int busy t80\ : out    std_logic;
    \-lmub grant\   : out    std_logic;
    \-lmubrqs\      : out    std_logic;
    \-lmx grant\    : out    std_logic;
    \-ubx grant\    : out    std_logic;
    \-ubxrqs\       : out    std_logic;
    \-xrqs\         : out    std_logic;
    \grant reset\   : out    std_logic;
    \int busy t100\ : out    std_logic;
    \int busy t20\  : out    std_logic;
    \int busy t40\  : out    std_logic;
    \int busy t60\  : out    std_logic;
    \int busy t80\  : out    std_logic;
    \int busy\      : out    std_logic;
    \lmub grant set\ : out    std_logic;
    \lmub grant\    : out    std_logic;
    \lmx grant a\   : out    std_logic;
    \lmx grant set\ : out    std_logic;
    \lmx grant\     : out    std_logic;
    \ubx grant a\   : out    std_logic;
    \ubx grant set\ : out    std_logic;
    \ubx grant\     : out    std_logic;
    \xbus extgrant out\ : out    std_logic;
    free            : out    std_logic;
    lmubrqs         : out    std_logic;
    ubxrqs          : out    std_logic;
    xrqs            : out    std_logic
  );
end entity;
