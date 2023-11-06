library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.misc.all;

entity ff_jk_tb is
end;

architecture testbench of ff_jk_tb is

  signal q_n : std_logic;
  signal q   : std_logic;
  signal k   : std_logic;
  signal j   : std_logic;
  signal clk : std_logic;

begin

  uut : ff_jk port map(
    clk => clk,
    j   => j,
    k   => k,
    q   => q,
    q_n => q_n
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
