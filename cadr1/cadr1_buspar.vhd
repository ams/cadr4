library ieee;
use ieee.std_logic_1164.all;

entity cadr1_buspar is
  port (
    bus0            : in     std_logic;
    bus1            : in     std_logic;
    bus10           : in     std_logic;
    bus11           : in     std_logic;
    bus12           : in     std_logic;
    bus13           : in     std_logic;
    bus14           : in     std_logic;
    bus15           : in     std_logic;
    bus16           : in     std_logic;
    bus17           : in     std_logic;
    bus18           : in     std_logic;
    bus19           : in     std_logic;
    bus2            : in     std_logic;
    bus20           : in     std_logic;
    bus21           : in     std_logic;
    bus22           : in     std_logic;
    bus23           : in     std_logic;
    bus24           : in     std_logic;
    bus25           : in     std_logic;
    bus26           : in     std_logic;
    bus27           : in     std_logic;
    bus28           : in     std_logic;
    bus29           : in     std_logic;
    bus3            : in     std_logic;
    bus30           : in     std_logic;
    bus31           : in     std_logic;
    bus4            : in     std_logic;
    bus5            : in     std_logic;
    bus6            : in     std_logic;
    bus7            : in     std_logic;
    bus8            : in     std_logic;
    bus9            : in     std_logic;
    \bus 0-11 par odd\ : inout  std_logic;
    \bus 12-23 par odd\ : inout  std_logic;
    \bus par even\  : out    std_logic;
    \bus par odd\   : out    std_logic
  );
end entity cadr1_buspar;
