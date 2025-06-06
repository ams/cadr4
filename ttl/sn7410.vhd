-- Tripple 3-Input Positive-NAND Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7410 is
  port (
    g1a   : in  std_logic;
    g1b   : in  std_logic;
    g1c   : in  std_logic;
    g1y_n : out std_logic;

    g2a   : in  std_logic;
    g2b   : in  std_logic;
    g2c   : in  std_logic;
    g2y_n : out std_logic;

    g3a   : in  std_logic;
    g3b   : in  std_logic;
    g3c   : in  std_logic;
    g3y_n : out std_logic
    );
end;

architecture ttl of sn7410 is
begin

  g1y_n <= not (g1a and g1b and g1c);
  g2y_n <= not (g2a and g2b and g2c);
  g3y_n <= not (g3a and g3b and g3c);

end;
