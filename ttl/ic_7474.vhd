library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_7474 is
  port (
    g1r_n : in  std_logic;
    g1d   : in  std_logic;
    g1clk : in  std_logic;
    g1s_n : in  std_logic;
    g1q   : out std_logic;
    g1q_n : out std_logic;
    g2q_n : out std_logic;
    g2q   : out std_logic;
    g2s_n : in  std_logic;
    g2clk : in  std_logic;
    g2d   : in  std_logic;
    g2r_n : in  std_logic
    );
end ic_7474;

architecture ttl of ic_7474 is
begin

end ttl;
