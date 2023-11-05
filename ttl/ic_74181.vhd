library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_74181 is
  port (
    cout_n : out std_logic;
    y      : out std_logic;
    x      : out std_logic;
    aeb    : out std_logic;

    f3 : out std_logic;
    f2 : out std_logic;
    f1 : out std_logic;
    f0 : out std_logic;

    b3 : in std_logic;
    b2 : in std_logic;
    b1 : in std_logic;
    b0 : in std_logic;

    a3 : in std_logic;
    a2 : in std_logic;
    a1 : in std_logic;
    a0 : in std_logic;

    m  : in std_logic;
    s3 : in std_logic;
    s2 : in std_logic;
    s1 : in std_logic;
    s0 : in std_logic;

    cin_n : in std_logic
    );
end ic_74181;

architecture ttl of ic_74181 is
begin

end ttl;
