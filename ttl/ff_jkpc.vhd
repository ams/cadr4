-- J-K Flip-Flop (with preset and clear)

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
begin

  u0 : ff_jk port map (clk => clk, j => j, k => k, q => q, q_n => q_n);

  process (pre, clr)
    variable rs : unsigned(1 downto 0);
  begin
    rs := clr & pre;
    case rs is
      when "01"   => q <= '0'; q_n <= '1';
      when "10"   => q <= '1'; q_n <= '0';
      when "11"   => null;
      when others => null;
    end case;
  end process;

end;

