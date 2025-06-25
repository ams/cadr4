-- J-K Flip-Flop

library ieee;
use ieee.std_logic_1164.all;

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

  q  <= q_int;
  -- Proper complement handling for unknown states
  q_n <= '0' when q_int = '1' else
         '1' when q_int = '0' else
         'X';  -- Unknown complement for X, U, Z, W states

  process (clk) is
    variable jk : std_logic_vector(1 downto 0);
  begin
    if is_x(clk) then
      q_int <= 'X';
    elsif rising_edge(clk) then
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
  end process;

end;
