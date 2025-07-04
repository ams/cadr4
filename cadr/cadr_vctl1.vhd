library ieee;
use ieee.std_logic_1164.all;

entity cadr_vctl1 is
  port (
    \-reset\             : in  std_logic;
    rdcyc                : out std_logic;
    wrcyc                : out std_logic;
    clk2a                : in  std_logic;
    wmap                 : in  std_logic;
    \-wmapd\             : out std_logic;
    wmapd                : out std_logic;
    memprepare           : out std_logic;
    \-memwr\             : in  std_logic;
    \-memprepare\        : in  std_logic;
    \-lvmo22\            : in  std_logic;
    \-pfw\               : out std_logic;
    \-pfr\               : in  std_logic;
    \-vmaok\             : out std_logic;
    \-mfinishd\          : out std_logic;
    memrq                : out std_logic;
    mclk1a               : in  std_logic;
    hi11                 : in  std_logic;
    mbusy                : out std_logic;
    \rd.in.progress\     : out std_logic;
    \set.rd.in.progress\ : out std_logic;
    \-rdfinish\          : out std_logic;
    \-mfinish\           : out std_logic;
    clk2c                : in  std_logic;
    \-memop\             : out std_logic;
    \-memack\            : in  std_logic;
    \-memrd\             : in  std_logic;
    \-ifetch\            : in  std_logic;
    memstart             : out std_logic;
    \-memstart\          : out std_logic;
    \-mbusy.sync\        : out std_logic;
    \mbusy.sync\         : out std_logic;
    hi4                  : in  std_logic;
    destmem              : in  std_logic;
    \-memgrant\          : in  std_logic;
    \use.md\             : in  std_logic;
    \-wait\              : out std_logic;
    needfetch            : in  std_logic;
    lcinc                : in  std_logic;
    \-hang\              : out std_logic;
    \-clk3g\             : in  std_logic
    );
end;
