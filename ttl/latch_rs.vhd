-- SR latch

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity latch_rs is
  port(
    s_n, r_n : in     std_logic;
    q, q_n   : buffer std_logic
    );
end;

architecture behavioral of latch_rs is
begin

  q   <= r_n nand q_n;
  q_n <= s_n nand q;

end;
