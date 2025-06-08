library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;

use work.sn74.all;

entity dip_74s182_tb is
end entity;

architecture test of dip_74s182_tb is

  -- dip_74s182 signals
  signal p1_dip  : std_logic;
  signal p2_dip  : std_logic;
  signal p3_dip  : std_logic;
  signal p4_dip  : std_logic;
  signal p5_dip  : std_logic;
  signal p6_dip  : std_logic;
  signal p7_dip  : std_logic;
  signal p9_dip  : std_logic;
  signal p10_dip : std_logic;
  signal p11_dip : std_logic;
  signal p12_dip : std_logic;
  signal p13_dip : std_logic;
  signal p14_dip : std_logic;
  signal p15_dip : std_logic;

  -- sn74182 signals
  signal xout_ttl    : std_logic;
  signal yout_ttl    : std_logic;
  signal cout2_n_ttl : std_logic;
  signal cout1_n_ttl : std_logic;
  signal cout0_n_ttl : std_logic;
  signal x0_ttl      : std_logic;
  signal y0_ttl      : std_logic;
  signal x1_ttl      : std_logic;
  signal y1_ttl      : std_logic;
  signal x2_ttl      : std_logic;
  signal y2_ttl      : std_logic;
  signal x3_ttl      : std_logic;
  signal y3_ttl      : std_logic;
  signal cin_n_ttl   : std_logic;

  constant DELAY : time := 15 ns;
  signal test_finished : boolean := false;

begin

  -- Instantiate wrapper
  U_dip_74s182 : dip_74s182
    port map (
      p1  => p1_dip,
      p2  => p2_dip,
      p3  => p3_dip,
      p4  => p4_dip,
      p5  => p5_dip,
      p6  => p6_dip,
      p7  => p7_dip,
      p9  => p9_dip,
      p10 => p10_dip,
      p11 => p11_dip,
      p12 => p12_dip,
      p13 => p13_dip,
      p14 => p14_dip,
      p15 => p15_dip
      );

  -- Instantiate original component
  U_sn74182 : sn74182
    port map (
      xout    => xout_ttl,
      yout    => yout_ttl,
      cout2_n => cout2_n_ttl,
      cout1_n => cout1_n_ttl,
      cout0_n => cout0_n_ttl,
      x0      => x0_ttl,
      y0      => y0_ttl,
      x1      => x1_ttl,
      y1      => y1_ttl,
      x2      => x2_ttl,
      y2      => y2_ttl,
      x3      => x3_ttl,
      y3      => y3_ttl,
      cin_n   => cin_n_ttl
      );

  -- Connect dip and ttl component inputs
  p1_dip  <= y1_ttl;
  p2_dip  <= x1_ttl;
  p3_dip  <= y0_ttl;
  p4_dip  <= x0_ttl;
  p5_dip  <= y3_ttl;
  p6_dip  <= x3_ttl;
  p13_dip <= cin_n_ttl;
  p14_dip <= y2_ttl;
  p15_dip <= x2_ttl;

  -- Verification process
  process
  begin
    wait for 1 ns;
    assert p7_dip  = xout_ttl    report "p7 mismatch"  severity failure;
    assert p9_dip  = cout2_n_ttl report "p9 mismatch"  severity failure;
    assert p10_dip = yout_ttl    report "p10 mismatch" severity failure;
    assert p11_dip = cout1_n_ttl report "p11 mismatch" severity failure;
    assert p12_dip = cout0_n_ttl report "p12 mismatch" severity failure;
    wait;
  end process;

  -- Stimulus process
  process
    variable slv : std_logic_vector(0 downto 0);
  begin
    for cin in 0 to 1 loop
      for x0 in 0 to 1 loop
        for y0 in 0 to 1 loop
          for x1 in 0 to 1 loop
            for y1 in 0 to 1 loop
              for x2 in 0 to 1 loop
                for y2 in 0 to 1 loop
                  for x3 in 0 to 1 loop
                    for y3 in 0 to 1 loop
                      slv       := std_logic_vector(to_unsigned(cin, 1));
                      cin_n_ttl <= not slv(0);
                      slv    := std_logic_vector(to_unsigned(x0, 1));
                      x0_ttl    <= slv(0);
                      slv    := std_logic_vector(to_unsigned(y0, 1));
                      y0_ttl    <= slv(0);
                      slv    := std_logic_vector(to_unsigned(x1, 1));
                      x1_ttl    <= slv(0);
                      slv    := std_logic_vector(to_unsigned(y1, 1));
                      y1_ttl    <= slv(0);
                      slv    := std_logic_vector(to_unsigned(x2, 1));
                      x2_ttl    <= slv(0);
                      slv    := std_logic_vector(to_unsigned(y2, 1));
                      y2_ttl    <= slv(0);
                      slv    := std_logic_vector(to_unsigned(x3, 1));
                      x3_ttl    <= slv(0);
                      slv    := std_logic_vector(to_unsigned(y3, 1));
                      y3_ttl    <= slv(0);
                      wait for DELAY;
                    end loop;
                  end loop;
                end loop;
              end loop;
            end loop;
          end loop;
        end loop;
      end loop;
    end loop;

    -- report "dip_74s182_tb finished.";
    test_finished <= true;
    wait;
  end process;

end architecture; 