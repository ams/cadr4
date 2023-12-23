-- 1024 X 1 Bit TTL Bipolar IMOX(TM) RAM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am93425a is
  port (
    a0, a1, a2, a3, a4, a5, a6, a7, a8, a9 : in  std_logic;
    ce_n                                   : in  std_logic;
    we_n                                   : in  std_logic;
    di                                     : in  std_logic;
    do                                     : out std_logic
    );
end am93425a;

architecture ttl of am93425a is
begin

end;
