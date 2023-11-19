library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.unsorted.all;

entity ic_16dummy_tb is
end;

architecture testbench of ic_16dummy_tb is

  signal dummy : std_logic;

begin

  uut : ic_16dummy port map(
    dummy => dummy
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
