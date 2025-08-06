library ieee;
use ieee.std_logic_1164.all;

entity cadr1_reqtim is
  port (
    \-debug timeout inh\ : in     std_logic;
    \int busy\      : in     std_logic;
    \select debug\  : in     std_logic;
    \timeout 0\     : in     std_logic;
    \timeout 1\     : in     std_logic;
    \timeout 2\     : in     std_logic;
    \timeout 3\     : in     std_logic;
    \vco cap2\      : in     std_logic;
    \hung timeout\  : inout  std_logic;
    \nxm timeout\   : inout  std_logic;
    \prom hung timeout\ : inout  std_logic;
    \prom nxm timeout\ : inout  std_logic;
    \prom unused\   : inout  std_logic;
    \vco cap1\      : inout  std_logic;
    \-hung timeout\ : out    std_logic;
    \-nxm timeout\  : out    std_logic;
    \unused timeout\ : out    std_logic
  );
end entity cadr1_reqtim;
