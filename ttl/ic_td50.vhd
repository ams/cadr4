library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_td50 is
  port (
    input  : in  std_logic;
    o_10ns : out std_logic;
    o_20ns : out std_logic;
    o_30ns : out std_logic;
    o_40ns : out std_logic;
    o_50ns : out std_logic
    );
end ic_td50;

architecture ttl of ic_td50 is
begin

end ttl;
