library ieee;
use ieee.std_logic_1164.all;

entity dip_74s151_tb is
end entity;

architecture behavior of dip_74s151_tb is
  -- UUT signals
  signal s_p5, s_p6 : std_logic;
  signal s_p1, s_p2, s_p3, s_p4, s_p7, s_p9, s_p10, s_p11, s_p12, s_p13, s_p14, s_p15 : std_logic;

  -- REF signals
  signal s_q, s_q_n : std_logic;

  function to_std_logic(i : integer) return std_logic is
  begin
      if i = 0 then return '0';
      else return '1';
      end if;
  end function;

  procedure set_inputs(
    signal p1, p2, p3, p4, p12, p13, p14, p15 : out std_logic;
    i_vec : in std_logic_vector(7 downto 0)) is
  begin
    p4  <= i_vec(0);
    p3  <= i_vec(1);
    p2  <= i_vec(2);
    p1  <= i_vec(3);
    p15 <= i_vec(4);
    p14 <= i_vec(5);
    p13 <= i_vec(6);
    p12 <= i_vec(7);
  end procedure;

  procedure check_outputs(
    signal uut_q, uut_q_n, ref_q, ref_q_n : in std_logic
  ) is
  begin
      wait for 10 ns;
      assert uut_q = ref_q and uut_q_n = ref_q_n report "Output mismatch" severity error;
  end;

  component sn74151 is
    port (
      i0, i1, i2, i3, i4, i5, i6, i7 : in    std_logic;
      sel0, sel1, sel2                : in    std_logic;
      ce_n                            : in    std_logic;
      strobe_n                        : in    std_logic;
      y, y_n                          : out   std_logic
      );
  end component;

begin

  -- Instantiate the Wrapper (UUT)
  uut : entity work.dip_74s151
    port map (
      p1  => s_p1,
      p2  => s_p2,
      p3  => s_p3,
      p4  => s_p4,
      p5  => s_p5,
      p6  => s_p6,
      p7  => s_p7,
      p9  => s_p9,
      p10 => s_p10,
      p11 => s_p11,
      p12 => s_p12,
      p13 => s_p13,
      p14 => s_p14,
      p15 => s_p15
      );

  -- Instantiate the actual TTL component (REF)
  ref : entity work.sn74151
    port map (
      s_p4, s_p3, s_p2, s_p1, s_p15, s_p14, s_p13, s_p12,
      s_p11, s_p10, s_p9,
      s_p7,
      s_q,
      s_q_n
      );

  stim_proc : process
    variable i_vec : std_logic_vector(7 downto 0);
  begin
    -- report "Starting test for dip_74s151";

    -- Test with strobe high (outputs should be low/high)
    s_p7 <= '1';
    set_inputs(s_p1, s_p2, s_p3, s_p4, s_p12, s_p13, s_p14, s_p15, "00000000");
    check_outputs(s_p5, s_p6, s_q, s_q_n);

    -- Test with strobe low
    s_p7 <= '0';
    for sel_int in 0 to 7 loop
        s_p11 <= to_std_logic(sel_int mod 2);
        s_p10 <= to_std_logic((sel_int / 2) mod 2);
        s_p9 <= to_std_logic((sel_int / 4) mod 2);
        
        -- test with selected input high
        i_vec := (others => '0');
        i_vec(sel_int) := '1';
        set_inputs(s_p1, s_p2, s_p3, s_p4, s_p12, s_p13, s_p14, s_p15, i_vec);
        check_outputs(s_p5, s_p6, s_q, s_q_n);

        -- test with selected input low
        i_vec := (others => '1');
        i_vec(sel_int) := '0';
        set_inputs(s_p1, s_p2, s_p3, s_p4, s_p12, s_p13, s_p14, s_p15, i_vec);
        check_outputs(s_p5, s_p6, s_q, s_q_n);
    end loop;

    -- report "Test finished for dip_74s151";
    wait;
  end process;

end architecture; 