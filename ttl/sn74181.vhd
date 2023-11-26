-- Arithmetic Logic Units/Function Generators

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74181 is
  port (
    -- function
    S0, S1, S2, S3 : in std_logic;
    -- inputs
    A0, A1, A2, A3 : in std_logic;
    B0, B1, B2, B3 : in std_logic;
    -- mode
    M              : in std_logic;
    -- carry in
    nC_in : in std_logic;
    -- output
    F0, F1, F2, F3 : out std_logic;
    -- carry out
    nC_out : out std_logic;
    -- A = B, only valid with subtraction and no carry
    A_EQ_B    : out std_logic;
    -- more outputs
    X, Y   : out std_logic

    );
end;

architecture rtl of sn74181 is
  signal xAB3u, xAB3l, xAB2u, xAB2l, xAB1u, xAB1l, xAB0u, xAB0l, nM : std_logic;
  signal xF0, xF1, xF2, xF3, xY : std_logic;
begin
  -- these are the "middle" results, Ax and Bx upper / lower
  xAB3u <= (B3 and S3 and A3) nor (A3 and S2 and (not B3));
  xAB3l <= not (((not B3) and S1) or (S0 and B3) or (A3));
  xAB2u <= (B2 and S3 and A2) nor (A2 and S2 and (not B2));
  xAB2l <= not (((not B2) and S1) or (S0 and B2) or (A2));
  xAB1u <= (B1 and S3 and A1) nor (A1 and S2 and (not B1));
  xAB1l <= not (((not B1) and S1) or (S0 and B1) or (A1));
  xAB0u <= (B0 and S3 and A0) nor (A0 and S2 and (not B0));
  xAB0l <= not (((not B0) and S1) or (S0 and B0) or (A0));

  nM <= (not M);

  xF0 <= (xAB0u xor xAB0l) xor (nM nand nC_in);
  xF1 <= (xAB1u xor xAB1l) xor ((nC_in and xAB0u and nM) nor (xAB0l and M));
  xF2 <= (xAB2u xor xAB2l) xor (not ((nC_in and xAB0u and xAB1u and nM) or (xAB1u and xAB0l and nM) or (xAB1l and nM)));
  xF3 <= (xAB3u xor xAB3l) xor (not ((nC_in and xAB0u and xAB1u and xAB2u and nM) or (xAB1u and xAB2u and xAB0l and nM) or (xAB2u and xAB1l and nM) or (xAB2l and nM)));

  X <= not (xAB3u and xAB2u and xAB1u and xAB0u);
  xY <= not (xAB3l or (xAB3u and xAB2l) or (xAB3u and xAB2u and xAB1l) or (xAB3u and xAB2u and xAB1u and xAB0l));

  nC_out <= (not xY) or (not (not (xAB3u and xAB2u and xAB1u and xAB0u and nC_in)));
  A_EQ_B <= xF0 and xF1 and xF2 and xF3;

  F0 <= xF0;
  F1 <= xF1;
  F2 <= xF2;
  F3 <= xF3;

  Y <= xY;
end;
