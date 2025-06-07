library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dip_74s153_tb is
end entity;

architecture behavior of dip_74s153_tb is
  -- UUT signals
  signal p1, p2, p3, p4, p5, p6, p10, p11, p12, p13, p14, p15 : std_logic;
  signal p7, p9 : std_logic;

  -- REF signals
  signal g1y, g2y : std_logic;

  function to_std_logic(i : integer) return std_logic is
  begin
    if i = 0 then return '0';
    else return '1';
    end if;
  end function;

  procedure check_outputs(
    signal uut_q1, uut_q2, ref_q1, ref_q2 : in std_logic
  ) is
  begin
    wait for 10 ns;
    assert uut_q1 = ref_q1 and uut_q2 = ref_q2 report "Output mismatch" severity error;
  end;

begin

  -- Instantiate the Wrapper (UUT)
  uut : entity work.dip_74s153
    port map (
      p1  => p1, p2  => p2, p3  => p3, p4  => p4,
      p5  => p5, p6  => p6, p7  => p7, p9  => p9,
      p10 => p10, p11 => p11, p12 => p12, p13 => p13,
      p14 => p14, p15 => p15
    );

  -- Instantiate the actual TTL component (REF)
  ref : entity work.sn74153
    port map (
      sela   => p14,
      selb   => p2,
      enb1_n => p1,
      g1c0   => p6,
      g1c1   => p5,
      g1c2   => p4,
      g1c3   => p3,
      g1y    => g1y,
      enb2_n => p15,
      g2c0   => p10,
      g2c1   => p11,
      g2c2   => p12,
      g2c3   => p13,
      g2y    => g2y
    );

  stim_proc : process
  begin
    report "Starting test for dip_74s153";

    -- Iterate through all control signals
    for sel_b in 0 to 1 loop
      for sel_a in 0 to 1 loop
        for enb1 in 0 to 1 loop
          for enb2 in 0 to 1 loop
            p14 <= to_std_logic(sel_a);
            p2  <= to_std_logic(sel_b);
            p1  <= to_std_logic(enb1);
            p15 <= to_std_logic(enb2);

            -- Iterate through all data inputs
            for i in 0 to 255 loop
              p6  <= to_std_logic((i / 1) mod 2);
              p5  <= to_std_logic((i / 2) mod 2);
              p4  <= to_std_logic((i / 4) mod 2);
              p3  <= to_std_logic((i / 8) mod 2);
              p10 <= to_std_logic((i / 16) mod 2);
              p11 <= to_std_logic((i / 32) mod 2);
              p12 <= to_std_logic((i / 64) mod 2);
              p13 <= to_std_logic((i / 128) mod 2);
              check_outputs(p7, p9, g1y, g2y);
            end loop;
          end loop;
        end loop;
      end loop;
    end loop;

    report "Test finished for dip_74s153";
    wait;
  end process;

end architecture; 