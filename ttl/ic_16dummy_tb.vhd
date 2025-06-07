library ieee;
use ieee.std_logic_1164.all;

use work.unsorted.all;

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
    wait for 1 ns;
    
    -- Test static outputs
    assert hi1 = '1' report "hi1 should be '1'";
    assert hi2 = '1' report "hi2 should be '1'";
    assert \-boot1\ = '0' report "-boot1 should be '0'";
    assert \-boot2\ = '0' report "-boot2 should be '0'";
    assert \-power_reset\ = '0' report "-power_reset should be '0'";

    wait;
  end process;

end;
