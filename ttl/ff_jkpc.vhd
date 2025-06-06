-- J-K Flip-Flop (with preset and clear)
-- No external pins to verify against a datasheet as this is a custom VHDL component.

-- 'pre' and 'clr' are active-low asynchronous inputs. When both are
-- high, the flip-flop retains its previous state.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ttl;
use ttl.misc.all;

entity ff_jkpc is
  port (
    clk      : in  std_logic;
    pre, clr : in  std_logic;
    j, k     : in  std_logic;
    q, q_n   : out std_logic
    );
end;

architecture ttl of ff_jkpc is
  signal q_int : std_logic := '0';
begin

  q <= q_int;
  q_n <= not q_int;

  process (clk, pre, clr)
    variable jk : std_logic_vector(1 downto 0);
  begin
    if pre = '0' then
      q_int <= '1';
    elsif clr = '0' then
      q_int <= '0';
    elsif rising_edge(clk) then
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

