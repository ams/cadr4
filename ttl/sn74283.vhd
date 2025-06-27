-- 4 Bit Binary Full Adders With Fast Carry

library ieee;
use ieee.std_logic_1164.all;

entity sn74283 is
  port (
    ci : in std_logic; -- Pin 7, C0 in Verilog
    a0 : in std_logic; -- Pin 5, A[0]
    a1 : in std_logic; -- Pin 3, A[1]
    a2 : in std_logic; -- Pin 14, A[2]
    a3 : in std_logic; -- Pin 13, A[3]
    b0 : in std_logic; -- Pin 6, B[0]
    b1 : in std_logic; -- Pin 2, B[1]
    b2 : in std_logic; -- Pin 15, B[2]
    b3 : in std_logic; -- Pin 11, B[3]
    s0 : out std_logic; -- Pin 4, S[0]
    s1 : out std_logic; -- Pin 1, S[1]
    s2 : out std_logic; -- Pin 13, S[2]
    s3 : out std_logic; -- Pin 10, S[3]
    co : out std_logic  -- Pin 9, C4
    );
end;

architecture iscas of sn74283 is
  -- GP Module signals
  signal gb : std_logic_vector(3 downto 0); -- Generate bar
  signal pb : std_logic_vector(3 downto 0); -- Propagate bar
  signal p : std_logic_vector(3 downto 0);  -- Propagate
  signal axb : std_logic_vector(3 downto 0); -- A XOR B (for sum)
  
  -- CLA Module signals
  signal c : std_logic_vector(3 downto 0); -- Internal carries
  signal c0b : std_logic; -- C0 bar
  
  -- Intermediate signals for CLA logic
  signal pb0, pb1, pb2, pb3 : std_logic;
  signal c0bgb0 : std_logic;
  signal pb0gb1, c0bgb01 : std_logic;
  signal pb1gb2, pb0gb12, c0bgb012 : std_logic;
  signal pb2gb3, pb1gb23, pb0gb123, c0bgb0123 : std_logic;

begin

  -- GP Module implementation
  -- Generate bar (GB) = NAND(A, B)
  gb(0) <= a0 nand b0;
  gb(1) <= a1 nand b1;
  gb(2) <= a2 nand b2;
  gb(3) <= a3 nand b3;
  
  -- Propagate bar (PB) = NOR(A, B)
  pb(0) <= a0 nor b0;
  pb(1) <= a1 nor b1;
  pb(2) <= a2 nor b2;
  pb(3) <= a3 nor b3;
  
  -- Propagate (P) = NOT(PB)
  p(0) <= not pb(0);
  p(1) <= not pb(1);
  p(2) <= not pb(2);
  p(3) <= not pb(3);
  
  -- A XOR B = GB AND P
  axb(0) <= gb(0) and p(0);
  axb(1) <= gb(1) and p(1);
  axb(2) <= gb(2) and p(2);
  axb(3) <= gb(3) and p(3);

  -- CLA Module implementation
  c0b <= not ci;
  c(0) <= not c0b; -- C[0] = C0
  
  -- Buffer PB signals
  pb0 <= pb(0);
  pb1 <= pb(1);
  pb2 <= pb(2);
  pb3 <= pb(3);
  
  -- Intermediate terms for C[1]
  c0bgb0 <= c0b and gb(0);
  
  -- Intermediate terms for C[2]
  pb0gb1 <= pb(0) and gb(1);
  c0bgb01 <= c0b and gb(0) and gb(1);
  
  -- Intermediate terms for C[3]
  pb1gb2 <= pb(1) and gb(2);
  pb0gb12 <= pb(0) and gb(1) and gb(2);
  c0bgb012 <= c0b and gb(0) and gb(1) and gb(2);
  
  -- Intermediate terms for C[4] (carry out)
  pb2gb3 <= pb(2) and gb(3);
  pb1gb23 <= pb(1) and gb(2) and gb(3);
  pb0gb123 <= pb(0) and gb(1) and gb(2) and gb(3);
  c0bgb0123 <= c0b and gb(0) and gb(1) and gb(2) and gb(3);
  
  -- Carry calculations using NOR gates
  c(1) <= not (pb0 or c0bgb0);
  c(2) <= not (pb1 or pb0gb1 or c0bgb01);
  c(3) <= not (pb2 or pb1gb2 or pb0gb12 or c0bgb012);
  co <= not (pb3 or pb2gb3 or pb1gb23 or pb0gb123 or c0bgb0123);

  -- Sum Module implementation
  -- S = C XOR (A XOR B)
  s0 <= c(0) xor axb(0);
  s1 <= c(1) xor axb(1);
  s2 <= c(2) xor axb(2);
  s3 <= c(3) xor axb(3);

end;
