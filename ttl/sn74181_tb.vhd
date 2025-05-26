library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74181_tb is
end;

architecture testbench of sn74181_tb is

  -- Initialize signals to avoid metavalue assertions from ieee.numeric_std
  signal cin_n  : std_logic := '0';
  signal s0     : std_logic := '0';
  signal s1     : std_logic := '0';
  signal s2     : std_logic := '0';
  signal s3     : std_logic := '0';
  signal m      : std_logic := '0';
  signal a0     : std_logic := '0';
  signal a1     : std_logic := '0';
  signal a2     : std_logic := '0';
  signal a3     : std_logic := '0';
  signal b0     : std_logic := '0';
  signal b1     : std_logic := '0';
  signal b2     : std_logic := '0';
  signal b3     : std_logic := '0';
  signal f0     : std_logic := '0';
  signal f1     : std_logic := '0';
  signal f2     : std_logic := '0';
  signal f3     : std_logic := '0';
  signal aeb    : std_logic := '0';
  signal x      : std_logic := '0';
  signal y      : std_logic := '0';
  signal cout_n : std_logic := '0';

begin

  uut : sn74181 port map(
    cout_n => cout_n,
    y      => y,
    x      => x,
    aeb    => aeb,

    f3 => f3,
    f2 => f2,
    f1 => f1,
    f0 => f0,

    b3 => b3,
    b2 => b2,
    b1 => b1,
    b0 => b0,

    a3 => a3,
    a2 => a2,
    a1 => a1,
    a0 => a0,

    m  => m,
    s3 => s3,
    s2 => s2,
    s1 => s1,
    s0 => s0,

    cin_n => cin_n
    );

  process
    variable f : std_logic_vector(3 downto 0);
  begin
    -- Test arithmetic operations (m=0)
    m <= '0';
    
    -- Test case 1: A + 1 (sel=0000)
    a3 <= '0'; a2 <= '0'; a1 <= '1'; a0 <= '1'; -- A=3
    b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '0'; -- B=0
    cin_n <= '1'; -- cin=1
    s3 <= '0'; s2 <= '0'; s1 <= '0'; s0 <= '0';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "0100" report "A+1 failed" severity error;
    
    -- Test case 2: A + B (sel=0001)
    a3 <= '0'; a2 <= '0'; a1 <= '1'; a0 <= '1'; -- A=3
    b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '1'; -- B=5
    cin_n <= '1'; -- cin=1
    s3 <= '0'; s2 <= '0'; s1 <= '0'; s0 <= '1';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "1000" report "A+B failed" severity error;
    
    -- Test case 3: A - B - 1 (sel=0010)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '1'; -- B=3
    cin_n <= '1'; -- cin=1
    s3 <= '0'; s2 <= '0'; s1 <= '1'; s0 <= '0';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "0001" report "A-B-1 failed" severity error;
    
    -- Test case 4: A + B + 1 (sel=0011)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '1'; -- B=3
    cin_n <= '1'; -- cin=1
    s3 <= '0'; s2 <= '0'; s1 <= '1'; s0 <= '1';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "1001" report "A+B+1 failed" severity error;
    
    -- Test case 5: A - 1 (sel=0100)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '0'; -- B=0
    cin_n <= '1'; -- cin=1
    s3 <= '0'; s2 <= '1'; s1 <= '0'; s0 <= '0';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "0100" report "A-1 failed" severity error;
    
    -- Test case 6: A + A (sel=0101)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '0'; -- B=0
    cin_n <= '1'; -- cin=1
    s3 <= '0'; s2 <= '1'; s1 <= '0'; s0 <= '1';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "1010" report "A+A failed" severity error;
    
    -- Test case 7: A + A + 1 (sel=0110)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '0'; -- B=0
    cin_n <= '1'; -- cin=1
    s3 <= '0'; s2 <= '1'; s1 <= '1'; s0 <= '0';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "1011" report "A+A+1 failed" severity error;
    
    -- Test case 8: A - B (sel=0111)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '1'; -- B=3
    cin_n <= '1'; -- cin=1
    s3 <= '0'; s2 <= '1'; s1 <= '1'; s0 <= '1';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "0010" report "A-B failed" severity error;

    -- Test case 9: A + B + cin (sel=1000)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '1'; -- B=3
    cin_n <= '0'; -- cin=0
    s3 <= '1'; s2 <= '0'; s1 <= '0'; s0 <= '0';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "1001" report "A+B+cin failed" severity error;

    -- Test case 10: A + B + cin + 1 (sel=1001)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '1'; -- B=3
    cin_n <= '0'; -- cin=0
    s3 <= '1'; s2 <= '0'; s1 <= '0'; s0 <= '1';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "1010" report "A+B+cin+1 failed" severity error;

    -- Test case 11: A - B - cin (sel=1010)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '1'; -- B=3
    cin_n <= '0'; -- cin=0
    s3 <= '1'; s2 <= '0'; s1 <= '1'; s0 <= '0';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "0001" report "A-B-cin failed" severity error;

    -- Test case 12: A - B - cin - 1 (sel=1011)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '1'; -- B=3
    cin_n <= '0'; -- cin=0
    s3 <= '1'; s2 <= '0'; s1 <= '1'; s0 <= '1';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "0000" report "A-B-cin-1 failed" severity error;

    -- Test case 13: A + cin (sel=1100)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '0'; -- B=0
    cin_n <= '0'; -- cin=0
    s3 <= '1'; s2 <= '1'; s1 <= '0'; s0 <= '0';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "0110" report "A+cin failed" severity error;

    -- Test case 14: A + cin + 1 (sel=1101)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '0'; -- B=0
    cin_n <= '0'; -- cin=0
    s3 <= '1'; s2 <= '1'; s1 <= '0'; s0 <= '1';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "0111" report "A+cin+1 failed" severity error;

    -- Test case 15: A - cin (sel=1110)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '0'; -- B=0
    cin_n <= '0'; -- cin=0
    s3 <= '1'; s2 <= '1'; s1 <= '1'; s0 <= '0';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "0100" report "A-cin failed" severity error;

    -- Test case 16: A - cin - 1 (sel=1111)
    a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- A=5
    b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '0'; -- B=0
    cin_n <= '0'; -- cin=0
    s3 <= '1'; s2 <= '1'; s1 <= '1'; s0 <= '1';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "0011" report "A-cin-1 failed" severity error;
    
    -- Test logic operations (m=1)
    m <= '1';
    
    -- Test case 17: NOT A (sel=0000)
    a3 <= '1'; a2 <= '1'; a1 <= '0'; a0 <= '0'; -- A=12
    b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '0'; -- B=0
    cin_n <= '1';
    s3 <= '0'; s2 <= '0'; s1 <= '0'; s0 <= '0';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "0011" report "NOT A failed" severity error;
    
    -- Test case 18: A AND B (sel=1011)
    a3 <= '1'; a2 <= '1'; a1 <= '0'; a0 <= '0'; -- A=12
    b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '0'; -- B=10
    cin_n <= '1';
    s3 <= '1'; s2 <= '0'; s1 <= '1'; s0 <= '1';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "1000" report "A AND B failed" severity error;
    
    -- Test case 19: A OR B (sel=1110)
    a3 <= '1'; a2 <= '1'; a1 <= '0'; a0 <= '0'; -- A=12
    b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '0'; -- B=10
    cin_n <= '1';
    s3 <= '1'; s2 <= '1'; s1 <= '1'; s0 <= '0';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "1110" report "A OR B failed" severity error;
    
    -- Test case 20: A XOR B (sel=0110)
    a3 <= '1'; a2 <= '1'; a1 <= '0'; a0 <= '0'; -- A=12
    b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '0'; -- B=10
    cin_n <= '1';
    s3 <= '0'; s2 <= '1'; s1 <= '1'; s0 <= '0';
    wait for 1 ns;
    f := f3 & f2 & f1 & f0;
    assert f = "0110" report "A XOR B failed" severity error;

    wait;
  end process;

end;
