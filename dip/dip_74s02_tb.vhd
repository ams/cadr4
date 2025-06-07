library ieee;
use ieee.std_logic_1164.all;

entity dip_74s02_tb is
end entity;

architecture behavior of dip_74s02_tb is
  -- UUT signals
  signal p1, p4, p10, p13 : std_logic;
  signal p2, p3, p5, p6, p8, p9, p11, p12 : std_logic;

  -- REF signals
  signal g1q_n, g2q_n, g3q_n, g4q_n : std_logic;
begin

  -- Instantiate the Wrapper (UUT)
  uut : entity work.dip_74s02
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
  ref : entity work.sn7402
    port map (
      g1a   => p2,
      g1b   => p3,
      g1q_n => g1q_n,
      g2a   => p5,
      g2b   => p6,
      g2q_n => g2q_n,
      g3a   => p8,
      g3b   => p9,
      g3q_n => g3q_n,
      g4a   => p11,
      g4b   => p12,
      g4q_n => g4q_n
      );

  stim_proc : process
    type pattern is record
      a, b : std_logic;
    end record;
    type pattern_array is array (natural range <>) of pattern;
    constant patterns : pattern_array := (
      ('0', '0'),
      ('0', '1'),
      ('1', '0'),
      ('1', '1')
      );
  begin
    report "Starting test for dip_74s02";

    for i in patterns'range loop
      p2 <= patterns(i).a;
      p3 <= patterns(i).b;
      p5 <= patterns(i).a;
      p6 <= patterns(i).b;
      p8 <= patterns(i).a;
      p9 <= patterns(i).b;
      p11 <= patterns(i).a;
      p12 <= patterns(i).b;

      wait for 10 ns;

      assert p1 = g1q_n report "Gate 1 output mismatch" severity error;
      assert p4 = g2q_n report "Gate 2 output mismatch" severity error;
      assert p10 = g3q_n report "Gate 3 output mismatch" severity error;
      assert p13 = g4q_n report "Gate 4 output mismatch" severity error;
    end loop;

    report "Test finished for dip_74s02";
    wait;
  end process;

end architecture; 