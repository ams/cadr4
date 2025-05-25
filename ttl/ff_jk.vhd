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
  signal q_int : std_logic := '0';
begin

  q <= q_int;
  q_n <= not q_int;

  process (clk) is
    variable jk : std_logic_vector(1 downto 0);
  begin
    if rising_edge(clk) then
      jk := j & k;
      case jk is
        when "01"   => q_int <= '0';
        when "10"   => q_int <= '1';
        when "11"   => q_int <= not q_int;
        when others => null;
      end case;
    end if;
  end process;

end;
