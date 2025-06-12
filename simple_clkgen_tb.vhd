-- The MIT CADR

library ieee;
use ieee.std_logic_1164.all;

use std.env.finish;

entity simple_clkgen_tb is
end;

architecture structural of simple_clkgen_tb is

  signal tpdone_n : std_logic := '1';
  signal clock_reset_b_n : std_logic := '1';
  signal tpr40_n : std_logic := '1';

  signal q : std_logic := '0';
  signal q_n : std_logic := '1';

begin

  -- Cross-coupled NAND flip-flop (CYCLECOMPLETED)
  -- This models the flip-flop that gets set and then cleared by TPR40
  q <= not (tpdone_n and clock_reset_b_n and q_n);
  q_n <= not (tpr40_n and q);
  tpr40_n <= transport q_n after 40 ns;
  tpdone_n <= transport q_n after 220 ns;
  
  -- Test process
  process
  begin
    wait for 10 ns;
    clock_reset_b_n <= '0';    
    wait for 10 ns;
    clock_reset_b_n <= '1';    
    wait for 1000 ns;  -- Run longer to see multiple cycles
    finish;
  end process;

end architecture;
