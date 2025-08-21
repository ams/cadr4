library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn74276_tb is
end entity;

architecture testbench of sn74276_tb is

  signal clr_n  : std_logic;
  signal set_n  : std_logic;
  
  signal j1     : std_logic;
  signal k1_n   : std_logic;
  signal clk1_n : std_logic;
  signal q1     : std_logic;
  signal q1_n   : std_logic;
  
  signal j2     : std_logic;
  signal k2_n   : std_logic;
  signal clk2_n : std_logic;
  signal q2     : std_logic;
  signal q2_n   : std_logic;
  
  signal j3     : std_logic;
  signal k3_n   : std_logic;
  signal clk3_n : std_logic;
  signal q3     : std_logic;
  signal q3_n   : std_logic;
  
  signal j4     : std_logic;
  signal k4_n   : std_logic;
  signal clk4_n : std_logic;
  signal q4     : std_logic;
  signal q4_n   : std_logic;

begin

  uut : sn74276 port map(
    clr_n  => clr_n,
    set_n  => set_n,
    
    j1     => j1,
    k1_n   => k1_n,
    clk1_n => clk1_n,
    q1     => q1,
    q1_n   => q1_n,
    
    j2     => j2,
    k2_n   => k2_n,
    clk2_n => clk2_n,
    q2     => q2,
    q2_n   => q2_n,
    
    j3     => j3,
    k3_n   => k3_n,
    clk3_n => clk3_n,
    q3     => q3,
    q3_n   => q3_n,
    
    j4     => j4,
    k4_n   => k4_n,
    clk4_n => clk4_n,
    q4     => q4,
    q4_n   => q4_n
    );

  process
  begin
    -- Initialize all signals
    clr_n <= '1'; set_n <= '1';
    j1 <= '0'; k1_n <= '1'; clk1_n <= '1';
    j2 <= '0'; k2_n <= '1'; clk2_n <= '1';
    j3 <= '0'; k3_n <= '1'; clk3_n <= '1';
    j4 <= '0'; k4_n <= '1'; clk4_n <= '1';
    wait for 1 ns;

    -- Test common asynchronous clear
    clr_n <= '0';
    wait for 1 ns;
    assert q1 = '0' and q1_n = '1';
    assert q2 = '0' and q2_n = '1';
    assert q3 = '0' and q3_n = '1';
    assert q4 = '0' and q4_n = '1';

    -- Test common asynchronous preset
    clr_n <= '1'; set_n <= '0';
    wait for 1 ns;
    assert q1 = '1' and q1_n = '0';
    assert q2 = '1' and q2_n = '0';
    assert q3 = '1' and q3_n = '0';
    assert q4 = '1' and q4_n = '0';

    -- Return to normal operation
    set_n <= '1';
    wait for 1 ns;

    -- Test flip-flop 1: J=1, K̄=1 (hold), negative edge trigger
    j1 <= '1'; k1_n <= '1';
    clk1_n <= '1'; clk1_n <= '0'; wait for 1 ns; clk1_n <= '1';
    wait for 1 ns;
    assert q1 = '1' and q1_n = '0';

    -- Test flip-flop 1: J=1, K̄=0 (reset), negative edge trigger
    k1_n <= '0';
    wait for 1 ns;
    clk1_n <= '0'; wait for 1 ns; clk1_n <= '1';
    wait for 1 ns;
    assert q1 = '0' and q1_n = '1';

    -- Test flip-flop 1: J=0, K̄=1 (hold), negative edge trigger
    j1 <= '0'; k1_n <= '1';
    clk1_n <= '0'; wait for 1 ns; clk1_n <= '1';
    wait for 1 ns;
    assert q1 = '0' and q1_n = '1';

    -- Test flip-flop 2: J=1, K̄=1 (set), negative edge trigger
    j2 <= '1'; k2_n <= '1';
    clk2_n <= '1'; clk2_n <= '0'; wait for 1 ns; clk2_n <= '1';
    wait for 1 ns;
    assert q2 = '1' and q2_n = '0';

    -- Test flip-flop 2: J=0, K̄=0 (toggle), negative edge trigger
    j2 <= '0'; k2_n <= '0';
    clk2_n <= '0'; wait for 1 ns; clk2_n <= '1';
    wait for 1 ns;
    assert q2 = '0' and q2_n = '1';

    -- Test flip-flop 3: J=1, K̄=0 (toggle), negative edge trigger
    j3 <= '1'; k3_n <= '0';
    clk3_n <= '1'; clk3_n <= '0'; wait for 1 ns; clk3_n <= '1';
    wait for 1 ns;
    assert q3 = '0' and q3_n = '1';

    -- Test flip-flop 4: J=0, K̄=0 (toggle), negative edge trigger
    j4 <= '0'; k4_n <= '0';
    clk4_n <= '1'; clk4_n <= '0'; wait for 1 ns; clk4_n <= '1';
    wait for 1 ns;
    assert q4 = '0' and q4_n = '1';

    -- Test that positive edges don't trigger (74276 is negative edge triggered)
    j1 <= '1'; k1_n <= '1';
    clk1_n <= '0'; clk1_n <= '1'; wait for 1 ns;  -- positive edge
    assert q1 = '0' and q1_n = '1';  -- should not change

    -- Verify asynchronous operations override synchronous
    j1 <= '1'; k1_n <= '0';
    clr_n <= '0';  -- Clear should override J-K inputs
    clk1_n <= '0'; wait for 1 ns; clk1_n <= '1';
    wait for 1 ns;
    assert q1 = '0' and q1_n = '1';

    clr_n <= '1'; set_n <= '0';  -- Preset should override J-K inputs
    clk1_n <= '0'; wait for 1 ns; clk1_n <= '1';
    wait for 1 ns;
    assert q1 = '1' and q1_n = '0';

    set_n <= '1';
    wait for 1 ns;

    wait;
  end process;

end;
