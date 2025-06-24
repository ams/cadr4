-- 25ns Time Delay, 5ns Increments

library ieee;
use ieee.std_logic_1164.all;

entity ttldm_25 is
  port (
    input  : in  std_logic; -- 1
    o_5ns  : out std_logic; -- 12
    o_10ns : out std_logic; -- 4
    o_15ns : out std_logic; -- 10
    o_20ns : out std_logic; -- 6
    o_25ns : out std_logic  -- 8
    );
end entity;

architecture ttl of ttldm_25 is
begin
  td : entity work.timedelay
    generic map (single_tap_delay => 5 ns)
    port map (
      input  => input,
      tap1   => o_5ns,
      tap2   => o_10ns,
      tap3   => o_15ns,
      tap4   => o_20ns,
      output => o_25ns
      );
end architecture;