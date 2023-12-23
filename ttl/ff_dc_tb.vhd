library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.misc.all;

entity ff_dc_tb is
end;

architecture testbench of ff_dc_tb is

  signal q_n : std_logic;
  signal q   : std_logic;
  signal d   : std_logic;
  signal clk : std_logic;
  signal clr : std_logic;

begin

  uut : ff_dc port map(
    clk => clk,
    clr => clr,
    d   => d,
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
