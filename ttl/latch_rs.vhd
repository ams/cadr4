-- SR latch

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity latch_rs is
  port(
    s, r   : in     std_logic;
    q, q_n : buffer std_logic
    );
end;

architecture behavioral of latch_rs is
begin

  q   <= r nand q_n;
  q_n <= s nand q;

end;
