library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity im5600_tb is
end;

architecture testbench of im5600_tb is

  signal o7   : std_logic;
  signal o6   : std_logic;
  signal o5   : std_logic;
  signal o4   : std_logic;
  signal o3   : std_logic;
  signal o2   : std_logic;
  signal o1   : std_logic;
  signal o0   : std_logic;
  signal a4   : std_logic;
  signal a3   : std_logic;
  signal a2   : std_logic;
  signal a1   : std_logic;
  signal a0   : std_logic;
  signal ce_n : std_logic;

begin

  uut : im5600 port map(
    o7   => o7,
    o6   => o6,
    o5   => o5,
    o4   => o4,
    o3   => o3,
    o2   => o2,
    o1   => o1,
    o0   => o0,
    a4   => a4,
    a3   => a3,
    a2   => a2,
    a1   => a1,
    a0   => a0,
    ce_n => ce_n
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
