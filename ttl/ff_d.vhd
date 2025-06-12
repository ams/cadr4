-- D Flip-Flop

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ff_d is
  port (
    clk    : in  std_logic;
    d      : in  std_logic;
    q, q_n : out std_logic
    );
end;

architecture ttl of ff_d is
  signal q_int : std_logic := 'U';  -- Start uninitialized to model real hardware
begin

  q   <= q_int;
  -- Proper complement handling for unknown states
  q_n <= '0' when q_int = '1' else
         '1' when q_int = '0' else
         'X';  -- Unknown complement for X, U, Z, W states

  process (clk)
  begin
    if rising_edge(clk) then
      q_int <= d;  -- Store data, including X/U values
    elsif clk'event and is_x(clk) then
      q_int <= 'X';  -- Clock went to unknown state
    end if;
  end process;

end;
