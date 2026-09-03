-- DM8838 Quad Unified Bus Transceiver
-- National Semiconductor DM8838
-- doc/ttl/dm8838.pdf
--
-- Each channel has an open-collector bus driver and an inverting receiver.
-- The driver pulls the bus line low when its input is high and the drivers
-- are enabled (NOR of the two disable inputs is high); otherwise it floats.
-- The receiver is always active and inverting: OUT = NOT BUS.

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity dm8838 is
  port (
    in1 : in    std_logic; -- 14
    in2 : in    std_logic; -- 11
    in3 : in    std_logic; -- 2
    in4 : in    std_logic; -- 5
    out1 : out  std_logic; -- 13
    out2 : out  std_logic; -- 10
    out3 : out  std_logic; -- 3
    out4 : out  std_logic; -- 6
    bus1 : inout std_logic; -- 15
    bus2 : inout std_logic; -- 12
    bus3 : inout std_logic; -- 1
    bus4 : inout std_logic; -- 4
    disable_a : in std_logic; -- 9
    disable_b : in std_logic  -- 7
    );
end entity;

architecture behavioral of dm8838 is
  signal in1_i, in2_i, in3_i, in4_i, disable_a_i, disable_b_i : std_logic;
  signal enable : std_logic;
begin

  in1_i <= ttl_input(in1);
  in2_i <= ttl_input(in2);
  in3_i <= ttl_input(in3);
  in4_i <= ttl_input(in4);
  disable_a_i <= ttl_input(disable_a);
  disable_b_i <= ttl_input(disable_b);

  -- Driver enable: NOR of the two disable inputs
  enable <= disable_a_i nor disable_b_i;

  -- Open-collector drivers: pull the bus low when enabled and the input is
  -- high, float otherwise (an external termination pulls the bus high)
  bus1 <= '0' when (enable and in1_i) = '1' else 'Z' when (enable and in1_i) = '0' else 'X';
  bus2 <= '0' when (enable and in2_i) = '1' else 'Z' when (enable and in2_i) = '0' else 'X';
  bus3 <= '0' when (enable and in3_i) = '1' else 'Z' when (enable and in3_i) = '0' else 'X';
  bus4 <= '0' when (enable and in4_i) = '1' else 'Z' when (enable and in4_i) = '0' else 'X';

  -- Inverting receivers, always active. The bus is read through ttl_input so
  -- a released ('Z') or pulled-up ('H') line reads as high.
  out1 <= not ttl_input(bus1);
  out2 <= not ttl_input(bus2);
  out3 <= not ttl_input(bus3);
  out4 <= not ttl_input(bus4);

end architecture;
