-- SN74260: Dual 5-Input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn74260 is
  port (
    g1a   : in  std_logic := 'H'; -- Pin 2
    g1b   : in  std_logic := 'H'; -- Pin 3
    g1c   : in  std_logic := 'H'; -- Pin 4
    g1d   : in  std_logic := 'H'; -- Pin 5
    g1e   : in  std_logic := 'H'; -- Pin 6
    g1y_n : out std_logic; -- Pin 1

    g2a   : in  std_logic := 'H'; -- Pin 8
    g2b   : in  std_logic := 'H'; -- Pin 9
    g2c   : in  std_logic := 'H'; -- Pin 10
    g2d   : in  std_logic := 'H'; -- Pin 11
    g2e   : in  std_logic := 'H'; -- Pin 12
    g2y_n : out std_logic  -- Pin 13
    );
end;

architecture ttl of sn74260 is
begin

  g1y_n <= not (g1a or g1b or g1c or g1d or g1e);
  g2y_n <= not (g2a or g2b or g2c or g2d or g2e);

end architecture;
