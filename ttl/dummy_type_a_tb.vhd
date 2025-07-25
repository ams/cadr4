library ieee;
use ieee.std_logic_1164.all;

use work.other.dummy_type_a;

entity dummy_type_a_tb is
end;

architecture testbench of dummy_type_a_tb is

  signal hi1 : std_logic;
  signal hi2 : std_logic;
  signal \-boot1\       : std_logic;
  signal \-boot2\       : std_logic;
  signal \-power reset\ : std_logic;

begin

  uut : dummy_type_a port map(
    \-boot1\ => \-boot1\,
    \-boot2\ => \-boot2\,
    \-power reset\ => \-power reset\,
    hi1 => hi1,
    hi2 => hi2
    );

  process
  begin
    -- Test static outputs
    wait for 1 ns;
    assert hi1 = 'H' report "hi1 should be 'H'";
    assert hi2 = 'H' report "hi2 should be 'H'";
    assert \-boot1\ = 'H' report "-boot1 should be 'H'";
    assert \-boot2\ = 'H' report "-boot2 should be 'H'";
    assert \-power reset\ = '0' report "-power reset should be '0' initially";
    wait for 20 ns;
    assert \-power reset\ = '1' report "-power reset should be '1' after delay";
    wait;
  end process;

end;
