-- J-K Flip-Flop (with preset and clear)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ff_jkpc is
  port (
    clk      : in  std_logic;
    pre, clr : in  std_logic;
    j, k     : in  std_logic;
    q, q_n   : out std_logic
    );
end;

architecture ttl of ff_jkpc is
begin

end;
