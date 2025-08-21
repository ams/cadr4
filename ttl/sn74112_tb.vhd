library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn74112_tb is
end entity;

architecture testbench of sn74112_tb is

  signal q2_n   : std_logic;
  signal q2     : std_logic;
  signal pre2_n : std_logic;
  signal clk2   : std_logic;
  signal k2     : std_logic;
  signal j2     : std_logic;
  signal clr2_n : std_logic;
  signal q1_n   : std_logic;
  signal q1     : std_logic;
  signal pre1_n : std_logic;
  signal clk1   : std_logic;
  signal k1     : std_logic;
  signal j1     : std_logic;
  signal clr1_n : std_logic;

begin

  uut : sn74112 port map(
    clr1_n => clr1_n,
    j1     => j1,
    k1     => k1,
    clk1   => clk1,
    pre1_n => pre1_n,
    q1     => q1,
    q1_n   => q1_n,

    clr2_n => clr2_n,
    j2     => j2,
    k2     => k2,
    clk2   => clk2,
    pre2_n => pre2_n,
    q2     => q2,
    q2_n   => q2_n
    );

  process
  begin
    -- initialize all signals
    pre1_n <= '1'; clr1_n <= '1'; j1 <= '0'; k1 <= '0'; clk1 <= '1';
    pre2_n <= '1'; clr2_n <= '1'; j2 <= '0'; k2 <= '0'; clk2 <= '1';
    wait for 1 ns;

    -- asynchronous clear then preset on flip-flop 1
    pre1_n <= '1'; clr1_n <= '0';
    wait for 1 ns;
    assert q1 = '0' and q1_n = '1';

    clr1_n <= '1'; pre1_n <= '0';
    wait for 1 ns;
    assert q1 = '1' and q1_n = '0';

    -- synchronous operations on flip-flop 1 (negative edge triggered)
    pre1_n <= '1'; clr1_n <= '1';
    j1 <= '1'; k1 <= '0';
    clk1 <= '1'; clk1 <= '0'; wait for 1 ns; clk1 <= '1';
    assert q1 = '1' and q1_n = '0';

    k1 <= '1';
    wait for 1 ns;
    clk1 <= '0'; wait for 1 ns; clk1 <= '1';
    wait for 1 ns;
    assert q1 = '0' and q1_n = '1';

    j1 <= '0'; k1 <= '0';
    clk1 <= '0'; wait for 1 ns; clk1 <= '1';
    wait for 1 ns;
    assert q1 = '0' and q1_n = '1';

    -- asynchronous preset and clear on flip-flop 2
    clr2_n <= '1'; pre2_n <= '0';
    wait for 1 ns;
    assert q2 = '1' and q2_n = '0';

    pre2_n <= '1'; clr2_n <= '0';
    wait for 1 ns;
    assert q2 = '0' and q2_n = '1';

    -- synchronous operations on flip-flop 2 (negative edge triggered)
    pre2_n <= '1'; clr2_n <= '1';
    j2 <= '1'; k2 <= '0';
    clk2 <= '1'; clk2 <= '0'; wait for 1 ns; clk2 <= '1';
    wait for 1 ns;
    assert q2 = '1' and q2_n = '0';

    k2 <= '1';
    wait for 1 ns;
    clk2 <= '0'; wait for 1 ns; clk2 <= '1';
    wait for 1 ns;
    assert q2 = '0' and q2_n = '1';

    wait;
  end process;

end architecture;
