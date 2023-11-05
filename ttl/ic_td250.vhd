library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_td250 is
  port (
    input   : in  std_logic;
    o_50ns  : out std_logic;
    o_100ns : out std_logic;
    o_150ns : out std_logic;
    o_200ns : out std_logic;
    o_250ns : out std_logic
    );
end ic_td250;

architecture ttl of ic_td250 is
begin

end ttl;
