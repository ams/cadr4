library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74194_tb is
end;

architecture testbench of sn74194_tb is

  signal q0    : std_logic;
  signal q1    : std_logic;
  signal q2    : std_logic;
  signal q3    : std_logic;
  signal clk   : std_logic;
  signal s1    : std_logic;
  signal s0    : std_logic;
  signal sil   : std_logic;
  signal i3    : std_logic;
  signal i2    : std_logic;
  signal i1    : std_logic;
  signal i0    : std_logic;
  signal sir   : std_logic;
  signal clr_n : std_logic;

  procedure check_outputs(
    q3_expected, q2_expected, q1_expected, q0_expected : in std_logic;
    msg : in string) is
  begin
    assert q3 = q3_expected report "q3 " & msg severity error;
    assert q2 = q2_expected report "q2 " & msg severity error;
    assert q1 = q1_expected report "q1 " & msg severity error;
    assert q0 = q0_expected report "q0 " & msg severity error;
  end procedure;

begin

  uut : sn74194 port map(
    clr_n => clr_n,
    sir   => sir,
    i0    => i0,
    i1    => i1,
    i2    => i2,
    i3    => i3,
    sil   => sil,
    s0    => s0,
    s1    => s1,
    clk   => clk,
    q3    => q3,
    q2    => q2,
    q1    => q1,
    q0    => q0
    );

  process
  begin
    -- Initialize
    clk <= '0';
    clr_n <= '1';
    s1 <= '0'; s0 <= '0';
    sil <= '0'; sir <= '0';
    i3 <= '0'; i2 <= '0'; i1 <= '0'; i0 <= '0';
    wait for 5 ns;

    -- Test clear functionality
    clr_n <= '0';
    wait for 5 ns;
    check_outputs('0', '0', '0', '0', "should be cleared");

    -- Test hold mode
    clr_n <= '1';
    s1 <= '0'; s0 <= '0';
    i3 <= '1'; i2 <= '1'; i1 <= '1'; i0 <= '1';
    wait for 5 ns;
    check_outputs('0', '0', '0', '0', "should not change without clock");

    clk <= '1';
    wait for 5 ns;
    check_outputs('0', '0', '0', '0', "should hold in hold mode");

    -- Test parallel load
    clk <= '0';
    s1 <= '1'; s0 <= '1';
    i3 <= '1'; i2 <= '0'; i1 <= '1'; i0 <= '0';
    wait for 5 ns;
    check_outputs('0', '0', '0', '0', "should not change without clock");

    clk <= '1';
    wait for 5 ns;
    check_outputs('1', '0', '1', '0', "should load parallel data");

    -- Test shift right
    clk <= '0';
    s1 <= '0'; s0 <= '1';
    sir <= '1';
    wait for 5 ns;
    check_outputs('1', '0', '1', '0', "should not change without clock");

    clk <= '1';
    wait for 5 ns;
    check_outputs('1', '1', '0', '1', "should shift right");

    -- Test shift left
    clk <= '0';
    s1 <= '1'; s0 <= '0';
    sil <= '1';
    wait for 5 ns;
    check_outputs('1', '1', '0', '1', "should not change without clock");

    clk <= '1';
    wait for 5 ns;
    check_outputs('1', '0', '1', '1', "should shift left");

    -- Test clear during operation
    clr_n <= '0';
    wait for 5 ns;
    check_outputs('0', '0', '0', '0', "should clear immediately");

    -- Test clock edge sensitivity
    clr_n <= '1';
    s1 <= '1'; s0 <= '1';
    i3 <= '1'; i2 <= '1'; i1 <= '1'; i0 <= '1';
    clk <= '0';
    wait for 5 ns;
    check_outputs('0', '0', '0', '0', "should not change on falling edge");

    clk <= '1';
    wait for 5 ns;
    check_outputs('1', '1', '1', '1', "should change on rising edge");

    report "Test completed successfully" severity note;
    wait;
  end process;

end;
