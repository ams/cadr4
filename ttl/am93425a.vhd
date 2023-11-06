library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am93425a is
  port (
    a0   : in  std_logic;
    a1   : in  std_logic;
    a2   : in  std_logic;
    a3   : in  std_logic;
    a4   : in  std_logic;
    a5   : in  std_logic;
    a6   : in  std_logic;
    a7   : in  std_logic;
    a8   : in  std_logic;
    a9   : in  std_logic;
    ce_n : in  std_logic;
    we_n : in  std_logic;
    di   : in  std_logic;
    do   : out std_logic
    );
end am93425a;

architecture ttl of am93425a is
begin

end ttl;
