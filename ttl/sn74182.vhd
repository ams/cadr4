-- Look-Ahead Carry Generators
-- SN74182 Look-Ahead Carry Generator
-- Datasheet: Texas Instruments SN54S182, SN74S182 Look-Ahead Carry Generators, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN54S182
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

entity sn74182 is
  port (
    xout : out std_logic;
    yout : out std_logic;
    x3   : in  std_logic := 'H';
    y3   : in  std_logic := 'H';

    cout2_n : out std_logic;
    x2      : in  std_logic := 'H';
    y2      : in  std_logic := 'H';

    cout1_n : out std_logic;
    x1      : in  std_logic := 'H';
    y1      : in  std_logic := 'H';

    cout0_n : out std_logic;
    x0      : in  std_logic := 'H';
    y0      : in  std_logic := 'H';

    cin_n : in std_logic := 'H'
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
