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
end;

architecture ttl of ff_jk is
begin

  process (clk) is
    variable jk  : unsigned(1 downto 0);
    variable q_i : std_logic;
  begin
    if rising_edge(clk) then
      jk := j & k;
      case jk is
        when "01"   => q_i := '0';
        when "10"   => q_i := '1';
        when "11"   => q_i := not q_i;
        when others => null;
      end case;
    end if;
    q   <= q_i;
    q_n <= not q_i;
  end process;

end;
