library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;

use work.other.all;

entity dip_2147_tb is
end entity;

architecture tb of dip_2147_tb is
  signal p1, p2, p3, p4, p5, p6, p8, p10, p11, p12, p13, p14, p15, p16, p17 : std_logic;
  signal p7 : std_logic;

  signal a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, we_n, ce_n, di : std_logic;
  signal do : std_logic;

begin

  UUT_DIP : component dip_2147
    port map (
      p1  => p1,
      p2  => p2,
      p3  => p3,
      p4  => p4,
      p5  => p5,
      p6  => p6,
      p7  => p7,
      p8  => p8,
      p10 => p10,
      p11 => p11,
      p12 => p12,
      p13 => p13,
      p14 => p14,
      p15 => p15,
      p16 => p16,
      p17 => p17
    );

  UUT_TTL : entity work.am2147
    port map (
      a0   => a0,
      a1   => a1,
      a2   => a2,
      a3   => a3,
      a4   => a4,
      a5   => a5,
      a6   => a6,
      a7   => a7,
      a8   => a8,
      a9   => a9,
      a10  => a10,
      a11  => a11,
      we_n => we_n,
      ce_n => ce_n,
      di   => di,
      do   => do
    );

  stimulus : process
    variable error_cnt : integer := 0;
  begin
    -- Write data
    for i in 0 to 10 loop
      p1  <= std_logic(to_unsigned(i, 1) (0));
      a0  <= std_logic(to_unsigned(i, 1) (0));
      p2  <= std_logic(to_unsigned(i, 2) (1));
      a1  <= std_logic(to_unsigned(i, 2) (1));
      p3  <= std_logic(to_unsigned(i, 3) (2));
      a2  <= std_logic(to_unsigned(i, 3) (2));
      p4  <= '0';
      a3  <= '0';
      p5  <= '0';
      a4  <= '0';
      p6  <= '0';
      a5  <= '0';
      p17 <= '0';
      a6  <= '0';
      p16 <= '0';
      a7  <= '0';
      p15 <= '0';
      a8  <= '0';
      p14 <= '0';
      a9  <= '0';
      p13 <= '0';
      a10 <= '0';
      p12 <= '0';
      a11 <= '0';
      p8  <= '0';
      we_n <= '0';
      p10 <= '0';
      ce_n <= '0';
      p11 <= '1';
      di <= '1';
      wait for 10 ns;
      assert p7 = do report "Data mismatch during write" severity warning;
      if p7 /= do then
        error_cnt := error_cnt + 1;
      end if;
    end loop;
    p8 <= '1';
    we_n <= '1';

    -- Read data and compare
    for i in 0 to 10 loop
      p1  <= std_logic(to_unsigned(i, 1) (0));
      a0  <= std_logic(to_unsigned(i, 1) (0));
      p2  <= std_logic(to_unsigned(i, 2) (1));
      a1  <= std_logic(to_unsigned(i, 2) (1));
      p3  <= std_logic(to_unsigned(i, 3) (2));
      a2  <= std_logic(to_unsigned(i, 3) (2));
      p4  <= '0';
      a3  <= '0';
      p5  <= '0';
      a4  <= '0';
      p6  <= '0';
      a5  <= '0';
      p17 <= '0';
      a6  <= '0';
      p16 <= '0';
      a7  <= '0';
      p15 <= '0';
      a8  <= '0';
      p14 <= '0';
      a9  <= '0';
      p13 <= '0';
      a10 <= '0';
      p12 <= '0';
      a11 <= '0';
      p10 <= '0';
      ce_n <= '0';
      wait for 10 ns;
      assert p7 = do report "Data mismatch during read" severity warning;
      if p7 /= do then
        error_cnt := error_cnt + 1;
      end if;
    end loop;

    assert error_cnt = 0 report "Test failed with " & integer'image(error_cnt) & " errors." severity failure;
    -- report "Test finished";
    wait;
  end process;

end architecture;
