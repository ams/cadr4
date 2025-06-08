library ieee;
use ieee.std_logic_1164.all;

entity dip_74s139_tb is
end entity;

architecture behavior of dip_74s139_tb is
  -- UUT signals
  signal p4, p5, p6, p7, p9, p10, p11, p12 : std_logic;
  signal p1, p2, p3, p13, p14, p15         : std_logic;

  -- REF signals
  signal g1y0, g1y1, g1y2, g1y3, g2y0, g2y1, g2y2, g2y3 : std_logic;

  function to_std_logic(i : integer) return std_logic is
  begin
      if i = 0 then return '0';
      else return '1';
      end if;
  end function;
begin

  -- Instantiate the Wrapper (UUT)
  uut : entity work.dip_74s139
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
  ref : entity work.sn74139
    port map (
      g1   => p1,
      a1   => p2,
      b1   => p3,
      g1y0 => g1y0,
      g1y1 => g1y1,
      g1y2 => g1y2,
      g1y3 => g1y3,
      g2y0 => g2y0,
      g2y1 => g2y1,
      g2y2 => g2y2,
      g2y3 => g2y3,
      a2   => p14,
      b2   => p13,
      g2   => p15
      );

  stim_proc : process
    procedure pulse(signal g, a, b : inout std_logic) is
    begin
      for i in 0 to 1 loop
        for j in 0 to 1 loop
          a <= to_std_logic(i);
          b <= to_std_logic(j);
          g <= '0';
          wait for 10 ns;
          assert p4 = g1y0 and p5 = g1y1 and p6 = g1y2 and p7 = g1y3 and p9 = g2y3 and p10 = g2y2 and p11 = g2y1 and p12 = g2y0 report "Active state failed" severity error;
          g <= '1';
          wait for 10 ns;
          assert p4 = g1y0 and p5 = g1y1 and p6 = g1y2 and p7 = g1y3 and p9 = g2y3 and p10 = g2y2 and p11 = g2y1 and p12 = g2y0 report "Disabled state failed" severity error;
        end loop;
      end loop;
    end procedure pulse;
  begin
    -- report "Starting test for dip_74s139";
    pulse(p1, p2, p3);
    pulse(p15, p14, p13);
    -- report "Test finished for dip_74s139";
    wait;
  end process;

end architecture; 