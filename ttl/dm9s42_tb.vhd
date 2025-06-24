library ieee;
use ieee.std_logic_1164.all;

use work.fairchild.dm9s42;

entity dm9s42_tb is
end;

architecture testbench of dm9s42_tb is

  signal g1a1 : std_logic;
  signal g1b1 : std_logic;
  signal g2a1 : std_logic;
  signal g2b1 : std_logic;
  signal g2c1 : std_logic;
  signal g2d1 : std_logic;
  signal out1 : std_logic;
  signal g1a2 : std_logic;
  signal g1b2 : std_logic;
  signal g2a2 : std_logic;
  signal g2b2 : std_logic;
  signal g2c2 : std_logic;
  signal g2d2 : std_logic;
  signal out2 : std_logic;

begin

  uut : dm9s42 port map(
    g1a1 => g1a1,
    g1b1 => g1b1,
    g2a1 => g2a1,
    g2b1 => g2b1,
    g2c1 => g2c1,
    g2d1 => g2d1,
    out1 => out1,
    g1a2 => g1a2,
    g1b2 => g1b2,
    g2a2 => g2a2,
    g2b2 => g2b2,
    g2c2 => g2c2,
    g2d2 => g2d2,
    out2 => out2
    );

  process
  begin
    wait for 5 ns;

    -- Test out1 path 1: g1a1 AND g1b1
    -- Set all g2 inputs to 0 to isolate path 1
    g2a1 <= '0'; g2b1 <= '0'; g2c1 <= '0'; g2d1 <= '0';
    g2a2 <= '0'; g2b2 <= '0'; g2c2 <= '0'; g2d2 <= '0';
    g1a2 <= '0'; g1b2 <= '0';
    
    -- Test all combinations of g1a1, g1b1
    g1a1 <= '0'; g1b1 <= '0'; wait for 10 ns;
    assert out1 = '0' report "Failed: g1a1=0, g1b1=0 should give out1=0";
    
    g1a1 <= '0'; g1b1 <= '1'; wait for 10 ns;
    assert out1 = '0' report "Failed: g1a1=0, g1b1=1 should give out1=0";
    
    g1a1 <= '1'; g1b1 <= '0'; wait for 10 ns;
    assert out1 = '0' report "Failed: g1a1=1, g1b1=0 should give out1=0";
    
    g1a1 <= '1'; g1b1 <= '1'; wait for 10 ns;
    assert out1 = '1' report "Failed: g1a1=1, g1b1=1 should give out1=1";

    -- Test out1 path 2: g2a1 AND g2b1 AND g2c1 AND g2d1
    -- Set g1 inputs to 0 to isolate path 2
    g1a1 <= '0'; g1b1 <= '0';
    
    -- Test some key combinations of 4-input AND
    g2a1 <= '0'; g2b1 <= '0'; g2c1 <= '0'; g2d1 <= '0'; wait for 10 ns;
    assert out1 = '0' report "Failed: all g2x1=0 should give out1=0";
    
    g2a1 <= '1'; g2b1 <= '1'; g2c1 <= '1'; g2d1 <= '0'; wait for 10 ns;
    assert out1 = '0' report "Failed: g2d1=0 should give out1=0";
    
    g2a1 <= '1'; g2b1 <= '1'; g2c1 <= '1'; g2d1 <= '1'; wait for 10 ns;
    assert out1 = '1' report "Failed: all g2x1=1 should give out1=1";
    
    g2a1 <= '0'; g2b1 <= '1'; g2c1 <= '1'; g2d1 <= '1'; wait for 10 ns;
    assert out1 = '0' report "Failed: g2a1=0 should give out1=0";

    -- Test OR functionality: both paths active
    g1a1 <= '1'; g1b1 <= '1';
    g2a1 <= '0'; g2b1 <= '0'; g2c1 <= '0'; g2d1 <= '0'; wait for 10 ns;
    assert out1 = '1' report "Failed: path1 active should give out1=1";
    
    g1a1 <= '0'; g1b1 <= '0';
    g2a1 <= '1'; g2b1 <= '1'; g2c1 <= '1'; g2d1 <= '1'; wait for 10 ns;
    assert out1 = '1' report "Failed: path2 active should give out1=1";
    
    g1a1 <= '1'; g1b1 <= '1';
    g2a1 <= '1'; g2b1 <= '1'; g2c1 <= '1'; g2d1 <= '1'; wait for 10 ns;
    assert out1 = '1' report "Failed: both paths active should give out1=1";

    -- Test out2 path 1: g1a2 AND g1b2
    -- Set all g2 inputs to 0 to isolate path 1
    g2a1 <= '0'; g2b1 <= '0'; g2c1 <= '0'; g2d1 <= '0';
    g2a2 <= '0'; g2b2 <= '0'; g2c2 <= '0'; g2d2 <= '0';
    g1a1 <= '0'; g1b1 <= '0';
    
    -- Test all combinations of g1a2, g1b2
    g1a2 <= '0'; g1b2 <= '0'; wait for 10 ns;
    assert out2 = '0' report "Failed: g1a2=0, g1b2=0 should give out2=0";
    
    g1a2 <= '0'; g1b2 <= '1'; wait for 10 ns;
    assert out2 = '0' report "Failed: g1a2=0, g1b2=1 should give out2=0";
    
    g1a2 <= '1'; g1b2 <= '0'; wait for 10 ns;
    assert out2 = '0' report "Failed: g1a2=1, g1b2=0 should give out2=0";
    
    g1a2 <= '1'; g1b2 <= '1'; wait for 10 ns;
    assert out2 = '1' report "Failed: g1a2=1, g1b2=1 should give out2=1";

    -- Test out2 path 2: g2a2 AND g2b2 AND g2c2 AND g2d2
    -- Set g1 inputs to 0 to isolate path 2
    g1a2 <= '0'; g1b2 <= '0';
    
    -- Test some key combinations of 4-input AND
    g2a2 <= '0'; g2b2 <= '0'; g2c2 <= '0'; g2d2 <= '0'; wait for 10 ns;
    assert out2 = '0' report "Failed: all g2x2=0 should give out2=0";
    
    g2a2 <= '1'; g2b2 <= '1'; g2c2 <= '1'; g2d2 <= '0'; wait for 10 ns;
    assert out2 = '0' report "Failed: g2d2=0 should give out2=0";
    
    g2a2 <= '1'; g2b2 <= '1'; g2c2 <= '1'; g2d2 <= '1'; wait for 10 ns;
    assert out2 = '1' report "Failed: all g2x2=1 should give out2=1";
    
    g2a2 <= '0'; g2b2 <= '1'; g2c2 <= '1'; g2d2 <= '1'; wait for 10 ns;
    assert out2 = '0' report "Failed: g2a2=0 should give out2=0";

    -- Test OR functionality for out2: both paths active
    g1a2 <= '1'; g1b2 <= '1';
    g2a2 <= '0'; g2b2 <= '0'; g2c2 <= '0'; g2d2 <= '0'; wait for 10 ns;
    assert out2 = '1' report "Failed: path1 active should give out2=1";
    
    g1a2 <= '0'; g1b2 <= '0';
    g2a2 <= '1'; g2b2 <= '1'; g2c2 <= '1'; g2d2 <= '1'; wait for 10 ns;
    assert out2 = '1' report "Failed: path2 active should give out2=1";
    
    g1a2 <= '1'; g1b2 <= '1';
    g2a2 <= '1'; g2b2 <= '1'; g2c2 <= '1'; g2d2 <= '1'; wait for 10 ns;
    assert out2 = '1' report "Failed: both paths active should give out2=1";

    -- Test both outputs simultaneously
    g1a1 <= '1'; g1b1 <= '1'; g1a2 <= '0'; g1b2 <= '0';
    g2a1 <= '0'; g2b1 <= '0'; g2c1 <= '0'; g2d1 <= '0';
    g2a2 <= '1'; g2b2 <= '1'; g2c2 <= '1'; g2d2 <= '1'; wait for 10 ns;
    assert out1 = '1' and out2 = '1' report "Failed: independent output test";

    wait;
  end process;

end;
