library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_7411 is
  port (
    g1a   : in  std_logic;
    g1b   : in  std_logic;
    g2a   : in  std_logic;
    g2b   : in  std_logic;
    g2c   : in  std_logic;
    g2y_n : out std_logic;
    g3y_n : out std_logic;
    g3a   : in  std_logic;
    g3b   : in  std_logic;
    g3c   : in  std_logic;
    g1y_n : out std_logic;
    g1c   : in  std_logic
    );
end ic_7411;

architecture ttl of ic_7411 is
begin

end ttl;
