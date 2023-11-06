library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity td25_tb is
end;

architecture testbench of td25_tb is

  signal o_25ns : std_logic;
  signal o_20ns : std_logic;
  signal o_10ns : std_logic;
  signal o_15ns : std_logic;
  signal o_5ns  : std_logic;
  signal input  : std_logic;

begin

  uut : td25 port map(
    input  => input,
    o_5ns  => o_5ns,
    o_15ns => o_15ns,
    o_10ns => o_10ns,
    o_20ns => o_20ns,
    o_25ns => o_25ns
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
