library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity dm8221_tb is
end;

architecture testbench of dm8221_tb is

  signal d1     : std_logic;
  signal i1     : std_logic;
  signal we1_n  : std_logic;
  signal i0     : std_logic;
  signal d0     : std_logic;
  signal we0_n  : std_logic;
  signal a0     : std_logic;
  signal a1     : std_logic;
  signal a2     : std_logic;
  signal a3     : std_logic;
  signal a4     : std_logic;
  signal strobe : std_logic;
  signal wclk_n : std_logic;
  signal ce     : std_logic;

begin

  uut : dm8221 port map(
    d1     => d1,
    i1     => i1,
    we1_n  => we1_n,
    i0     => i0,
    d0     => d0,
    we0_n  => we0_n,
    a0     => a0,
    a1     => a1,
    a2     => a2,
    a3     => a3,
    a4     => a4,
    strobe => strobe,
    wclk_n => wclk_n,
    ce     => ce
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
