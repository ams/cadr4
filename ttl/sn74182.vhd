-- Look-Ahead Carry Generators

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74182 is
  port (
    cin_n : in std_logic;

    x0, x1, x2 : in  std_logic;
    x3         : out std_logic;

    y0, y1, y2 : in  std_logic;
    y3         : out std_logic;

    cout0_n, cout1_n, cout2_n : out std_logic;
    xout, yout                : out std_logic
    );
end;

architecture ttl of sn74182 is
begin

end;
