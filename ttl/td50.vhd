-- 50ns Time Delay, 10ns Increments
-- Actual delays: 250ns, 300ns, 350ns, 400ns, 450ns

library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.misc.all;

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

  o_10ns <= delayed(0);
  o_20ns <= delayed(1);
  o_30ns <= delayed(2);
  o_40ns <= delayed(3);
  o_50ns <= delayed(4);

end;
