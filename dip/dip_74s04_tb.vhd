library ieee;
use ieee.std_logic_1164.all;

entity dip_74s04_tb is
end entity;

architecture behavior of dip_74s04_tb is
  -- UUT signals
  signal p2, p4, p6, p8, p10, p12 : std_logic;
  signal p1, p3, p5, p9, p11, p13 : std_logic;

  -- REF signals
  signal g1q_n, g2q_n, g3q_n, g4q_n, g5q_n, g6q_n : std_logic;
begin

  -- Instantiate the Wrapper (UUT)
  uut : entity work.dip_74s04
    port map (
      p1  => p1,
      p2  => p2,
      p3  => p3,
      p4  => p4,
      p5  => p5,
      p6  => p6,
      p8  => p8,
      p9  => p9,
      p10 => p10,
      p11 => p11,
      p12 => p12,
      p13 => p13
      );

  -- Instantiate the actual TTL component (REF)
  ref : entity work.sn7404
    port map (
      g1a   => p1,
      g1q_n => g1q_n,
      g2a   => p3,
      g2q_n => g2q_n,
      g3a   => p5,
      g3q_n => g3q_n,
      g4a   => p9,
      g4q_n => g4q_n,
      g5a   => p11,
      g5q_n => g5q_n,
      g6a   => p13,
      g6q_n => g6q_n
      );

  stim_proc : process
    type pattern is record
      a : std_logic;
    end record;
    type pattern_array is array (natural range <>) of pattern;
    constant patterns : pattern_array := (
      (a => '0'),
      (a => '1')
      );
  begin
    report "Starting test for dip_74s04";

    for i in patterns'range loop
      p1  <= patterns(i).a;
      p3  <= patterns(i).a;
      p5  <= patterns(i).a;
      p9  <= patterns(i).a;
      p11 <= patterns(i).a;
      p13 <= patterns(i).a;

      wait for 10 ns;

      assert p2 = g1q_n report "Gate 1 output mismatch" severity error;
      assert p4 = g2q_n report "Gate 2 output mismatch" severity error;
      assert p6 = g3q_n report "Gate 3 output mismatch" severity error;
      assert p8 = g4q_n report "Gate 4 output mismatch" severity error;
      assert p10 = g5q_n report "Gate 5 output mismatch" severity error;
      assert p12 = g6q_n report "Gate 6 output mismatch" severity error;
    end loop;

    report "Test finished for dip_74s04";
    wait;
  end process;

end architecture; 