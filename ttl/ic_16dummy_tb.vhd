library ieee;
use ieee.std_logic_1164.all;

entity ic_16dummy_tb is
end;

architecture testbench of ic_16dummy_tb is

  signal vcc            : std_logic;
  signal hi1            : std_logic;
  signal hi2            : std_logic;
  signal \-boot1\       : std_logic;
  signal \-boot2\       : std_logic;
  signal p12            : std_logic;

begin

  uut : entity work.ic_16dummy port map(
    vcc => vcc,
    hi1 => hi1,
    hi2 => hi2,
    \-boot1\ => \-boot1\,
    \-boot2\ => \-boot2\,
    p12 => p12
    );

  process
  begin
    vcc <= '1';
    wait for 1 ns;
    
    -- Test static outputs
    assert hi1 = '1' report "hi1 should be '1'";
    assert hi2 = '1' report "hi2 should be '1'";
    assert \-boot1\ = '1' report "-boot1 should be '0'";
    assert \-boot2\ = '1' report "-boot2 should be '0'";
    assert p12 = '1' report "-power_reset should be '0'";

    wait;
  end process;

end;
