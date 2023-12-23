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

architecture ttl of sn74157 is
begin

  y1 <= (sel and enb_n and a1) or (sel and enb_n and b1);
  y2 <= (sel and enb_n and a2) or (sel and enb_n and b2);
  y3 <= (sel and enb_n and a3) or (sel and enb_n and b3);
  y4 <= (sel and enb_n and a4) or (sel and enb_n and b4);

end architecture;
