library ieee;
use ieee.std_logic_1164.all;

entity cadr_vctl1 is
  port (
    \-clk3g\        : in     std_logic;
    \-ifetch\       : in     std_logic;
    \-lvmo22\       : in     std_logic;
    \-memack\       : in     std_logic;
    \-memgrant\     : in     std_logic;
    \-memprepare\   : in     std_logic;
    \-memrd\        : in     std_logic;
    \-memwr\        : in     std_logic;
    \-pfr\          : in     std_logic;
    \-reset\        : in     std_logic;
    \use.md\        : in     std_logic;
    clk2a           : in     std_logic;
    clk2c           : in     std_logic;
    destmem         : in     std_logic;
    hi11            : in     std_logic;
    hi4             : in     std_logic;
    lcinc           : in     std_logic;
    mclk1a          : in     std_logic;
    needfetch       : in     std_logic;
    wmap            : in     std_logic;
    \-memop\        : inout  std_logic;
    \-mfinish\      : inout  std_logic;
    \-mfinishd\     : inout  std_logic;
    \-pfw\          : inout  std_logic;
    \-rdfinish\     : inout  std_logic;
    \mbusy.sync\    : inout  std_logic;
    \rd.in.progress\ : inout  std_logic;
    \set.rd.in.progress\ : inout  std_logic;
    mbusy           : inout  std_logic;
    memprepare      : inout  std_logic;
    memrq           : inout  std_logic;
    memstart        : inout  std_logic;
    rdcyc           : inout  std_logic;
    wrcyc           : inout  std_logic;
    \-hang\         : out    std_logic;
    \-mbusy.sync\   : out    std_logic;
    \-memstart\     : out    std_logic;
    \-vmaok\        : out    std_logic;
    \-wait\         : out    std_logic;
    \-wmapd\        : out    std_logic;
    wmapd           : out    std_logic
  );
end entity;
