library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity td50_tb is
end;

architecture testbench of td50_tb is

  signal o_50ns : std_logic;
  signal o_40ns : std_logic;
  signal o_30ns : std_logic;
  signal o_20ns : std_logic;
  signal o_10ns : std_logic;
  signal input  : std_logic;

begin

  uut : td50 port map(
    input  => input,
    o_10ns => o_10ns,
    o_20ns => o_20ns,
    o_30ns => o_30ns,
    o_40ns => o_40ns,
    o_50ns => o_50ns
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
