-- CADR1_UPRIOR
-- Generated entity from suds architecture

library ieee;
use ieee.std_logic_1164.all;

entity cadr1_uprior is
  port (
    \--any grant\ : inout std_logic;
    \--any grant dlyd\ : in std_logic;
    \--local enable\ : inout std_logic;
    \-any grant dlyd\ : out std_logic;
    \-bg4o\ : inout std_logic;
    \-bg5o\ : inout std_logic;
    \-bg6o\ : inout std_logic;
    \-bg7o\ : inout std_logic;
    \-clear grant\ : inout std_logic;
    \-clk\ : inout std_logic;
    \-local enable\ : inout std_logic;
    \-npg in\ : inout std_logic;
    \-npg out\ : inout std_logic;
    \-npgo\ : inout std_logic;
    \-ub br4\ : inout std_logic;
    \-ub br5\ : inout std_logic;
    \-ub br6\ : inout std_logic;
    \-ub br7\ : inout std_logic;
    \-ub init\ : inout std_logic;
    \-ub intr\ : inout std_logic;
    \-ub npr\ : inout std_logic;
    \any grant\ : in std_logic;
    \any grant dlyd\ : out std_logic;
    \any int grant\ : inout std_logic;
    bg4o : out std_logic;
    bg4p : in std_logic;
    bg5o : out std_logic;
    bg5p : in std_logic;
    bg6o : out std_logic;
    bg6p : in std_logic;
    bg7o : out std_logic;
    bg7p : in std_logic;
    br4 : inout std_logic;
    br4d : out std_logic;
    br5 : inout std_logic;
    br5d : out std_logic;
    br6 : inout std_logic;
    br6d : out std_logic;
    br7 : inout std_logic;
    br7d : out std_logic;
    \bus req\ : inout std_logic;
    \grant timeout\ : inout std_logic;
    npgo : out std_logic;
    npgp : in std_logic;
    npr : inout std_logic;
    nprd : out std_logic;
    reset : inout std_logic;
    \sack in\ : in std_logic;
    sackd : inout std_logic;
    \ub bg4 in\ : inout std_logic;
    \ub bg5 in\ : inout std_logic;
    \ub bg6 in\ : inout std_logic;
    \ub bg7 in\ : inout std_logic;
    \ub npg in\ : inout std_logic;
    \ub npg out\ : inout std_logic;
    \unibus init in\ : inout std_logic;
    \unibus intr in\ : inout std_logic;
    \hi 1-14\ : in std_logic
  );
end entity;
