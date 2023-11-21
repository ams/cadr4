library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.unsorted.all;

entity ic_16dummy_tb is
end;

architecture testbench of ic_16dummy_tb is

  signal hi1            : std_logic;
  signal hi2            : std_logic;
  signal \-boot1\       : std_logic;
  signal \-boot2\       : std_logic;
  signal \-power_reset\ : std_logic;

begin

  uut : ic_16dummy port map(
    hi1 => hi1,
    hi2 => hi2,
    \-boot1\ => \-boot1\,
    \-boot2\ => \-boot2\,
    \-power_reset\ => \-power_reset\
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
