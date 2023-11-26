--- Arithmetic Logic Units/Function Generators
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74181 is
  port (
    -- function
    S : in std_logic_vector (3 downto 0);
    -- inputs
    A : in std_logic_vector (3 downto 0);
    B : in std_logic_vector (3 downto 0);
    -- mode
    M              : in std_logic;
    -- carry in
    nC_in : in std_logic;
    -- output
    F : out std_logic_vector (3 downto 0);
    -- carry out
    nC_out : out std_logic;
    -- A = B, only valid with subtraction and no carry
    A_EQ_B    : out std_logic;
    -- more carry outputs
    X, Y   : out std_logic

    );
end;

architecture rtl of sn74181 is
  signal xAB3u, xAB3l, xAB2u, xAB2l, xAB1u, xAB1l, xAB0u, xAB0l, nM : std_logic;
  signal xF0, xF1, xF2, xF3, xY : std_logic;
begin
  -- these are the "middle" results, Ax and Bx upper / lower
  xAB3u <= (B(3) and S(3) and A(3)) nor (A(3) and S(2) and (not B(3)));
  xAB3l <= not (((not B(3)) and S(1)) or (S(0) and B(3)) or A(3));
  xAB2u <= (B(2) and S(3) and A(2)) nor (A(2) and S(2) and (not B(2)));
  xAB2l <= not (((not B(2)) and S(1)) or (S(0) and B(2)) or A(2));
  xAB1u <= (B(1) and S(3) and A(1)) nor (A(1) and S(2) and (not B(1)));
  xAB1l <= not (((not B(1)) and S(1)) or (S(0) and B(1)) or (A(1)));
  xAB0u <= (B(0) and S(3) and A(0)) nor (A(0) and S(2) and (not B(0)));
  xAB0l <= not (((not B(0)) and S(1)) or (S(0) and B(0)) or A(0));

  nM <= (not M);

  xF0 <= (xAB0u xor xAB0l) xor (nM nand nC_in);
  xF1 <= (xAB1u xor xAB1l) xor ((nC_in and xAB0u and nM) nor (xAB0l and nM));
  xF2 <= (xAB2u xor xAB2l) xor (not ((nC_in and xAB0u and xAB1u and nM) or (xAB1u and xAB0l and nM) or (xAB1l and nM)));
  xF3 <= (xAB3u xor xAB3l) xor (not ((nC_in and xAB0u and xAB1u and xAB2u and nM) or (xAB1u and xAB2u and xAB0l and nM) or (xAB2u and xAB1l and nM) or (xAB2l and nM)));

  X <= not (xAB3u and xAB2u and xAB1u and xAB0u);
  xY <= not (xAB3l or (xAB3u and xAB2l) or (xAB3u and xAB2u and xAB1l) or (xAB3u and xAB2u and xAB1u and xAB0l));

  nC_out <= (not xY) or (not (not (xAB3u and xAB2u and xAB1u and xAB0u and nC_in)));
  A_EQ_B <= xF0 and xF1 and xF2 and xF3;

  F(0) <= xF0;
  F(1) <= xF1;
  F(2) <= xF2;
  F(3) <= xF3;

  Y <= xY;
end;
