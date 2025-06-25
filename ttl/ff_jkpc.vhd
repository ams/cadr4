-- J-K Flip-Flop (with preset and clear)
-- No external pins to verify against a datasheet as this is a custom VHDL component.

-- 'pre' and 'clr' are active-low asynchronous inputs. When both are
-- high, the flip-flop retains its previous state.

library ieee;
use ieee.std_logic_1164.all;

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

  q  <= q_int;
  -- Proper complement handling for unknown states
  q_n <= '0' when q_int = '1' else
         '1' when q_int = '0' else
         'X';  -- Unknown complement for X, U, Z, W states

  process (clk, pre, clr)
    variable jk : std_logic_vector(1 downto 0);
  begin
    -- conflicting inputs ?
    if to_x01(pre) = '0' and to_x01(clr) = '0' then
      q_int <= 'X';
    -- preset
    elsif to_x01(pre) = '0' then
      q_int <= '1';  -- Preset to 1
    elsif to_x01(pre) = 'X' then
      q_int <= 'X';
    -- clear
    elsif to_x01(clr) = '0' then
      q_int <= '0';  -- Clear to 0
    elsif to_x01(clr) = 'X' then
      q_int <= 'X';
    -- Handle clock edges
    elsif clk'event then
      if is_x(clk) or is_x(clk'last_value) then
        -- Clock transition involving metavalue - output becomes unknown
        q_int <= 'X';
      elsif clk = '1' and clk'last_value = '0' then
        -- Valid rising edge
        jk := j & k;
        case jk is
          when "00"   => null;           -- Hold state
          when "01"   => q_int <= '0';   -- Reset
          when "10"   => q_int <= '1';   -- Set
          when "11"   =>                 -- Toggle
            if q_int = '1' then
              q_int <= '0';
            elsif q_int = '0' then
              q_int <= '1';
            else
              -- If current state is unknown (U, X, Z, etc.), toggle produces unknown
              q_int <= 'X';
            end if;
          when others => q_int <= 'X';   -- Should not happen with above check
        end case;
      end if;
    end if;
  end process;

end;

