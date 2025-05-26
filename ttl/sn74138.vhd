-- 3-Line To 8-Line Decoders/Demultiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74138 is
  port (
    a, b, c      : in std_logic;
    g1, g2a, g2b : in std_logic;
    y0, y1, y2, y3, y4, y5, y6, y7 : out std_logic
    );
end;

architecture ttl of sn74138 is
  signal y : std_logic_vector(7 downto 0);
begin

  process (a, b, c, g1, g2a, g2b) is
    variable sel : integer range 0 to 7;
  begin
    if g1 = '1' and g2a = '0' and g2b = '0' then
      sel := to_integer(unsigned(std_logic_vector'(a & b & c)));
      y <= (others => '1');
      y(sel) <= '0';
    else
      y <= (others => '1');
    end if;
  end process;

  y0 <= y(0); y1 <= y(1); y2 <= y(2); y3 <= y(3);
  y4 <= y(4); y5 <= y(5); y6 <= y(6); y7 <= y(7);

end architecture;
