library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity sip330_470_8_tb is
end;

architecture testbench of sip330_470_8_tb is

  signal r7 : std_logic;
  signal r6 : std_logic;
  signal r5 : std_logic;
  signal r4 : std_logic;
  signal r3 : std_logic;
  signal r2 : std_logic;

begin

  uut : sip330_470_8 port map(
    r2 => r2,
    r3 => r3,
    r4 => r4,
    r5 => r5,
    r6 => r6,
    r7 => r7
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
