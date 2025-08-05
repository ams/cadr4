-- CADR1_DATCTL
-- Generated entity from suds architecture

library ieee;
use ieee.std_logic_1164.all;

entity cadr1_datctl is
  port (
    \--ub reg cyc t150\ : in std_logic;
    \--write through\ : in std_logic;
    \-bus_ub\ : out std_logic;
    \-dbub master\ : in std_logic;
    \-lmadr_ub\ : out std_logic;
    \-lmadr_xbus\ : out std_logic;
    \-lmbus enb\ : out std_logic;
    \-lmrd\ : out std_logic;
    \-lmwr\ : out std_logic;
    \-select debug\ : in std_logic;
    \-select spy\ : in std_logic;
    \-ub write buffer\ : in std_logic;
    \-ub16_bus\ : out std_logic;
    \-ub32_bus\ : out std_logic;
    \-ubaddr_xbus\ : out std_logic;
    \-ubadrive\ : out std_logic;
    \-ubdrive\ : inout std_logic;
    \-ubmap _ udo\ : out std_logic;
    \-ubmapwe\ : out std_logic;
    \-ubrd\ : out std_logic;
    \-ubwr\ : inout std_logic;
    \-ubwr a\ : out std_logic;
    \-udi _ udo\ : out std_logic;
    \-wbufwe\ : out std_logic;
    \-write through\ : in std_logic;
    \-xaddrdrive\ : out std_logic;
    \-xb_bus\ : out std_logic;
    \-xdrive\ : inout std_logic;
    \bus _ lm\ : out std_logic;
    \c1 in\ : in std_logic;
    \dbub master\ : in std_logic;
    \debug in wr\ : in std_logic;
    \int busy\ : in std_logic;
    lmrd : in std_logic;
    \lmub grant\ : in std_logic;
    \lmub master\ : in std_logic;
    lmwr : in std_logic;
    \lmx grant\ : in std_logic;
    \lmx grant a\ : in std_logic;
    \msyn in\ : in std_logic;
    \select debug\ : in std_logic;
    \select page\ : in std_logic;
    \ub reg cyc t0\ : in std_logic;
    \ub reg write pulse\ : in std_logic;
    \ub17-14=map\ : in std_logic;
    ubrd : in std_logic;
    \ubrd a\ : in std_logic;
    ubwr : in std_logic;
    \ubx grant\ : in std_logic;
    \ubx grant a\ : in std_logic;
    wrcyc : in std_logic;
    \write data _ ub\ : inout std_logic;
    \write through\ : inout std_logic;
    xwr : out std_logic
  );
end entity;
