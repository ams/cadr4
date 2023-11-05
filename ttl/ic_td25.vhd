library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_td25 is
  port (
    input  : in  std_logic;
    o_10ns : out std_logic;
    o_20ns : out std_logic;
    o_25ns : out std_logic;
    o_15ns : out std_logic;
    o_5ns  : out std_logic
    );
end ic_td25;

architecture ttl of ic_td25 is
begin

end ttl;
