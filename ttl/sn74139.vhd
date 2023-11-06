library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74139 is
  port (
    g1   : in  std_logic;
    a1   : in  std_logic;
    b1   : in  std_logic;
    g1y0 : out std_logic;
    g1y1 : out std_logic;
    g1y2 : out std_logic;
    g1y3 : out std_logic;
    g2y3 : out std_logic;
    g2y2 : out std_logic;
    g2y1 : out std_logic;
    g2y0 : out std_logic;
    b2   : in  std_logic;
    a2   : in  std_logic;
    g2   : in  std_logic
    );
end;

architecture ttl of sn74139 is
begin

end;
