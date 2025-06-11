-- SN74175: Quad D-Type Flip-Flops with Clear

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.misc.all;

-- Datasheet: Texas Instruments SN74LV175A Quadruple D-Type Flip-Flops With Clear, PDIP (N) Package
-- URL: https://www.ti.com/lit/ds/symlink/sn74lv175a.pdf

entity sn74175 is
  port (
    clk   : in std_logic;
    clr_n : in std_logic;

    d0 : in std_logic;
    d1 : in std_logic;
    d2 : in std_logic;
    d3 : in std_logic;

    q0   : out std_logic;
    q0_n : out std_logic;
    q1   : out std_logic;
    q1_n : out std_logic;
    q2   : out std_logic;
    q2_n : out std_logic;
    q3   : out std_logic;
    q3_n : out std_logic
    );
end;

architecture ttl of sn74175 is
begin

  u0 : ff_dc port map (clk => clk, clr => clr_n, d => d0, q => q0, q_n => q0_n);
  u1 : ff_dc port map (clk => clk, clr => clr_n, d => d1, q => q1, q_n => q1_n);
  u2 : ff_dc port map (clk => clk, clr => clr_n, d => d2, q => q2, q_n => q2_n);
  u3 : ff_dc port map (clk => clk, clr => clr_n, d => d3, q => q3, q_n => q3_n);

end;

-- OpenAI Codex implementation
architecture behavioral of sn74175 is
begin
  process (clk, clr_n)
  begin
    if clr_n = '0' then                 -- asynchronous, active‑low clear
      q0 <= '0'; q0_n <= '1';
      q1 <= '0'; q1_n <= '1';
      q2 <= '0'; q2_n <= '1';
      q3 <= '0'; q3_n <= '1';
    elsif rising_edge(clk) then         -- load inputs on clock edge
      q0 <= d0; q0_n <= not d0;
      q1 <= d1; q1_n <= not d1;
      q2 <= d2; q2_n <= not d2;
      q3 <= d3; q3_n <= not d3;
    end if;
  end process;
end architecture;
