library ieee;
use ieee.std_logic_1164.all;

use work.amd.am93s48;

entity am93s48_tb is
end;

architecture testbench of am93s48_tb is

  signal po  : std_logic;
  signal pe  : std_logic;
  signal i11 : std_logic;
  signal i10 : std_logic;
  signal i9  : std_logic;
  signal i8  : std_logic;
  signal i7  : std_logic;
  signal i6  : std_logic;
  signal i5  : std_logic;
  signal i4  : std_logic;
  signal i3  : std_logic;
  signal i2  : std_logic;
  signal i1  : std_logic;
  signal i0  : std_logic;

begin

  uut : am93s48 port map(
    i0  => i0,
    i1  => i1,
    i2  => i2,
    i3  => i3,
    i4  => i4,
    i5  => i5,
    i6  => i6,
    i7  => i7,
    i8  => i8,
    i9  => i9,
    i10 => i10,
    i11 => i11,
    pe  => pe,
    po  => po
    );

  process
    variable expected_parity : std_logic;
  begin
    wait for 5 ns;

    -- Test 1: All inputs '0' - even parity
    i0 <= '0'; i1 <= '0'; i2 <= '0'; i3 <= '0';
    i4 <= '0'; i5 <= '0'; i6 <= '0'; i7 <= '0';
    i8 <= '0'; i9 <= '0'; i10 <= '0'; i11 <= '0';
    wait for 5 ns;
    expected_parity := '0';
    assert po = expected_parity report "Test 1 failed: po incorrect" severity error;
    assert pe = not expected_parity report "Test 1 failed: pe incorrect" severity error;

    -- Test 2: Single '1' input - odd parity
    i0 <= '1'; i1 <= '0'; i2 <= '0'; i3 <= '0';
    i4 <= '0'; i5 <= '0'; i6 <= '0'; i7 <= '0';
    i8 <= '0'; i9 <= '0'; i10 <= '0'; i11 <= '0';
    wait for 5 ns;
    expected_parity := '1';
    assert po = expected_parity report "Test 2 failed: po incorrect" severity error;
    assert pe = not expected_parity report "Test 2 failed: pe incorrect" severity error;

    -- Test 3: Two '1' inputs - even parity
    i0 <= '1'; i1 <= '1'; i2 <= '0'; i3 <= '0';
    i4 <= '0'; i5 <= '0'; i6 <= '0'; i7 <= '0';
    i8 <= '0'; i9 <= '0'; i10 <= '0'; i11 <= '0';
    wait for 5 ns;
    expected_parity := '0';
    assert po = expected_parity report "Test 3 failed: po incorrect" severity error;
    assert pe = not expected_parity report "Test 3 failed: pe incorrect" severity error;

    -- Test 4: Three '1' inputs - odd parity
    i0 <= '1'; i1 <= '1'; i2 <= '1'; i3 <= '0';
    i4 <= '0'; i5 <= '0'; i6 <= '0'; i7 <= '0';
    i8 <= '0'; i9 <= '0'; i10 <= '0'; i11 <= '0';
    wait for 5 ns;
    expected_parity := '1';
    assert po = expected_parity report "Test 4 failed: po incorrect" severity error;
    assert pe = not expected_parity report "Test 4 failed: pe incorrect" severity error;

    -- Test 5: All inputs '1' - even parity (12 ones)
    i0 <= '1'; i1 <= '1'; i2 <= '1'; i3 <= '1';
    i4 <= '1'; i5 <= '1'; i6 <= '1'; i7 <= '1';
    i8 <= '1'; i9 <= '1'; i10 <= '1'; i11 <= '1';
    wait for 5 ns;
    expected_parity := '0';
    assert po = expected_parity report "Test 5 failed: po incorrect" severity error;
    assert pe = not expected_parity report "Test 5 failed: pe incorrect" severity error;

    -- Test 6: Eleven '1' inputs - odd parity
    i0 <= '1'; i1 <= '1'; i2 <= '1'; i3 <= '1';
    i4 <= '1'; i5 <= '1'; i6 <= '1'; i7 <= '1';
    i8 <= '1'; i9 <= '1'; i10 <= '1'; i11 <= '0';
    wait for 5 ns;
    expected_parity := '1';
    assert po = expected_parity report "Test 6 failed: po incorrect" severity error;
    assert pe = not expected_parity report "Test 6 failed: pe incorrect" severity error;

    -- Test 7: Mixed pattern - 6 ones (even parity)
    i0 <= '1'; i1 <= '0'; i2 <= '1'; i3 <= '0';
    i4 <= '1'; i5 <= '0'; i6 <= '1'; i7 <= '0';
    i8 <= '1'; i9 <= '0'; i10 <= '1'; i11 <= '0';
    wait for 5 ns;
    expected_parity := '0';
    assert po = expected_parity report "Test 7 failed: po incorrect" severity error;
    assert pe = not expected_parity report "Test 7 failed: pe incorrect" severity error;

    -- Test 8: Mixed pattern - 5 ones (odd parity)
    i0 <= '1'; i1 <= '0'; i2 <= '1'; i3 <= '0';
    i4 <= '1'; i5 <= '0'; i6 <= '1'; i7 <= '0';
    i8 <= '1'; i9 <= '0'; i10 <= '0'; i11 <= '0';
    wait for 5 ns;
    expected_parity := '1';
    assert po = expected_parity report "Test 8 failed: po incorrect" severity error;
    assert pe = not expected_parity report "Test 8 failed: pe incorrect" severity error;

    -- Test 9: Test each individual input bit
    -- Only i11 = '1', rest = '0'
    i0 <= '0'; i1 <= '0'; i2 <= '0'; i3 <= '0';
    i4 <= '0'; i5 <= '0'; i6 <= '0'; i7 <= '0';
    i8 <= '0'; i9 <= '0'; i10 <= '0'; i11 <= '1';
    wait for 5 ns;
    expected_parity := '1';
    assert po = expected_parity report "Test 9 failed: po incorrect" severity error;
    assert pe = not expected_parity report "Test 9 failed: pe incorrect" severity error;

    -- Test 10: Only i10 = '1', rest = '0'
    i0 <= '0'; i1 <= '0'; i2 <= '0'; i3 <= '0';
    i4 <= '0'; i5 <= '0'; i6 <= '0'; i7 <= '0';
    i8 <= '0'; i9 <= '0'; i10 <= '1'; i11 <= '0';
    wait for 5 ns;
    expected_parity := '1';
    assert po = expected_parity report "Test 10 failed: po incorrect" severity error;
    assert pe = not expected_parity report "Test 10 failed: pe incorrect" severity error;

    wait;
  end process;

end;
