library ieee;
use ieee.std_logic_1164.all;
use work.cadr_book.all;

entity qreg is
  port (
    -- Clock
    clk2b : in std_logic;
    
    -- ALU bus input  
    ALU : in std_logic_vector(31 downto 0);
    \-alu31\ : in std_logic;
    
    -- Control inputs for QCTL
    \-ir0\ : in std_logic;
    \-ir1\ : in std_logic;
    \-iralu\ : in std_logic;
    \-srcq\ : in std_logic;
    tse2 : in std_logic;
    
    -- Q register bus output
    Q : out std_logic_vector(31 downto 0);
    
    -- M bus output (from QCTL)
    MF : out std_logic_vector(31 downto 0);
    
    -- Control outputs from QCTL
    \-alu31\ : out std_logic;
    \-qdrive\ : out std_logic;
    qdrive : out std_logic;
    qs0 : out std_logic;
    qs1 : out std_logic;
    srcq : out std_logic
  );
end entity;

architecture rtl of qreg is
  signal q_internal : std_logic_vector(31 downto 0);
  signal qs0_internal, qs1_internal : std_logic;

begin
  
  -- Q register
  q_inst: cadr_q port map (alu0 => ALU(0), alu1 => ALU(1), alu10 => ALU(10), alu11 => ALU(11), alu12 => ALU(12), alu13 => ALU(13), alu14 => ALU(14), alu15 => ALU(15), alu16 => ALU(16), alu17 => ALU(17), alu18 => ALU(18), alu19 => ALU(19), alu2 => ALU(2), alu20 => ALU(20), alu21 => ALU(21), alu22 => ALU(22), alu23 => ALU(23), alu24 => ALU(24), alu25 => ALU(25), alu26 => ALU(26), alu27 => ALU(27), alu28 => ALU(28), alu29 => ALU(29), alu3 => ALU(3), alu30 => ALU(30), alu31 => ALU(31), \-alu31\ => \-alu31\, alu4 => ALU(4), alu5 => ALU(5), alu6 => ALU(6), alu7 => ALU(7), alu8 => ALU(8), alu9 => ALU(9), clk2b => clk2b, qs0 => qs0_internal, qs1 => qs1_internal, q0 => q_internal(0), q1 => q_internal(1), q10 => q_internal(10), q11 => q_internal(11), q12 => q_internal(12), q13 => q_internal(13), q14 => q_internal(14), q15 => q_internal(15), q16 => q_internal(16), q17 => q_internal(17), q18 => q_internal(18), q19 => q_internal(19), q2 => q_internal(2), q20 => q_internal(20), q21 => q_internal(21), q22 => q_internal(22), q23 => q_internal(23), q24 => q_internal(24), q25 => q_internal(25), q26 => q_internal(26), q27 => q_internal(27), q28 => q_internal(28), q29 => q_internal(29), q3 => q_internal(3), q30 => q_internal(30), q31 => q_internal(31), q4 => q_internal(4), q5 => q_internal(5), q6 => q_internal(6), q7 => q_internal(7), q8 => q_internal(8), q9 => q_internal(9));

  -- Q control
  qctl_inst: cadr_qctl port map (alu31 => ALU(31), \-ir0\ => \-ir0\, \-ir1\ => \-ir1\, \-iralu\ => \-iralu\, q0 => q_internal(0), q1 => q_internal(1), q10 => q_internal(10), q11 => q_internal(11), q12 => q_internal(12), q13 => q_internal(13), q14 => q_internal(14), q15 => q_internal(15), q16 => q_internal(16), q17 => q_internal(17), q18 => q_internal(18), q19 => q_internal(19), q2 => q_internal(2), q20 => q_internal(20), q21 => q_internal(21), q22 => q_internal(22), q23 => q_internal(23), q24 => q_internal(24), q25 => q_internal(25), q26 => q_internal(26), q27 => q_internal(27), q28 => q_internal(28), q29 => q_internal(29), q3 => q_internal(3), q30 => q_internal(30), q31 => q_internal(31), q4 => q_internal(4), q5 => q_internal(5), q6 => q_internal(6), q7 => q_internal(7), q8 => q_internal(8), q9 => q_internal(9), \-srcq\ => \-srcq\, tse2 => tse2, \-alu31\ => \-alu31\, mf0 => MF(0), mf1 => MF(1), mf10 => MF(10), mf11 => MF(11), mf12 => MF(12), mf13 => MF(13), mf14 => MF(14), mf15 => MF(15), mf16 => MF(16), mf17 => MF(17), mf18 => MF(18), mf19 => MF(19), mf2 => MF(2), mf20 => MF(20), mf21 => MF(21), mf22 => MF(22), mf23 => MF(23), mf24 => MF(24), mf25 => MF(25), mf26 => MF(26), mf27 => MF(27), mf28 => MF(28), mf29 => MF(29), mf3 => MF(3), mf30 => MF(30), mf31 => MF(31), mf4 => MF(4), mf5 => MF(5), mf6 => MF(6), mf7 => MF(7), mf8 => MF(8), mf9 => MF(9), \-qdrive\ => \-qdrive\, qdrive => qdrive, qs0 => qs0_internal, qs1 => qs1_internal, srcq => srcq);

  -- Output assignments
  Q <= q_internal;
  qs0 <= qs0_internal;
  qs1 <= qs1_internal;

end architecture; 