-- SR latch

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity latch_sr is
  port(
    s_n, r_n : in     std_logic;
    q, q_n   : buffer std_logic
    );
end;

architecture behavioral of latch_sr is
begin

  q   <= s_n nand q_n;
  q_n <= r_n nand q;

end;
