library ieee;
use ieee.std_logic_1164.all;

entity busint_reqtim is
  port (
    \-debug timeout inh\ : in     std_logic;
    \int busy\      : in     std_logic;
    \select debug\  : in     std_logic;
    \vco cap1\      : inout  std_logic;
    \vco cap2\      : inout  std_logic;
    \-hung timeout\ : out    std_logic;
    \-nxm timeout\  : out    std_logic;
    \hung timeout\  : out    std_logic;
    \nxm timeout\   : out    std_logic;
    \prom hung timeout\ : out    std_logic;
    \prom nxm timeout\ : out    std_logic;
    \prom unused\   : out    std_logic;
    \timeout 0\     : out    std_logic;
    \timeout 1\     : out    std_logic;
    \timeout 2\     : out    std_logic;
    \timeout 3\     : out    std_logic;
    \unused timeout\ : out    std_logic
  );
end entity;
