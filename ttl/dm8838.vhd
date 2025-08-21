-- DM8838 Quad Unified Bus Transceiver
-- National Semiconductor DM8838

library ieee;
use ieee.std_logic_1164.all;

entity dm8838 is
  port (
    in1 : in    std_logic; -- Input 1
    in2 : in    std_logic; -- Input 2  
    in3 : in    std_logic; -- Input 3
    in4 : in    std_logic; -- Input 4
    out1 : out  std_logic; -- Output 1
    out2 : out  std_logic; -- Output 2
    out3 : out  std_logic; -- Output 3
    out4 : out  std_logic; -- Output 4
    bus1 : inout std_logic; -- Bidirectional bus 1
    bus2 : inout std_logic; -- Bidirectional bus 2
    bus3 : inout std_logic; -- Bidirectional bus 3
    bus4 : inout std_logic; -- Bidirectional bus 4
    disable_a : in std_logic; -- Disable A (active high)
    disable_b : in std_logic  -- Disable B (active high)
    );
end entity;

architecture behavioral of dm8838 is
  signal enabled : std_logic;
begin

  enabled <= '1' when disable_a = '0' and disable_b = '0' else '0';

  -- Bus drivers (inverting, open-collector)
  bus1 <= '0' when enabled = '1' and in1 = '1' else 'Z';
  bus2 <= '0' when enabled = '1' and in2 = '1' else 'Z';
  bus3 <= '0' when enabled = '1' and in3 = '1' else 'Z';
  bus4 <= '0' when enabled = '1' and in4 = '1' else 'Z';

  -- Output logic
  -- When enabled, outputs follow inputs.
  -- When disabled, outputs are driven by the bus.
  out1 <= in1 when enabled = '1' else
          '1' when bus1 = 'Z' or bus1 = 'H' else
          bus1;
  out2 <= in2 when enabled = '1' else
          '1' when bus2 = 'Z' or bus2 = 'H' else
          bus2;
  out3 <= in3 when enabled = '1' else
          '1' when bus3 = 'Z' or bus3 = 'H' else
          bus3;
  out4 <= in4 when enabled = '1' else
          '1' when bus4 = 'Z' or bus4 = 'H' else
          bus4;

end architecture;
