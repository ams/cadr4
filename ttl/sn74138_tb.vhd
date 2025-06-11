library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.sn74.all;

entity sn74138_tb is
end sn74138_tb;

architecture testbench of sn74138_tb is
  signal a, b, c, g1, g2a, g2b : std_logic;
  signal y : std_logic_vector(7 downto 0);
begin
  uut: entity work.sn74138 port map (
    a => a,
    b => b,
    c => c,
    g1 => g1,
    g2a => g2a,
    g2b => g2b,
    y0 => y(0),
    y1 => y(1),
    y2 => y(2),
    y3 => y(3),
    y4 => y(4),
    y5 => y(5),
    y6 => y(6),
    y7 => y(7)
  );

  process
    variable exp : std_logic_vector(7 downto 0);
    variable act : std_logic_vector(7 downto 0);
    variable l : line;
  begin
    -- Test all input combinations
    for i in 0 to 7 loop
      a <= std_logic(to_unsigned(i, 3)(2));
      b <= std_logic(to_unsigned(i, 3)(1));
      c <= std_logic(to_unsigned(i, 3)(0));
      g1 <= '1';
      g2a <= '0';
      g2b <= '0';
      wait for 10 ns;
      exp := (others => '1');
      exp(i) := '0';
      act := y;
      assert act = exp
        report "Test failed for input " & integer'image(i) &
               " Expected: " & to_string(exp) &
               " Actual: " & to_string(act)
        severity error;
    end loop;

    -- Test disabled state
    g1 <= '0';
    g2a <= '0';
    g2b <= '0';
    wait for 10 ns;
    exp := (others => '1');
    act := y;
    assert act = exp
      report "Test failed for disabled state" &
             " Expected: " & to_string(exp) &
             " Actual: " & to_string(act)
      severity error;

    -- Test disabled state with g2a
    g1 <= '1';
    g2a <= '1';
    g2b <= '0';
    wait for 10 ns;
    exp := (others => '1');
    act := y;
    assert act = exp
      report "Test failed for disabled state with g2a" &
             " Expected: " & to_string(exp) &
             " Actual: " & to_string(act)
      severity error;

    -- Test disabled state with g2b
    g1 <= '1';
    g2a <= '0';
    g2b <= '1';
    wait for 10 ns;
    exp := (others => '1');
    act := y;
    assert act = exp
      report "Test failed for disabled state with g2b" &
             " Expected: " & to_string(exp) &
             " Actual: " & to_string(act)
      severity error;

    wait;
  end process;
end testbench;
