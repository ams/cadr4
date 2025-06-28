-- Look-Ahead Carry Generators
-- SN74182 Look-Ahead Carry Generator

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn74182 is
  port (
    xout    : out std_logic;
    yout    : out std_logic;
    cout2_n : out std_logic;
    cout1_n : out std_logic;
    cout0_n : out std_logic;

    x3      : in  std_logic;
    y3      : in  std_logic;
    x2      : in  std_logic;
    y2      : in  std_logic;
    x1      : in  std_logic;
    y1      : in  std_logic;
    x0      : in  std_logic;
    y0      : in  std_logic;

    cin_n   : in std_logic
    );
end;

-- Architecture based on 74182 datasheet equations
architecture functional of sn74182 is
  -- Input conditioning signals
  signal x3_i, y3_i, x2_i, y2_i, x1_i, y1_i, x0_i, y0_i, cin_n_i : std_logic;
begin
  -- Input conditioning
  x3_i <= ttl_input(x3);
  y3_i <= ttl_input(y3);
  x2_i <= ttl_input(x2);
  y2_i <= ttl_input(y2);
  x1_i <= ttl_input(x1);
  y1_i <= ttl_input(y1);
  x0_i <= ttl_input(x0);
  y0_i <= ttl_input(y0);
  cin_n_i <= ttl_input(cin_n);

  -- equations are from TI 74182 datasheet

  -- Pay attention, in the datasheet, for active-high (X,Y) equations
  -- Cn on the right hand side is actually Cn_bar, I think it is a typo.
  -- This can be verified by applying de morgan's law to the P, G equations.

  -- Carry (active-low, Cout_bar) outputs
  -- C_bar(n+x) = not (Y0 (X0 + Cn_bar))
  -- if you apply de morgan's law to Cn+x equation, this is the same.
  cout0_n <= y0_i and (x0_i or cin_n_i);
  cout1_n <= y1_i and (x1_i or (y0_i and (x0_i or cin_n_i)));
  cout2_n <= y2_i and (x2_i or (y1_i and (x1_i or (y0_i and (x0_i or cin_n_i)))));

  -- Group (active-high, X, Y) outputs (from datasheet):
  -- group propagate
  -- X = X3 + X2 + X1 + X0
  -- if you apply de morgan's law to P_bar equation, this is the same.
  xout <= x3_i or x2_i or x1_i or x0_i;
  
  -- group generate
  -- Y = Y3(X3 + Y2)(X3 + X2 + Y1)(X3 + X2 + X1 + Y0)
  -- if you apply de morgan's law to G_bar equation, this is the same.
  yout <= y3_i and (x3_i or y2_i) and (x3_i or x2_i or y1_i) and (x3_i or x2_i or x1_i or y0_i);

end;
