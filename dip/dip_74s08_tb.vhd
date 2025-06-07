library ieee;
use ieee.std_logic_1164.all;

entity dip_74s08_tb is
end entity;

architecture behavior of dip_74s08_tb is
  -- UUT signals
  signal p3, p6, p8, p11 : std_logic;
  signal p1, p2, p4, p5, p9, p10, p12, p13 : std_logic;

  -- REF signals
  signal g1q, g2q, g3q, g4q : std_logic;
begin

  -- Instantiate the Wrapper (UUT)
  uut : entity work.dip_74s08
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
  ref : entity work.sn7408
    port map (
      g1a => p2,
      g1b => p1,
      g1q => g1q,
      g2a => p5,
      g2b => p4,
      g2q => g2q,
      g3a => p9,
      g3b => p10,
      g3q => g3q,
      g4a => p12,
      g4b => p13,
      g4q => g4q
      );

  stim_proc : process
    type pattern is record
      a, b : std_logic;
    end record;
    type pattern_array is array (natural range <>) of pattern;
    constant patterns : pattern_array := (
      (a => '0', b => '0'),
      (a => '0', b => '1'),
      (a => '1', b => '0'),
      (a => '1', b => '1')
      );
  begin
    report "Starting test for dip_74s08";

    for i in patterns'range loop
      p2  <= patterns(i).a;
      p1  <= patterns(i).b;
      p5  <= patterns(i).a;
      p4  <= patterns(i).b;
      p9  <= patterns(i).a;
      p10 <= patterns(i).b;
      p12 <= patterns(i).a;
      p13 <= patterns(i).b;

      wait for 10 ns;

      assert p3 = g1q report "Gate 1 output mismatch" severity error;
      assert p6 = g2q report "Gate 2 output mismatch" severity error;
      assert p8 = g3q report "Gate 3 output mismatch" severity error;
      assert p11 = g4q report "Gate 4 output mismatch" severity error;
    end loop;

    report "Test finished for dip_74s08";
    wait;
  end process;

end architecture; 