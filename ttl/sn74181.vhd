-- Arithmetic Logic Units/Function Generators
-- SN74181 4-bit Arithmetic Logic Unit

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.misc.all;

entity sn74181 is
  port (
    -- Control and status
    m      : in  std_logic;  -- Mode: 1=Logic, 0=Arithmetic
    cin_n  : in  std_logic;  -- Carry in (active low) - matches Verilog CNb
    cout_n : out std_logic;  -- Carry out (active low) - matches Verilog CN4b
    aeb    : out std_logic;  -- A equals B
    x      : out std_logic;  -- Carry propagate
    y      : out std_logic;  -- Carry generate
    
    -- Function select - matches Verilog S[3:0]
    s3, s2, s1, s0 : in std_logic;
    
    -- Data inputs (active high) - matches Verilog A[3:0], B[3:0]
    a3, a2, a1, a0 : in std_logic;
    b3, b2, b1, b0 : in std_logic;
    
    -- Function outputs (active high) - matches Verilog F[3:0]
    f3, f2, f1, f0 : out std_logic
    );
end;

-- Gate-level structural architecture based on ISCAS benchmark implementation
-- Implementing the exact gate structure from the ISCAS 74181.v model
architecture iscas of sn74181 is
  -- Input conditioning signals
  signal m_i, cin_n_i, s3_i, s2_i, s1_i, s0_i : std_logic;
  signal a3_i, a2_i, a1_i, a0_i : std_logic;
  signal b3_i, b2_i, b1_i, b0_i : std_logic;
  
  -- Internal vectors for easier manipulation
  signal a_vec, b_vec : std_logic_vector(3 downto 0);
  signal s_vec : std_logic_vector(3 downto 0);
  
  -- Intermediate signals matching Verilog model exactly
  -- E module signals (Gb in Verilog - generate-like signals)
  signal e_vec : std_logic_vector(3 downto 0);
  signal bb_vec : std_logic_vector(3 downto 0);  -- inverted B (Bb in Verilog)
  signal abs3_vec : std_logic_vector(3 downto 0);  -- A*B*S3 (ABS3 in Verilog)
  signal abbs2_vec : std_logic_vector(3 downto 0); -- A*~B*S2 (ABbS2 in Verilog)
  
  -- D module signals (Pb in Verilog - propagate-like signals)
  signal d_vec : std_logic_vector(3 downto 0);
  signal bbs1_vec : std_logic_vector(3 downto 0);  -- ~B*S1 (BbS1 in Verilog)
  signal bs0_vec : std_logic_vector(3 downto 0);   -- B*S0 (BS0 in Verilog)
  
  -- CLA module signals - matching Verilog CLAmodule exactly
  signal c_vec : std_logic_vector(3 downto 0);     -- internal carries
  signal pb0, pb1, pb2, pb3 : std_logic;           -- propagate terms (buffered D)
  signal cin_n_gb0, cin_n_gb01, cin_n_gb012 : std_logic;    -- carry terms
  signal pb0gb1, pb0gb12, pb0gb123 : std_logic;    -- more carry terms
  signal pb1gb2, pb1gb23 : std_logic;
  signal pb2gb3 : std_logic;
  signal x_int, y_int : std_logic;
  signal x_cin_n, cout_n_int : std_logic;
  
  -- Sum module signals
  signal exd_vec : std_logic_vector(3 downto 0);   -- E XOR D (EXD in Verilog)
  signal cm_vec : std_logic_vector(3 downto 0);    -- C OR M (CM in Verilog)
  signal f_vec : std_logic_vector(3 downto 0);     -- final result
  signal aeb_int : std_logic;

begin

  -- Input conditioning
  m_i <= ttl_input(m);
  cin_n_i <= ttl_input(cin_n);
  s3_i <= ttl_input(s3);
  s2_i <= ttl_input(s2);
  s1_i <= ttl_input(s1);
  s0_i <= ttl_input(s0);
  a3_i <= ttl_input(a3);
  a2_i <= ttl_input(a2);
  a1_i <= ttl_input(a1);
  a0_i <= ttl_input(a0);
  b3_i <= ttl_input(b3);
  b2_i <= ttl_input(b2);
  b1_i <= ttl_input(b1);
  b0_i <= ttl_input(b0);

  -- Create vectors for easier processing
  a_vec <= a3_i & a2_i & a1_i & a0_i;
  b_vec <= b3_i & b2_i & b1_i & b0_i;
  s_vec <= s3_i & s2_i & s1_i & s0_i;

  -- E MODULE (exact gate-level implementation from Verilog Emodule)
  -- Generate inverted B signals (Bb in Verilog)
  bb_vec(0) <= not b0_i;
  bb_vec(1) <= not b1_i;
  bb_vec(2) <= not b2_i;
  bb_vec(3) <= not b3_i;
  
  -- Generate A*B*S3 terms (ABS3 in Verilog)
  abs3_vec(0) <= a0_i and b0_i and s3_i;
  abs3_vec(1) <= a1_i and b1_i and s3_i;
  abs3_vec(2) <= a2_i and b2_i and s3_i;
  abs3_vec(3) <= a3_i and b3_i and s3_i;
  
  -- Generate A*~B*S2 terms (ABbS2 in Verilog)
  abbs2_vec(0) <= a0_i and bb_vec(0) and s2_i;
  abbs2_vec(1) <= a1_i and bb_vec(1) and s2_i;
  abbs2_vec(2) <= a2_i and bb_vec(2) and s2_i;
  abbs2_vec(3) <= a3_i and bb_vec(3) and s2_i;
  
  -- Generate E signals using NOR gates (E becomes Gb in CLAmodule)
  e_vec(0) <= not (abs3_vec(0) or abbs2_vec(0));
  e_vec(1) <= not (abs3_vec(1) or abbs2_vec(1));
  e_vec(2) <= not (abs3_vec(2) or abbs2_vec(2));
  e_vec(3) <= not (abs3_vec(3) or abbs2_vec(3));

  -- D MODULE (exact gate-level implementation from Verilog Dmodule)
  -- Generate ~B*S1 terms (BbS1 in Verilog)
  bbs1_vec(0) <= bb_vec(0) and s1_i;
  bbs1_vec(1) <= bb_vec(1) and s1_i;
  bbs1_vec(2) <= bb_vec(2) and s1_i;
  bbs1_vec(3) <= bb_vec(3) and s1_i;
  
  -- Generate B*S0 terms (BS0 in Verilog)
  bs0_vec(0) <= b0_i and s0_i;
  bs0_vec(1) <= b1_i and s0_i;
  bs0_vec(2) <= b2_i and s0_i;
  bs0_vec(3) <= b3_i and s0_i;
  
  -- Generate D signals using NOR gates (D becomes Pb in CLAmodule)
  d_vec(0) <= not (bbs1_vec(0) or bs0_vec(0) or a0_i);
  d_vec(1) <= not (bbs1_vec(1) or bs0_vec(1) or a1_i);
  d_vec(2) <= not (bbs1_vec(2) or bs0_vec(2) or a2_i);
  d_vec(3) <= not (bbs1_vec(3) or bs0_vec(3) or a3_i);

  -- CLA MODULE (exact gate-level implementation from Verilog CLAmodule)
  -- Generate C0 (inverted CNb)
  c_vec(0) <= not cin_n_i;
  
  -- Buffer propagate signals (D goes to Pb in Verilog)
  pb0 <= d_vec(0);
  pb1 <= d_vec(1);
  pb2 <= d_vec(2);
  pb3 <= d_vec(3);
  
  -- Generate carry terms exactly matching Verilog CLAmodule
  -- For C1: CNbGb0 = CNb * Gb[0] (E goes to Gb in Verilog)
  cin_n_gb0 <= cin_n_i and e_vec(0);
  
  -- For C2: Pb0Gb1 = Pb[0] * Gb[1], CNbGb01 = CNb * Gb[0] * Gb[1]
  pb0gb1 <= pb0 and e_vec(1);
  cin_n_gb01 <= cin_n_i and e_vec(0) and e_vec(1);
  
  -- For C3: Pb1Gb2, Pb0Gb12, CNbGb012
  pb1gb2 <= pb1 and e_vec(2);
  pb0gb12 <= pb0 and e_vec(1) and e_vec(2);
  cin_n_gb012 <= cin_n_i and e_vec(0) and e_vec(1) and e_vec(2);
  
  -- For group outputs: Pb2Gb3, Pb1Gb23, Pb0Gb123
  pb2gb3 <= pb2 and e_vec(3);
  pb1gb23 <= pb1 and e_vec(2) and e_vec(3);
  pb0gb123 <= pb0 and e_vec(1) and e_vec(2) and e_vec(3);
  
  -- Generate group propagate and generate exactly like Verilog
  -- X = NAND(Gb[0], Gb[1], Gb[2], Gb[3]) (E goes to Gb)
  x_int <= not (e_vec(0) and e_vec(1) and e_vec(2) and e_vec(3));
  -- Y = NOR(Pb3, Pb2Gb3, Pb1Gb23, Pb0Gb123) (D goes to Pb)
  y_int <= not (pb3 or pb2gb3 or pb1gb23 or pb0gb123);
  -- XCNb = NAND(Gb[0], Gb[1], Gb[2], Gb[3], CNb) (E goes to Gb)
  x_cin_n <= not (e_vec(0) and e_vec(1) and e_vec(2) and e_vec(3) and cin_n_i);
  -- CN4b = NAND(Y, XCNb)
  cout_n_int <= not (y_int and x_cin_n);
  
  -- Generate internal carry signals using NOR gates
  c_vec(3) <= not (pb2 or pb1gb2 or pb0gb12 or cin_n_gb012);
  c_vec(2) <= not (pb1 or pb0gb1 or cin_n_gb01);
  c_vec(1) <= not (pb0 or cin_n_gb0);

  -- SUM MODULE (exact gate-level implementation from Verilog Summodule)
  -- Generate E XOR D terms (EXD in Verilog)
  exd_vec(0) <= e_vec(0) xor d_vec(0);
  exd_vec(1) <= e_vec(1) xor d_vec(1);
  exd_vec(2) <= e_vec(2) xor d_vec(2);
  exd_vec(3) <= e_vec(3) xor d_vec(3);
  
  -- Generate C OR M terms (CM in Verilog)
  cm_vec(0) <= c_vec(0) or m_i;
  cm_vec(1) <= c_vec(1) or m_i;
  cm_vec(2) <= c_vec(2) or m_i;
  cm_vec(3) <= c_vec(3) or m_i;
  
  -- Generate final function outputs (F in Verilog)
  f_vec(0) <= exd_vec(0) xor cm_vec(0);
  f_vec(1) <= exd_vec(1) xor cm_vec(1);
  f_vec(2) <= exd_vec(2) xor cm_vec(2);
  f_vec(3) <= exd_vec(3) xor cm_vec(3);
  
  -- Generate A equals B output (AEB in Verilog)
  aeb_int <= f_vec(0) and f_vec(1) and f_vec(2) and f_vec(3);

  -- Output assignments
  f0 <= f_vec(0);
  f1 <= f_vec(1);
  f2 <= f_vec(2);
  f3 <= f_vec(3);
  
  -- Carry out matches Verilog CN4b
  cout_n <= cout_n_int;
  
  -- A equals B output
  -- A=B output is open collector !
  process (aeb_int)
  begin
    if aeb_int = '0' then
      aeb <= '0';
    elsif aeb_int = '1' then
      aeb <= 'Z';
    else
      aeb <= aeb_int;
    end if;
  end process;
  
  -- Group propagate and generate outputs
  x <= x_int;
  y <= y_int;

end architecture;
