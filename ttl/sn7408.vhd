-- SN7408: Quadruple 2-Input Positive-AND Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7408 is
  port (
    g1a : in  std_logic;
    g1b : in  std_logic;
    g1q : out std_logic;

    g2a : in  std_logic;
    g2b : in  std_logic;
    g2q : out std_logic;

    g3a : in  std_logic;
    g3b : in  std_logic;
    g3q : out std_logic;

    g4a : in  std_logic;
    g4b : in  std_logic;
    g4q : out std_logic
    );
end;

architecture ttl of sn7408 is
begin

  g1q <= g1a and g1b;
  g2q <= g2a and g2b;
  g3q <= g3a and g3b;
  g4q <= g4a and g4b;

end;
