-- 25ns Time Delay, 5ns Increments
-- Actual delays: 50ns, 60ns, 70ns, 80ns, 90ns

library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.misc.all;

entity td25 is
  port (
    input  : in  std_logic;
    o_5ns  : out std_logic;
    o_10ns : out std_logic;
    o_15ns : out std_logic;
    o_20ns : out std_logic;
    o_25ns : out std_logic
    );
end;

architecture ttl of td25 is

  signal delayed : std_logic_vector(4 downto 0);

begin

  td : timedelay
    generic map (
      initial   => 50 ns,
      increment => 10 ns,
      taps      => 5
      )
    port map (
      input   => input,
      delayed => delayed
      );

  o_5ns  <= delayed(0);
  o_10ns <= delayed(1);
  o_15ns <= delayed(2);
  o_20ns <= delayed(3);
  o_25ns <= delayed(4);

end;
