-- Quadruple 2-Line To 1-Line Data Selectors/Multiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74157 is
  port (
    enb_n : in std_logic;
    sel   : in std_logic;

    a1, a2, a3, a4 : in  std_logic;
    b1, b2, b3, b4 : in  std_logic;
    y1, y2, y3, y4 : out std_logic
    );
end;

-- OpenAI Codex implementation
architecture ttl of sn74157 is
begin
  process(all)
  begin
    if enb_n = '1' then
      y1 <= 'Z'; y2 <= 'Z'; y3 <= 'Z'; y4 <= 'Z';
    elsif sel = '0' then
      y1 <= a1; y2 <= a2; y3 <= a3; y4 <= a4;
    else
      y1 <= b1; y2 <= b2; y3 <= b3; y4 <= b4;
    end if;
  end process;
end architecture;
