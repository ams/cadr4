-- CADR1_REQTIM
-- Generated entity from suds architecture

library ieee;
use ieee.std_logic_1164.all;

entity cadr1_reqtim is
  port (
    \--int busy\ : in std_logic;
    \-debug timeout inh\ : in std_logic;
    \-hung timeout\ : out std_logic;
    \-nxm timeout\ : out std_logic;
    \hung timeout\ : inout std_logic;
    \int busy\ : in std_logic;
    \nxm timeout\ : inout std_logic;
    \prom hung timeout\ : inout std_logic;
    \prom nxm timeout\ : inout std_logic;
    \prom unused\ : inout std_logic;
    \select debug\ : inout std_logic;
    \timeout 0\ : inout std_logic;
    \timeout 1\ : inout std_logic;
    \timeout 2\ : inout std_logic;
    \timeout 3\ : inout std_logic;
    \unused timeout\ : inout std_logic;
    \vco cap1\ : inout std_logic;
    \vco cap2\ : inout std_logic
  );
end entity;
