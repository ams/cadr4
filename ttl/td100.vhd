-- 100ns time delay, 20ns increments

library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.misc.all;

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

  signal delayed : std_logic_vector(4 downto 0);

begin

  td : timedelay
    generic map (
      initial   => 100 ns,
      increment => 20 ns,
      taps      => 5
      )
    port map (
      input   => input,
      delayed => delayed
      );

  o_20ns  <= delayed(0);
  o_40ns  <= delayed(1);
  o_60ns  <= delayed(2);
  o_80ns  <= delayed(3);
  o_100ns <= delayed(4);

end;
