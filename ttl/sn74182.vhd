-- Look-Ahead Carry Generators

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74182 is
  port (
    xout : out std_logic;
    yout : out std_logic;
    x3   : in  std_logic;
    y3   : in  std_logic;

    cout2_n : out std_logic;
    x2      : in  std_logic;
    y2      : in  std_logic;

    cout1_n : out std_logic;
    x1      : in  std_logic;
    y1      : in  std_logic;

    cout0_n : out std_logic;
    x0      : in  std_logic;
    y0      : in  std_logic;

    cin_n : in std_logic
    );
end;

architecture ttl of sn74182 is
begin
  -- Carry outputs (active low)
  cout0_n <= not (y0 or (x0 and not cin_n));
  cout1_n <= not (y1 or (x1 and y0) or (x1 and x0 and not cin_n));
  cout2_n <= not (y2 or (x2 and y1) or (x2 and x1 and y0) or (x2 and x1 and x0 and not cin_n));

  -- Group generate (yout) and propagate (xout) per datasheet, active high
  yout <= y3 or (x3 and y2) or (x3 and x2 and y1) or (x3 and x2 and x1 and y0);
  xout <= x3 and x2 and x1 and x0;
end;
