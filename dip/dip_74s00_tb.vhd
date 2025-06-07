library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

use work.dip.all;

entity dip_74s00_tb is
end entity;

architecture behavior of dip_74s00_tb is
  signal p1, p2, p4, p5, p9, p10, p12, p13 : std_logic;
  signal p3, p6, p8, p11 : std_logic;
begin
  uut : entity work.dip_74s00
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

  stim_proc : process
    type pattern is record
      a, b : std_logic;
      q_n  : std_logic;
    end record;
    type pattern_array is array (natural range <>) of pattern;
    constant patterns : pattern_array := (
      ('0', '0', '1'),
      ('0', '1', '1'),
      ('1', '0', '1'),
      ('1', '1', '0')
    );
  begin
    report "Starting test";

    for i in patterns'range loop
      -- Gate 1
      p1 <= patterns(i).b;
      p2 <= patterns(i).a;
      -- Gate 2
      p4 <= patterns(i).b;
      p5 <= patterns(i).a;
      -- Gate 3
      p10 <= patterns(i).b;
      p9 <= patterns(i).a;
      -- Gate 4
      p13 <= patterns(i).b;
      p12 <= patterns(i).a;
      
      wait for 10 ns;
      
      assert p3 = patterns(i).q_n report "Gate 1 failed" severity error;
      assert p6 = patterns(i).q_n report "Gate 2 failed" severity error;
      assert p8 = patterns(i).q_n report "Gate 3 failed" severity error;
      assert p11 = patterns(i).q_n report "Gate 4 failed" severity error;
    end loop;

    report "Test finished";
    wait;
  end process;

end architecture; 