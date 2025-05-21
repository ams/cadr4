-- D Flip-Flop (with clear)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ff_dc is
  port (
    clk    : in  std_logic;
    clr    : in  std_logic;
    d      : in  std_logic;
    q, q_n : out std_logic
    );
end;

-- ChatGPT Codex implementation
architecture ttl of ff_dc is
begin
  process(clk, clr)
  begin
    if clr = '0' then
      q <= '0';
      q_n <= '1';
    elsif rising_edge(clk) then
      q <= d;
      q_n <= not d;
    end if;
  end process;
end;
