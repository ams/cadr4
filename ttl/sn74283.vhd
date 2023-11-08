-- 4 Bit Binary Full Adders With Fast Carry

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74283 is
  port (
    c4 : out std_logic;

    a3 : in std_logic;
    a2 : in std_logic;
    a1 : in std_logic;
    a0 : in std_logic;

    s3 : out std_logic;
    s2 : out std_logic;
    s1 : out std_logic;
    s0 : out std_logic;

    b3 : in std_logic;
    b2 : in std_logic;
    b1 : in std_logic;
    b0 : in std_logic;

    c0 : in std_logic
    );
end;

architecture ttl of sn74283 is
begin

end;
