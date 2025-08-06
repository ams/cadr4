library ieee;
use ieee.std_logic_1164.all;

entity cadr1_wbuf is
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
    wbuf0           : in     std_logic;
    wbuf1           : in     std_logic;
    wbuf10          : in     std_logic;
    wbuf11          : in     std_logic;
    wbuf12          : in     std_logic;
    wbuf13          : in     std_logic;
    wbuf14          : in     std_logic;
    wbuf15          : in     std_logic;
    wbuf2           : in     std_logic;
    wbuf3           : in     std_logic;
    wbuf4           : in     std_logic;
    wbuf5           : in     std_logic;
    wbuf6           : in     std_logic;
    wbuf7           : in     std_logic;
    wbuf8           : in     std_logic;
    wbuf9           : in     std_logic
  );
end entity cadr1_wbuf;
