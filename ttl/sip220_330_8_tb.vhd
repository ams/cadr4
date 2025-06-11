library ieee;
use ieee.std_logic_1164.all;

entity sip220_330_8_tb is
end;

architecture testbench of sip220_330_8_tb is

begin

  uut : entity work.sip220_330_8 port map(
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
