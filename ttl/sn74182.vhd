-- Look-Ahead Carry Generators

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74182 is
  port (
    nC, X0, Y0, X1, Y1, X2, Y2, X3, Y3 : in std_logic;
    nCOUT0, nCOUT1, nCOUT2, XOUT, YOUT : out std_logic
    );
end;

architecture rtl of sn74182 is
  signal C : std_logic;
begin
  C <= not nC;
  XOUT <= X3 or X2 or X1 or X0;
  YOUT <= (Y3 and Y2 and Y1 and Y0) or (X1 and Y3 and Y2 and Y1) or (X2 and Y3 and Y2) or (X3 and Y3);
  nCOUT2 <= not ((Y2 and Y1 and Y0 and C) or (X0 and Y2 and Y1 and Y0) or (X1 and Y2 and Y1) or (X2 and Y2));
  nCOUT1 <= not ((Y1 and Y0 and C) or (X0 and Y1 and Y0) or (X1 and Y1));
  nCOUT0 <= not ((Y0 and C) or (X0 and Y0));
end;
