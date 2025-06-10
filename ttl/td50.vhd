-- 50ns Time Delay, 10ns Increments
-- Actual delays: 250ns, 300ns, 350ns, 400ns, 450ns

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity td50 is
  port (
    input  : in  std_logic; -- 1
    o_10ns : out std_logic; -- 12
    o_20ns : out std_logic; -- 4
    o_30ns : out std_logic; -- 10
    o_40ns : out std_logic; -- 6
    o_50ns : out std_logic  -- 8
    );
end;

architecture ttl of td50 is
begin
  td : timedelay
    generic map (single_tap_delay => 10 ns)
    port map (
      input  => input,
      tap1   => o_10ns,
      tap2   => o_20ns,
      tap3   => o_30ns,
      tap4   => o_40ns,
      output => o_50ns
      );
end;