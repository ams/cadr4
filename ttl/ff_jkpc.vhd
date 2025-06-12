-- J-K Flip-Flop (with preset and clear)
-- No external pins to verify against a datasheet as this is a custom VHDL component.

-- 'pre' and 'clr' are active-low asynchronous inputs. When both are
-- high, the flip-flop retains its previous state.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ff_jkpc is
  port (
    clk      : in  std_logic;
    pre, clr : in  std_logic;
    j, k     : in  std_logic;
    q, q_n   : out std_logic
    );
end;

architecture ttl of ff_jkpc is
  signal q_int : std_logic := 'U';  -- Start uninitialized to model real hardware
begin

  q   <= q_int;
  -- Proper complement handling for unknown states
  q_n <= '0' when q_int = '1' else
         '1' when q_int = '0' else
         'X';  -- Unknown complement for X, U, Z, W states

  process (clk, pre, clr)
    variable jk : std_logic_vector(1 downto 0);
  begin
    -- Handle conflicting or unknown preset/clear signals
    if (pre = '0' and clr = '0') then
      q_int <= 'X';  -- Conflicting controls - undefined behavior
    elsif pre = '0' then
      q_int <= '1';  -- Preset to 1
    elsif clr = '0' then
      q_int <= '0';  -- Clear to 0
    elsif (pre /= '1' or clr /= '1') then
      q_int <= 'X';  -- Unknown control signals
    elsif rising_edge(clk) then
      -- Check for unknown J or K inputs
      if (j /= '0' and j /= '1') or (k /= '0' and k /= '1') then
        q_int <= 'X';  -- Unknown J or K input
      else
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
    elsif clk'event and is_x(clk) then
      q_int <= 'X';  -- Clock went to unknown state
    end if;
  end process;

end;

