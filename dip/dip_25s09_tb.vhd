library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dip_25s09_tb is
end entity;

architecture test of dip_25s09_tb is

  component dip_25s09 is
    port(
      p1  : in  std_logic;
      p2  : out std_logic;
      p3  : in  std_logic;
      p4  : in  std_logic;
      p5  : in  std_logic;
      p6  : in  std_logic;
      p7  : out std_logic;
      p9  : in  std_logic;
      p10 : out std_logic;
      p11 : in  std_logic;
      p12 : in  std_logic;
      p13 : in  std_logic;
      p14 : in  std_logic;
      p15 : out std_logic
      );
  end component;

  signal p1, p3, p4, p5, p6, p9, p11, p12, p13, p14 : std_logic;
  signal p2, p7, p10, p15                            : std_logic;

begin

  -- sel => p1,
  -- aq  => p2,
  -- a0  => p3,
  -- a1  => p4,
  -- b1  => p5,
  -- b0  => p6,
  -- bq  => p7,
  -- clk => p9,
  -- cq  => p10,
  -- c0  => p11,
  -- c1  => p12,
  -- d1  => p13,
  -- d0  => p14,
  -- dq  => p15

  dut : dip_25s09
    port map(
      p1  => p1,
      p2  => p2,
      p3  => p3,
      p4  => p4,
      p5  => p5,
      p6  => p6,
      p7  => p7,
      p9  => p9,
      p10 => p10,
      p11 => p11,
      p12 => p12,
      p13 => p13,
      p14 => p14,
      p15 => p15
      );

  stimulus : process is
  begin
    -- Initialize signals
    p9 <= '0';
    p1 <= '0';
    p3 <= '0'; p4 <= '0';
    p6 <= '0'; p5 <= '0';
    p11 <= '0'; p12 <= '0';
    p14 <= '0'; p13 <= '0';
    wait for 10 ns;

    -- Test 1: sel = '0', outputs should be forced to '0' on clock edge
    p3 <= '1'; p5 <= '1'; p11 <= '1'; p13 <= '1';
    p9 <= '1';
    wait for 10 ns;
    p9 <= '0';
    wait for 10 ns;
    assert p2 = '0' and p7 = '0' and p10 = '0' and p15 = '0'
      report "Test 1 failed: outputs should be 0 when sel=0" severity error;

    -- Test 2: sel = '1', data should be latched on clock edge
    p1 <= '1';
    p3 <= '1'; p4 <= '0';   -- a0 OR a1 = '1'
    p6 <= '0'; p5 <= '1';   -- b0 OR b1 = '1'
    p11 <= '1'; p12 <= '1'; -- c0 OR c1 = '1'
    p14 <= '0'; p13 <= '0'; -- d0 OR d1 = '0'
    wait for 5 ns;          -- Let inputs settle
    p9 <= '1';
    wait for 10 ns;
    p9 <= '0';
    wait for 10 ns;
    assert p2 = '1' and p7 = '1' and p10 = '1' and p15 = '0'
      report "Test 2 failed: incorrect latching with sel=1" severity error;

    -- Test 3: Change inputs, outputs should remain stable until next clock
    p3 <= '0'; p4 <= '0';   -- a0 OR a1 = '0'
    p6 <= '0'; p5 <= '0';   -- b0 OR b1 = '0'
    p11 <= '0'; p12 <= '0'; -- c0 OR c1 = '0'
    p14 <= '1'; p13 <= '1'; -- d0 OR d1 = '1'
    wait for 10 ns;
    assert p2 = '1' and p7 = '1' and p10 = '1' and p15 = '0'
      report "Test 3 failed: outputs changed without clock edge" severity error;

    -- Test 4: Clock edge with new data
    p9 <= '1';
    wait for 10 ns;
    p9 <= '0';
    wait for 10 ns;
    assert p2 = '0' and p7 = '0' and p10 = '0' and p15 = '1'
      report "Test 4 failed: new data not latched correctly" severity error;

    -- Test 5: sel = '0', all outputs forced to '0' regardless of inputs
    p1 <= '0';
    p3 <= '1'; p4 <= '1';
    p6 <= '1'; p5 <= '1';
    p11 <= '1'; p12 <= '1';
    p14 <= '1'; p13 <= '1';
    wait for 5 ns;          -- Let inputs settle
    p9 <= '1';
    wait for 10 ns;
    p9 <= '0';
    wait for 10 ns;
    assert p2 = '0' and p7 = '0' and p10 = '0' and p15 = '0'
      report "Test 5 failed: outputs should be 0 when sel=0" severity error;

    report "all tests passed for dip_25s09" severity note;
    wait;
  end process stimulus;

end architecture test; 