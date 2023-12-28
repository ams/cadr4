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
begin

  process (clk)
  begin
    if rising_edge(clk) then
      q   <= d;
      q_n <= not d;
    end if;
  end process;

end;
