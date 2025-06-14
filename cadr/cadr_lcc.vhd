library ieee;
use ieee.std_logic_1164.all;

entity cadr_lcc is
  port (
    \lc byte mode\               : in  std_logic;
    \-lcinc\                     : out std_logic;
    lca1                         : out std_logic;
    lc1                          : out std_logic;
    lca0                         : out std_logic;
    lc0                          : out std_logic;
    lcinc                        : out std_logic;
    lcry3                        : out std_logic;
    lca3                         : out std_logic;
    lc3                          : out std_logic;
    lca2                         : out std_logic;
    lc2                          : out std_logic;
    \-destlc\                    : in  std_logic;
    ob3                          : in  std_logic;
    ob2                          : in  std_logic;
    clk2a                        : in  std_logic;
    ob1                          : in  std_logic;
    ob0                          : in  std_logic;
    lc0b                         : out std_logic;
    \inst in left half\          : out std_logic;
    \-ir4\                       : in  std_logic;
    \-sh4\                       : out std_logic;
    \-sh3\                       : out std_logic;
    \-ir3\                       : in  std_logic;
    \inst in 2nd or 4th quarter\ : out std_logic;
    \-lc modifies mrot\          : out std_logic;
    spc14                        : in  std_logic;
    \-srcspcpopreal\             : in  std_logic;
    \-ifetch\                    : out std_logic;
    needfetch                    : out std_logic;
    \have wrong word\            : out std_logic;
    \last byte in word\          : out std_logic;
    ir10                         : in  std_logic;
    ir11                         : in  std_logic;
    \-newlc\                     : out std_logic;
    \-newlc.in\                  : out std_logic;
    \-reset\                     : in  std_logic;
    newlc                        : out std_logic;
    int                          : in  std_logic;
    sintr                        : out std_logic;
    clk3c                        : in  std_logic;
    \next.instrd\                : out std_logic;
    \next.instr\                 : out std_logic;
    \-spop\                      : in  std_logic;
    \-needfetch\                 : out std_logic;
    spcmung                      : out std_logic;
    ir24                         : in  std_logic;
    irdisp                       : in  std_logic;
    spc1                         : in  std_logic;
    spc1a                        : out std_logic
    );
end;
