library ieee;
use ieee.std_logic_1164.all;

entity dip_74s138_tb is
end entity;

architecture behavior of dip_74s138_tb is
  -- UUT signals
  signal p7, p9, p10, p11, p12, p13, p14, p15 : std_logic;
  signal p1, p2, p3, p4, p5, p6               : std_logic;

  -- REF signals
  signal y0, y1, y2, y3, y4, y5, y6, y7 : std_logic;
begin

  -- Instantiate the Wrapper (UUT)
  uut : entity work.dip_74s138
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
  ref : entity work.sn74138
    port map (
      a  => p1,
      b  => p2,
      c  => p3,
      g1 => p6,
      g2a => p4,
      g2b => p5,
      y0 => y0,
      y1 => y1,
      y2 => y2,
      y3 => y3,
      y4 => y4,
      y5 => y5,
      y6 => y6,
      y7 => y7
      );

  stim_proc : process
    function to_std_logic(i : integer) return std_logic is
    begin
      if i = 0 then return '0';
      else return '1';
      end if;
    end function;
  begin
    -- report "Starting test for dip_74s138";

    -- Iterate through all possible addresses
    for a_int in 0 to 1 loop
      for b_int in 0 to 1 loop
        for c_int in 0 to 1 loop
          p1 <= to_std_logic(a_int);
          p2 <= to_std_logic(b_int);
          p3 <= to_std_logic(c_int);

          -- Test with enables active
          p6  <= '1';
          p4  <= '0';
          p5  <= '0';
          wait for 10 ns;
          assert p7 = y7 and p9 = y6 and p10 = y5 and p11 = y4 and p12 = y3 and p13 = y2 and p14 = y1 and p15 = y0 report "Active state failed" severity error;

          -- Test with G1 disabled
          p6 <= '0';
          wait for 10 ns;
          assert p7 = y7 and p9 = y6 and p10 = y5 and p11 = y4 and p12 = y3 and p13 = y2 and p14 = y1 and p15 = y0 report "G1 disabled failed" severity error;
          p6 <= '1';

          -- Test with G2A disabled
          p4 <= '1';
          wait for 10 ns;
          assert p7 = y7 and p9 = y6 and p10 = y5 and p11 = y4 and p12 = y3 and p13 = y2 and p14 = y1 and p15 = y0 report "G2A disabled failed" severity error;
          p4 <= '0';
          
        end loop;
      end loop;
    end loop;

    -- report "Test finished for dip_74s138";
    wait;
  end process;

end architecture; 