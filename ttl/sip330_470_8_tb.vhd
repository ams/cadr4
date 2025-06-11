library ieee;
use ieee.std_logic_1164.all;

use work.other.all;

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
    r2 => '0',
    r3 => '0',
    r4 => '0',
    r5 => '0',
    r6 => '0',
    r7 => '0'
    );

  process
  begin
    wait;
  end process;

end;
