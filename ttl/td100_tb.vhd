library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity td100_tb is
end;

architecture testbench of td100_tb is

  signal o_100ns : std_logic;
  signal o_80ns  : std_logic;
  signal o_60ns  : std_logic;
  signal o_40ns  : std_logic;
  signal o_20ns  : std_logic;
  signal input   : std_logic;

begin

  uut : td100 port map(
    input   => input,
    o_20ns  => o_20ns,
    o_40ns  => o_40ns,
    o_60ns  => o_60ns,
    o_80ns  => o_80ns,
    o_100ns => o_100ns
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
