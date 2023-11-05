library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_td100 is
  port (
    input   : in  std_logic;
    o_20ns  : out std_logic;
    o_40ns  : out std_logic;
    o_60ns  : out std_logic;
    o_80ns  : out std_logic;
    o_100ns : out std_logic
    );
end ic_td100;

architecture ttl of ic_td100 is
begin

end ttl;
