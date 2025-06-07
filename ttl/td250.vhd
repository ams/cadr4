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

  signal delayed : std_logic_vector(4 downto 0);

begin

  td : timedelay
    generic map (
      initial   => 250 ns,
      increment => 50 ns,
      taps      => 5
      )
    port map (
      input   => input,
      delayed => delayed
      );

  o_50ns  <= delayed(0);
  o_100ns <= delayed(1);
  o_150ns <= delayed(2);
  o_200ns <= delayed(3);
  o_250ns <= delayed(4);

end;
