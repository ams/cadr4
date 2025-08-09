library ieee;
use ieee.std_logic_1164.all;

entity busint_diag is
  port (
    \-select spy\   : in     std_logic;
    \ub reg write pulse\ : in     std_logic;
    ubrd            : in     std_logic;
    ubwr            : in     std_logic;
    spy0            : inout  std_logic;
    spy1            : inout  std_logic;
    spy10           : inout  std_logic;
    spy11           : inout  std_logic;
    spy12           : inout  std_logic;
    spy13           : inout  std_logic;
    spy14           : inout  std_logic;
    spy15           : inout  std_logic;
    spy2            : inout  std_logic;
    spy3            : inout  std_logic;
    spy4            : inout  std_logic;
    spy5            : inout  std_logic;
    spy6            : inout  std_logic;
    spy7            : inout  std_logic;
    spy8            : inout  std_logic;
    spy9            : inout  std_logic;
    udo0            : inout  std_logic;
    udo1            : inout  std_logic;
    udo10           : inout  std_logic;
    udo11           : inout  std_logic;
    udo12           : inout  std_logic;
    udo13           : inout  std_logic;
    udo14           : inout  std_logic;
    udo15           : inout  std_logic;
    udo2            : inout  std_logic;
    udo3            : inout  std_logic;
    udo4            : inout  std_logic;
    udo5            : inout  std_logic;
    udo6            : inout  std_logic;
    udo7            : inout  std_logic;
    udo8            : inout  std_logic;
    udo9            : inout  std_logic;
    \-spy read\     : out    std_logic;
    \-spy write\    : out    std_logic;
    \select spy\    : out    std_logic
  );
end entity busint_diag;
