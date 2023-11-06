library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm9346 is
  port (
    a5  : in  std_logic;
    a4  : in  std_logic;
    a3  : in  std_logic;
    a2  : in  std_logic;
    a1  : in  std_logic;
    a0  : in  std_logic;
    b5  : in  std_logic;
    b4  : in  std_logic;
    b3  : in  std_logic;
    b2  : in  std_logic;
    b1  : in  std_logic;
    b0  : in  std_logic;
    enb : in  std_logic;
    eq  : out std_logic
    );
end dm9346;

architecture ttl of dm9346 is
begin

end ttl;
