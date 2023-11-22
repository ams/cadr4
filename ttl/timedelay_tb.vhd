library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.misc.all;

entity timedelay_tb is
end;

architecture testbench of timedelay_tb is

  signal input   : std_logic;
  signal delayed : std_logic_vector(4 downto 0);

begin

  uut : timedelay port map(
    input   => input,
    delayed => delayed
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
