library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn7464_tb is
end;

architecture testbench of sn7464_tb is

  signal a4    : std_logic;
  signal b4    : std_logic;
  signal c4    : std_logic;
  signal b1    : std_logic;
  signal a1    : std_logic;
  signal \out\ : std_logic;
  signal a3    : std_logic;
  signal b3    : std_logic;
  signal c3    : std_logic;
  signal a2    : std_logic;
  signal b2    : std_logic;
  signal d4    : std_logic;

begin

  uut : sn7464 port map(
    d4 => d4,
    b2 => b2,
    a2 => a2,
    c3 => c3,
    b3 => b3,
    a3 => a3,
    \out\ => \out\,
    a1 => a1,
    b1 => b1,
    c4 => c4,
    b4 => b4,
    a4 => a4
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
