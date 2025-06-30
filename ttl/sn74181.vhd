-- Arithmetic Logic Units/Function Generators
-- SN74181 4-bit Arithmetic Logic Unit

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity sn74181 is
  port (
    -- Control and status (external ports with _e suffix)
    M_e      : in  std_logic;  -- Mode: 1=Logic, 0=Arithmetic
    CNb_e    : in  std_logic;  -- Carry in (active low)
    CN4b_e   : out std_logic;  -- Carry out (active low)
    AEB_e    : out std_logic;  -- A equals B
    X_e      : out std_logic;  -- Carry propagate
    Y_e      : out std_logic;  -- Carry generate
    
    -- Function select
    S_e      : in  std_logic_vector(3 downto 0); -- S3, S2, S1, S0
    
    -- Data inputs
    A_e      : in  std_logic_vector(3 downto 0); -- A3, A2, A1, A0
    B_e      : in  std_logic_vector(3 downto 0); -- B3, B2, B1, B0
    
    -- Function outputs
    F_e      : out std_logic_vector(3 downto 0)  -- F3, F2, F1, F0
    );
end;

-- Perfect line-by-line translation from doc/ttl/74181.v
architecture structural of sn74181 is
  -- Internal signals matching Verilog exactly
  signal A, B, S : std_logic_vector(3 downto 0);
  signal M, CNb : std_logic;
  signal F : std_logic_vector(3 downto 0);
  signal CN4b, AEB, X, Y : std_logic;
  signal E, D, C, Bb : std_logic_vector(3 downto 0);
  
  -- Emodule internal signals
  signal ABS3, ABbS2 : std_logic_vector(3 downto 0);
  
  -- Dmodule internal signals
  signal BbS1, BS0 : std_logic_vector(3 downto 0);
  
  -- CLAmodule internal signals (exact Verilog names)
  signal Pb0, Pb1, Pb2, Pb3 : std_logic;
  signal CNbGb0, CNbGb01, CNbGb012 : std_logic;
  signal Pb0Gb1, Pb1Gb2, Pb2Gb3 : std_logic;
  signal Pb0Gb12, Pb1Gb23, Pb0Gb123 : std_logic;
  signal XCNb : std_logic;
  
  -- Summodule internal signals
  signal EXD, CM : std_logic_vector(3 downto 0);
  
begin

  -- Input assignments
  A <= A_e;
  B <= B_e;
  S <= S_e;
  M <= M_e;
  CNb <= CNb_e;
  
  -- Output assignments
  F_e <= F;
  CN4b_e <= CN4b;
  AEB_e <= AEB;
  X_e <= X;
  Y_e <= Y;
  
  -- Emodule: Line-by-line translation from Verilog
  -- not Bb0gate(Bb[0], B[0]);
  Bb(0) <= not B(0);
  Bb(1) <= not B(1);
  Bb(2) <= not B(2);
  Bb(3) <= not B(3);
  
  -- and ABS30gate(ABS3[0], A[0], B[0], S[3]);
  ABS3(0) <= A(0) and B(0) and S(3);
  ABS3(1) <= A(1) and B(1) and S(3);
  ABS3(2) <= A(2) and B(2) and S(3);
  ABS3(3) <= A(3) and B(3) and S(3);
  
  -- and ABbS20gate(ABbS2[0], A[0], Bb[0], S[2]);
  ABbS2(0) <= A(0) and Bb(0) and S(2);
  ABbS2(1) <= A(1) and Bb(1) and S(2);
  ABbS2(2) <= A(2) and Bb(2) and S(2);
  ABbS2(3) <= A(3) and Bb(3) and S(2);
  
  -- nor E0gate(E[0], ABS3[0], ABbS2[0]);
  E(0) <= not (ABS3(0) or ABbS2(0));
  E(1) <= not (ABS3(1) or ABbS2(1));
  E(2) <= not (ABS3(2) or ABbS2(2));
  E(3) <= not (ABS3(3) or ABbS2(3));

  -- Dmodule: Line-by-line translation from Verilog
  -- and BbS10gate(BbS1[0], Bb[0], S[1]);
  BbS1(0) <= Bb(0) and S(1);
  BbS1(1) <= Bb(1) and S(1);
  BbS1(2) <= Bb(2) and S(1);
  BbS1(3) <= Bb(3) and S(1);
  
  -- and BS00gate(BS0[0], B[0], S[0]);
  BS0(0) <= B(0) and S(0);
  BS0(1) <= B(1) and S(0);
  BS0(2) <= B(2) and S(0);
  BS0(3) <= B(3) and S(0);
  
  -- nor D0gate(D[0], BbS1[0], BS0[0], A[0]);
  D(0) <= not (BbS1(0) or BS0(0) or A(0));
  D(1) <= not (BbS1(1) or BS0(1) or A(1));
  D(2) <= not (BbS1(2) or BS0(2) or A(2));
  D(3) <= not (BbS1(3) or BS0(3) or A(3));

  -- CLAmodule: Line-by-line translation from Verilog
  -- not C0gate(C[0], CNb);
  C(0) <= not CNb;
  
  -- buf Pb0gate(Pb0, Pb[0]); -- Note: Pb = D, Gb = E in the instantiation
  Pb0 <= D(0);
  Pb1 <= D(1);
  Pb2 <= D(2);
  Pb3 <= D(3);
  
  -- and CNbGb0gate(CNbGb0, CNb, Gb[0]);
  CNbGb0 <= CNb and E(0);
  CNbGb01 <= CNb and E(0) and E(1);
  CNbGb012 <= CNb and E(0) and E(1) and E(2);
  
  -- and Pb0Gb1gate(Pb0Gb1, Pb[0], Gb[1]);
  Pb0Gb1 <= D(0) and E(1);
  Pb1Gb2 <= D(1) and E(2);
  Pb2Gb3 <= D(2) and E(3);
  
  Pb0Gb12 <= D(0) and E(1) and E(2);
  Pb1Gb23 <= D(1) and E(2) and E(3);
  Pb0Gb123 <= D(0) and E(1) and E(2) and E(3);
  
  -- nand Xgate(X, Gb[0], Gb[1], Gb[2], Gb[3]);
  X <= not (E(0) and E(1) and E(2) and E(3));
  
  -- nor Ygate(Y, Pb3,Pb2Gb3,Pb1Gb23,Pb0Gb123);
  Y <= not (Pb3 or Pb2Gb3 or Pb1Gb23 or Pb0Gb123);
  
  -- nand XCNbgate(XCNb, Gb[0], Gb[1], Gb[2], Gb[3], CNb);
  XCNb <= not (E(0) and E(1) and E(2) and E(3) and CNb);
  
  -- nand CN4bgate(CN4b, Y, XCNb);
  CN4b <= not (Y and XCNb);
  
  -- nor C3gate(C[3], Pb2, Pb1Gb2, Pb0Gb12, CNbGb012);
  C(3) <= not (Pb2 or Pb1Gb2 or Pb0Gb12 or CNbGb012);
  
  -- nor C2gate(C[2], Pb1, Pb0Gb1, CNbGb01);
  C(2) <= not (Pb1 or Pb0Gb1 or CNbGb01);
  
  -- nor C1gate(C[1], Pb0, CNbGb0);
  C(1) <= not (Pb0 or CNbGb0);

  -- Summodule: Line-by-line translation from Verilog
  -- xor EXD0gate(EXD[0], E[0], D[0]);
  EXD(0) <= E(0) xor D(0);
  EXD(1) <= E(1) xor D(1);
  EXD(2) <= E(2) xor D(2);
  EXD(3) <= E(3) xor D(3);
  
  -- or CM0gate(CM[0], C[0], M);
  CM(0) <= C(0) or M;
  CM(1) <= C(1) or M;
  CM(2) <= C(2) or M;
  CM(3) <= C(3) or M;
  
  -- xor F0gate(F[0], EXD[0], CM[0]);
  F(0) <= EXD(0) xor CM(0);
  F(1) <= EXD(1) xor CM(1);
  F(2) <= EXD(2) xor CM(2);
  F(3) <= EXD(3) xor CM(3);
  
  -- and AEBgate(AEB, F[0], F[1], F[2], F[3]);
  AEB <= F(0) and F(1) and F(2) and F(3);

end architecture;
