-- Hex/Quadruple D-Type Flip-Flops With Clear

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ttl;
use ttl.misc.all;

entity sn74174 is
  port (
    clk   : in std_logic;
    clr_n : in std_logic;

    d1, d2, d3, d4, d5, d6 : in  std_logic;
    q1, q2, q3, q4, q5, q6 : out std_logic
    );
end;

architecture ttl of sn74174 is
begin

  u1 : ff_dc port map (clk => clk, clr => clr_n, d => d1, q => q1);
  u2 : ff_dc port map (clk => clk, clr => clr_n, d => d2, q => q2);
  u3 : ff_dc port map (clk => clk, clr => clr_n, d => d3, q => q3);
  u4 : ff_dc port map (clk => clk, clr => clr_n, d => d4, q => q4);
  u5 : ff_dc port map (clk => clk, clr => clr_n, d => d5, q => q5);
  u6 : ff_dc port map (clk => clk, clr => clr_n, d => d6, q => q6);

end;

-- OpenAI Codex implementation
architecture behavioral of sn74174 is
begin
  process (clk, clr_n)
  begin
    if clr_n = '0' then                      -- asynchronous clear
      q1 <= '0'; q2 <= '0'; q3 <= '0';
      q4 <= '0'; q5 <= '0'; q6 <= '0';
    elsif rising_edge(clk) then              -- load inputs on clock edge
      q1 <= d1; q2 <= d2; q3 <= d3;
      q4 <= d4; q5 <= d5; q6 <= d6;
    end if;
  end process;
end architecture;
