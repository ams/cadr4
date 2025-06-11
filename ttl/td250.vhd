-- 250ns time delay, 50ns increments

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity td250 is
  port (
    input   : in  std_logic; -- 1
    o_50ns  : out std_logic; -- 12
    o_100ns : out std_logic; -- 4
    o_150ns : out std_logic; -- 10
    o_200ns : out std_logic; -- 6
    o_250ns : out std_logic  -- 8
    );
end;

architecture ttl of td250 is
begin
  td : timedelay
    generic map (single_tap_delay => 50 ns)
    port map (
      input  => input,
      tap1   => o_50ns,
      tap2   => o_100ns,
      tap3   => o_150ns,
      tap4   => o_200ns,
      output => o_250ns
      );
end;
