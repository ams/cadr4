library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dip_74s133_tb is
end entity;

architecture behavior of dip_74s133_tb is
  -- UUT signals
  signal p9                             : std_logic;
  signal p1, p2, p3, p4, p5, p6, p7, p10, p11, p12, p13, p14, p15 : std_logic;

  -- REF signals
  signal q_n                            : std_logic;
begin

  -- Instantiate the Wrapper (UUT)
  uut : entity work.dip_74s133
    port map (
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

  -- Instantiate the actual TTL component (REF)
  ref : entity work.sn74133
    port map (
      a   => p1,
      b   => p2,
      c   => p3,
      d   => p4,
      e   => p5,
      f   => p6,
      g   => p7,
      h   => p10,
      i   => p11,
      j   => p12,
      k   => p13,
      l   => p14,
      m   => p15,
      q_n => q_n
      );

  stim_proc : process
  begin
    report "Starting test for dip_74s133";

    -- Test case 1: All inputs are '1'
    p1  <= '1';
    p2  <= '1';
    p3  <= '1';
    p4  <= '1';
    p5  <= '1';
    p6  <= '1';
    p7  <= '1';
    p10 <= '1';
    p11 <= '1';
    p12 <= '1';
    p13 <= '1';
    p14 <= '1';
    p15 <= '1';
    wait for 10 ns;
    assert p9 = q_n report "All '1's mismatch" severity error;

    -- Test case 2: One input is '0'
    p1 <= '0';
    wait for 10 ns;
    assert p9 = q_n report "One '0' mismatch" severity error;
    p1 <= '1';

    report "Test finished for dip_74s133";
    wait;
  end process;

end architecture; 