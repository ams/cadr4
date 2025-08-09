library ieee;
use ieee.std_logic_1164.all;

entity busint_wbuf is
  port (
    \-ubpn0a\       : in     std_logic;
    \-ubpn0b\       : in     std_logic;
    \-ubpn1a\       : in     std_logic;
    \-ubpn1b\       : in     std_logic;
    \-ubpn2a\       : in     std_logic;
    \-ubpn2b\       : in     std_logic;
    \-ubpn3a\       : in     std_logic;
    \-ubpn3b\       : in     std_logic;
    \-wbufwe\       : in     std_logic;
    udi0            : in     std_logic;
    udi1            : in     std_logic;
    udi10           : in     std_logic;
    udi11           : in     std_logic;
    udi12           : in     std_logic;
    udi13           : in     std_logic;
    udi14           : in     std_logic;
    udi15           : in     std_logic;
    udi2            : in     std_logic;
    udi3            : in     std_logic;
    udi4            : in     std_logic;
    udi5            : in     std_logic;
    udi6            : in     std_logic;
    udi7            : in     std_logic;
    udi8            : in     std_logic;
    udi9            : in     std_logic;
    wbuf0           : out    std_logic;
    wbuf1           : out    std_logic;
    wbuf10          : out    std_logic;
    wbuf11          : out    std_logic;
    wbuf12          : out    std_logic;
    wbuf13          : out    std_logic;
    wbuf14          : out    std_logic;
    wbuf15          : out    std_logic;
    wbuf2           : out    std_logic;
    wbuf3           : out    std_logic;
    wbuf4           : out    std_logic;
    wbuf5           : out    std_logic;
    wbuf6           : out    std_logic;
    wbuf7           : out    std_logic;
    wbuf8           : out    std_logic;
    wbuf9           : out    std_logic
  );
end entity busint_wbuf;
