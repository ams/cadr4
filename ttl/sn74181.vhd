-- Arithmetic Logic Units/Function Generators

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74181 is
  port (
    cin_n : in std_logic;

    f0, f1, f2, f3 : out std_logic;

    a0, a1, a2, a3 : in std_logic;
    b0, b1, b2, b3 : in std_logic;

    m              : in std_logic;
    s0, s1, s2, s3 : in std_logic;

    cout_n : out std_logic;
    aeb    : out std_logic;
    x, y   : out std_logic
    );
end;

architecture ttl of sn74181 is
begin

end;
