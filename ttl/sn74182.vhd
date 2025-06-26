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
use work.misc.all;

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
  signal x3_i, y3_i, x2_i, y2_i, x1_i, y1_i, x0_i, y0_i, cin_n_i : std_logic;
begin

  x3_i <= ttl_input(x3);
  y3_i <= ttl_input(y3);
  x2_i <= ttl_input(x2);
  y2_i <= ttl_input(y2);
  x1_i <= ttl_input(x1);
  y1_i <= ttl_input(y1);
  x0_i <= ttl_input(x0);
  y0_i <= ttl_input(y0);
  cin_n_i <= ttl_input(cin_n);

  -- Carry outputs (active low)
  cout0_n <= not (y0_i or (x0_i and cin_n_i));
  cout1_n <= not (y1_i or (x1_i and y0_i) or (x1_i and x0_i and cin_n_i));
  cout2_n <= not (y2_i or (x2_i and y1_i) or (x2_i and x1_i and y0_i) or (x2_i and x1_i and x0_i and cin_n_i));

  -- Group generate (yout) and propagate (xout) per datasheet, active high
  yout <= y3_i or (x3_i and y2_i) or (x3_i and x2_i and y1_i) or (x3_i and x2_i and x1_i and y0_i);
  xout <= x3_i and x2_i and x1_i and x0_i;
end;
