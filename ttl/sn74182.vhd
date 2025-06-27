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

architecture ttl of sn74182 is
  signal x3_i, y3_i, x2_i, y2_i, x1_i, y1_i, x0_i, y0_i, cin_n_i : std_logic;
  signal cin_i : std_logic;
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
  
  -- Convert active-low carry input to active-high for equations
  cin_i <= not cin_n_i;

  -- Carry outputs (active low) - corrected equations per datasheet
  -- Cn+x = Y0 + X0*Cn, so ~Cn+x = ~(Y0 + X0*Cn)
  cout0_n <= not (y0_i or (x0_i and cin_i));
  -- Cn+y = Y1 + X1*Y0 + X1*X0*Cn, so ~Cn+y = ~(Y1 + X1*Y0 + X1*X0*Cn)
  cout1_n <= not (y1_i or (x1_i and y0_i) or (x1_i and x0_i and cin_i));
  -- Cn+z = Y2 + X2*Y1 + X2*X1*Y0 + X2*X1*X0*Cn, so ~Cn+z = ~(Y2 + X2*Y1 + X2*X1*Y0 + X2*X1*X0*Cn)
  cout2_n <= not (y2_i or (x2_i and y1_i) or (x2_i and x1_i and y0_i) or (x2_i and x1_i and x0_i and cin_i));

  -- Group generate and propagate outputs per datasheet
  -- Y = Y3 + X3*Y2 + X3*X2*Y1 + X3*X2*X1*Y0 (expanded form of the datasheet equation)
  yout <= y3_i or (x3_i and y2_i) or (x3_i and x2_i and y1_i) or (x3_i and x2_i and x1_i and y0_i);
  -- X = X3*X2*X1*X0 (group propagate)
  xout <= x3_i and x2_i and x1_i and x0_i;
end;

-- Structural architecture based on ISCAS gate-level model
-- Implementing the exact gate structure from the ISCAS 74182.v model
architecture iscas of sn74182 is
  -- Input conditioning signals
  signal x3_i, y3_i, x2_i, y2_i, x1_i, y1_i, x0_i, y0_i, cin_n_i : std_logic;
  signal cin_i : std_logic;
  
  -- Intermediate gate signals matching ISCAS model naming exactly
  -- These correspond to the wire declarations in the ISCAS Verilog model
  signal n_42, n_43, n_44, n_45, n_46, n_47, n_48, n_49 : std_logic;
  signal n_50, n_51, n_52, n_53, n_54, n_55, n_56, n_57 : std_logic;
  signal n_58, n_59, n_60, n_61, n_62, n_63, n_64, n_65 : std_logic;
  signal n_66, n_67, n_68, n_69, n_70, n_71, n_72, n_73 : std_logic;
  signal n_74, n_75, n_76, n_77, n_78, n_79 : std_logic;

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
  cin_i <= not cin_n_i;

  -- Gate-level implementation following ISCAS model structure exactly
  -- Following the exact gate structure from the ISCAS 74182.v Verilog model
  
  -- AND gates
  n_42 <= x0_i and cin_i;
  n_43 <= x1_i and x0_i and cin_i;
  n_44 <= x2_i and x1_i and x0_i and cin_i;
  n_45 <= x3_i and x2_i and x1_i and x0_i;
  n_46 <= x1_i and y0_i;
  n_47 <= x2_i and y1_i;
  n_48 <= x2_i and x1_i and y0_i;
  n_49 <= x3_i and y2_i;
  n_50 <= x3_i and x2_i and y1_i;
  n_51 <= x3_i and x2_i and x1_i and y0_i;

  -- OR gates for carry outputs
  n_52 <= y0_i or n_42;
  n_53 <= y1_i or n_46 or n_43;
  n_54 <= y2_i or n_47 or n_48 or n_44;

  -- Group generate and propagate terms
  n_55 <= y3_i or n_49 or n_50 or n_51;

  -- NOT gates for active-low outputs
  cout0_n <= not n_52;
  cout1_n <= not n_53;
  cout2_n <= not n_54;

  -- Group outputs
  xout <= n_45;  -- Group propagate
  yout <= n_55;  -- Group generate

end;
