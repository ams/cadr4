-- Quadruple 2-Line To 1-Line Data Selectors/Multiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74258 is
  port (
    enb_n : in std_logic
    sel   : in std_logic;

    a0, a1 : in  std_logic;
    ay     : out std_logic;

    b0, b1 : in  std_logic;
    by     : out std_logic;

    c0, c1 : in  std_logic;
    cy     : out std_logic;

    d0, d1 : in  std_logic;
    dy     : out std_logic;
    );
end;

architecture ttl of sn74258 is
begin

end;
