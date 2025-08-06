library ieee;
use ieee.std_logic_1164.all;

entity cadr1_diag is
  port (
    \-select spy\   : in     std_logic;
    \ub reg write pulse\ : in     std_logic;
    spy0            : in     std_logic;
    spy1            : in     std_logic;
    spy10           : in     std_logic;
    spy11           : in     std_logic;
    spy12           : in     std_logic;
    spy13           : in     std_logic;
    spy14           : in     std_logic;
    spy15           : in     std_logic;
    spy2            : in     std_logic;
    spy3            : in     std_logic;
    spy4            : in     std_logic;
    spy5            : in     std_logic;
    spy6            : in     std_logic;
    spy7            : in     std_logic;
    spy8            : in     std_logic;
    spy9            : in     std_logic;
    ubrd            : in     std_logic;
    ubwr            : in     std_logic;
    udo0            : in     std_logic;
    udo1            : in     std_logic;
    udo10           : in     std_logic;
    udo11           : in     std_logic;
    udo12           : in     std_logic;
    udo13           : in     std_logic;
    udo14           : in     std_logic;
    udo15           : in     std_logic;
    udo2            : in     std_logic;
    udo3            : in     std_logic;
    udo4            : in     std_logic;
    udo5            : in     std_logic;
    udo6            : in     std_logic;
    udo7            : in     std_logic;
    udo8            : in     std_logic;
    udo9            : in     std_logic;
    \select spy\    : inout  std_logic;
    \-spy read\     : out    std_logic;
    \-spy write\    : out    std_logic
  );
end entity cadr1_diag;
