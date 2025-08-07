-- DM8838 Quad Unified Bus Transceiver
-- National Semiconductor DM8838
-- doc/ttl/dm8838.pdf

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

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
end dm8838;

architecture behavioral of dm8838 is
  signal disable_a_i, disable_b_i : std_logic;
  signal in1_i, in2_i, in3_i, in4_i : std_logic;
  signal disable_nor : std_logic;
begin
  
  -- TTL input handling
  disable_a_i <= ttl_input(disable_a);
  disable_b_i <= ttl_input(disable_b);
  in1_i <= ttl_input(in1);
  in2_i <= ttl_input(in2);
  in3_i <= ttl_input(in3);
  in4_i <= ttl_input(in4);
  
  -- NOR of disable signals - disable_a and disable_b are NORed to control direction
  -- When both disable_a and disable_b are low, the device is enabled
  disable_nor <= disable_a_i nor disable_b_i;

  process (all)
  begin
    if disable_nor = '1' then
      -- Enabled: drive from inputs to bus and outputs
      -- Open collector drivers on bus (pull low when input high, Z when input low)
      bus1 <= '0' when in1_i = '1' else 'Z';
      bus2 <= '0' when in2_i = '1' else 'Z';
      bus3 <= '0' when in3_i = '1' else 'Z';
      bus4 <= '0' when in4_i = '1' else 'Z';
      
      -- Drive outputs from inputs
      out1 <= in1_i;
      out2 <= in2_i;
      out3 <= in3_i;
      out4 <= in4_i;
    else
      -- Disabled: high impedance on bus, drive outputs from bus
      bus1 <= 'Z';
      bus2 <= 'Z';
      bus3 <= 'Z';
      bus4 <= 'Z';
      
      -- Drive outputs from bus (with proper TTL levels)
      out1 <= ttl_input(bus1);
      out2 <= ttl_input(bus2);
      out3 <= ttl_input(bus3);
      out4 <= ttl_input(bus4);
    end if;
  end process;

end behavioral;
