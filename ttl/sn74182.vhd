-- Look-Ahead Carry Generators
-- SN74182 Look-Ahead Carry Generator

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

-- Architecture based on 74182 datasheet equations
architecture iscas of sn74182 is
  -- Input conditioning signals
  signal x3_i, y3_i, x2_i, y2_i, x1_i, y1_i, x0_i, y0_i, cin_n_i : std_logic;
  signal cin : std_logic;  -- Active-high carry input
  
  -- Intermediate carry signals (active high)
  signal cout0, cout1, cout2 : std_logic;

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
  
  -- Convert active-low carry input to active-high
  cin <= not cin_n_i;

  -- Carry logic based on 74182 datasheet equations:
  -- C(n+x) = G0 + P0·Cn
  -- C(n+y) = G1 + P1·G0 + P1·P0·Cn  
  -- C(n+z) = G2 + P2·G1 + P2·P1·G0 + P2·P1·P0·Cn
  --
  -- Mapping: P0->x0, G0->y0, Cn->cin, C(n+x)->cout0, etc.
  
  cout0 <= y0_i or (x0_i and cin);
  cout1 <= y1_i or (x1_i and y0_i) or (x1_i and x0_i and cin);
  cout2 <= y2_i or (x2_i and y1_i) or (x2_i and x1_i and y0_i) or (x2_i and x1_i and x0_i and cin);

  -- Output active-low carries
  cout0_n <= not cout0;
  cout1_n <= not cout1;
  cout2_n <= not cout2;

  -- Group outputs
  -- P = P3·P2·P1·P0 (group propagate)
  xout <= x3_i and x2_i and x1_i and x0_i;
  
  -- G = G3 + P3·G2 + P3·P2·G1 + P3·P2·P1·G0 (group generate)
  yout <= y3_i or (x3_i and y2_i) or (x3_i and x2_i and y1_i) or (x3_i and x2_i and x1_i and y0_i);

end;
