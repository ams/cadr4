-- 100ns time delay, 20ns increments

library ieee;
use ieee.std_logic_1164.all;

entity td100 is
  port (
    input   : in  std_logic; -- 1
    o_20ns  : out std_logic; -- 12
    o_40ns  : out std_logic; -- 4
    o_60ns  : out std_logic; -- 10
    o_80ns  : out std_logic; -- 6
    o_100ns : out std_logic  -- 8
    );
end;

architecture ttl of td100 is
begin
  td : entity work.timedelay
    generic map (single_tap_delay => 20 ns)
    port map (
      input  => input,
      tap1   => o_20ns,
      tap2   => o_40ns,
      tap3   => o_60ns,
      tap4   => o_80ns,
      output => o_100ns
      );
end;
