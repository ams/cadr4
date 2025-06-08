library ieee;
use ieee.std_logic_1164.all;

entity dip_74s10_tb is
end entity;

architecture behavior of dip_74s10_tb is
  -- UUT signals
  signal p6, p8, p12 : std_logic;
  signal p1, p2, p3, p4, p5, p9, p10, p11, p13 : std_logic;

  -- REF signals
  signal g1y_n, g2y_n, g3y_n : std_logic;
begin

  -- Instantiate the Wrapper (UUT)
  uut : entity work.dip_74s10
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
  ref : entity work.sn7410
    port map (
      g1a   => p1,
      g1b   => p2,
      g1c   => p13,
      g1y_n => g1y_n,
      g2a   => p3,
      g2b   => p4,
      g2c   => p5,
      g2y_n => g2y_n,
      g3a   => p9,
      g3b   => p10,
      g3c   => p11,
      g3y_n => g3y_n
      );

  stim_proc : process
    type pattern is record
      a, b, c : std_logic;
    end record;
    type pattern_array is array (natural range <>) of pattern;
    constant patterns : pattern_array := (
      (a => '0', b => '0', c => '0'),
      (a => '0', b => '0', c => '1'),
      (a => '0', b => '1', c => '0'),
      (a => '0', b => '1', c => '1'),
      (a => '1', b => '0', c => '0'),
      (a => '1', b => '0', c => '1'),
      (a => '1', b => '1', c => '0'),
      (a => '1', b => '1', c => '1')
      );
  begin
    -- report "Starting test for dip_74s10";

    for i in patterns'range loop
      p1  <= patterns(i).a;
      p2  <= patterns(i).b;
      p13 <= patterns(i).c;
      p3  <= patterns(i).a;
      p4  <= patterns(i).b;
      p5  <= patterns(i).c;
      p9  <= patterns(i).a;
      p10 <= patterns(i).b;
      p11 <= patterns(i).c;

      wait for 10 ns;

      assert p12 = g1y_n report "Gate 1 output mismatch" severity error;
      assert p6 = g2y_n report "Gate 2 output mismatch" severity error;
      assert p8 = g3y_n report "Gate 3 output mismatch" severity error;
    end loop;

    -- report "Test finished for dip_74s10";
    wait;
  end process;

end architecture; 