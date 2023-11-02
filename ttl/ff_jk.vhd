-- J-K Flip-Flop

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ff_jk is
  port (
    clk    : in  std_logic;
    j, k   : in  std_logic;
    q, q_n : out std_logic
    );
end entity;

architecture ttl of ff_jk is
begin

  process (clk) is
    variable jk : unsigned(1 downto 0);
  begin
    if rising_edge(clk) then
      jk := j & k;
      case jk is
        when "01"   => q <= '0';   q_n <= '1';
        when "10"   => q <= '1';   q_n <= '0';
        when "11"   => q <= not q; q_n <= q;
        when others => null;
      end case;
    end if;
  end process;

end architecture;
