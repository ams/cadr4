-- Look-Ahead Carry Generators
-- SN74182 Look-Ahead Carry Generator
--
-- Timing specifications (typical at VCC=5V, TA=25°C):
-- - Propagation delay (X,Y to COUT): 12ns
-- - Propagation delay (CIN to COUT): 12ns
-- - Propagation delay (X,Y to XOUT,YOUT): 12ns
-- - Propagation delay (CIN to XOUT,YOUT): 12ns
--
-- Power dissipation: 45mW typical

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This is a Look-Ahead Carry Generator
entity sn74182 is
  port (
    xout    : out std_logic; -- Pin 7 (Carry Propagate Output P)
    yout    : out std_logic; -- Pin 10 (Carry Generate Output G)
    x3      : in  std_logic; -- Pin 6 (Carry Propagate Input P3)
    y3      : in  std_logic; -- Pin 5 (Carry Generate Input G3)

    cout2_n : out std_logic; -- Pin 9 (Carry Output Cn+2 Active Low)
    x2      : in  std_logic; -- Pin 15 (Carry Propagate Input P2)
    y2      : in  std_logic; -- Pin 14 (Carry Generate Input G2)

    cout1_n : out std_logic; -- Pin 11 (Carry Output Cn+y Active Low)
    x1      : in  std_logic; -- Pin 2 (Carry Propagate Input P1)
    y1      : in  std_logic; -- Pin 1 (Carry Generate Input G1)

    cout0_n : out std_logic; -- Pin 12 (Carry Output Cn+x Active Low)
    x0      : in  std_logic; -- Pin 4 (Carry Propagate Input P0)
    y0      : in  std_logic; -- Pin 3 (Carry Generate Input G0)

    cin_n   : in std_logic -- Pin 13 (Carry Input Cn Active Low)
    );
end;

architecture ttl of sn74182 is
begin
  -- Carry outputs (active low)
  cout0_n <= not (y0 or (x0 and cin_n));
  cout1_n <= not (y1 or (x1 and y0) or (x1 and x0 and cin_n));
  cout2_n <= not (y2 or (x2 and y1) or (x2 and x1 and y0) or (x2 and x1 and x0 and cin_n));

  -- Group generate (yout) and propagate (xout) per datasheet, active high
  yout <= y3 or (x3 and y2) or (x3 and x2 and y1) or (x3 and x2 and x1 and y0);
  xout <= x3 and x2 and x1 and x0;
end;
