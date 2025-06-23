library ieee;
use ieee.std_logic_1164.all;

entity ic_16dummy_tb is
end;

architecture testbench of ic_16dummy_tb is

  signal hi1 : std_logic;
  signal hi2 : std_logic;
  signal \-boot1\       : std_logic;
  signal \-boot2\       : std_logic;
  signal \-power reset\ : std_logic;

begin

  uut : entity work.ic_16dummy port map(
    \-boot1\ => \-boot1\,
    \-boot2\ => \-boot2\,
    \-power reset\ => \-power reset\,
    hi1 => hi1,
    hi2 => hi2
    );

  process
  begin
    -- Test static outputs
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
