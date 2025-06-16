library ieee;
use ieee.std_logic_1164.all;
use work.cadr_book.all;

entity qreg_set is
  port (
    clk2b : in std_logic;
    ALU : in std_logic_vector(31 downto 0);
    \-ir0\ : in std_logic;
    \-ir1\ : in std_logic;
    \-iralu\ : in std_logic;
    \-srcq\ : in std_logic;
    tse2 : in std_logic;
    MF : out std_logic_vector(31 downto 0)
  );
end entity;

architecture rtl of qreg_set is
  -- Internal signals
  signal q : std_logic_vector(31 downto 0);
  signal qs0 : std_logic;
  signal qs1 : std_logic;

begin
  
  -- Q register
  q_inst: cadr_q port map (alu0 => ALU(0), alu1 => ALU(1), alu10 => ALU(10), alu11 => ALU(11), alu12 => ALU(12), alu13 => ALU(13), alu14 => ALU(14), alu15 => ALU(15), alu16 => ALU(16), alu17 => ALU(17), alu18 => ALU(18), alu19 => ALU(19), alu2 => ALU(2), alu20 => ALU(20), alu21 => ALU(21), alu22 => ALU(22), alu23 => ALU(23), alu24 => ALU(24), alu25 => ALU(25), alu26 => ALU(26), alu27 => ALU(27), alu28 => ALU(28), alu29 => ALU(29), alu3 => ALU(3), alu30 => ALU(30), alu31 => ALU(31), \-alu31\ => \-alu31\, alu4 => ALU(4), alu5 => ALU(5), alu6 => ALU(6), alu7 => ALU(7), alu8 => ALU(8), alu9 => ALU(9), clk2b => clk2b, qs0 => qs0, qs1 => qs1, q0 => q(0), q1 => q(1), q10 => q(10), q11 => q(11), q12 => q(12), q13 => q(13), q14 => q(14), q15 => q(15), q16 => q(16), q17 => q(17), q18 => q(18), q19 => q(19), q2 => q(2), q20 => q(20), q21 => q(21), q22 => q(22), q23 => q(23), q24 => q(24), q25 => q(25), q26 => q(26), q27 => q(27), q28 => q(28), q29 => q(29), q3 => q(3), q30 => q(30), q31 => q(31), q4 => q(4), q5 => q(5), q6 => q(6), q7 => q(7), q8 => q(8), q9 => q(9));

  -- Q control
  qctl_inst: cadr_qctl port map (alu31 => ALU(31), \-ir0\ => \-ir0\, \-ir1\ => \-ir1\, \-iralu\ => \-iralu\, q0 => q(0), q1 => q(1), q10 => q(10), q11 => q(11), q12 => q(12), q13 => q(13), q14 => q(14), q15 => q(15), q16 => q(16), q17 => q(17), q18 => q(18), q19 => q(19), q2 => q(2), q20 => q(20), q21 => q(21), q22 => q(22), q23 => q(23), q24 => q(24), q25 => q(25), q26 => q(26), q27 => q(27), q28 => q(28), q29 => q(29), q3 => q(3), q30 => q(30), q31 => q(31), q4 => q(4), q5 => q(5), q6 => q(6), q7 => q(7), q8 => q(8), q9 => q(9), \-srcq\ => \-srcq\, tse2 => tse2, \-alu31\ => \-alu31\, mf0 => MF(0), mf1 => MF(1), mf10 => MF(10), mf11 => MF(11), mf12 => MF(12), mf13 => MF(13), mf14 => MF(14), mf15 => MF(15), mf16 => MF(16), mf17 => MF(17), mf18 => MF(18), mf19 => MF(19), mf2 => MF(2), mf20 => MF(20), mf21 => MF(21), mf22 => MF(22), mf23 => MF(23), mf24 => MF(24), mf25 => MF(25), mf26 => MF(26), mf27 => MF(27), mf28 => MF(28), mf29 => MF(29), mf3 => MF(3), mf30 => MF(30), mf31 => MF(31), mf4 => MF(4), mf5 => MF(5), mf6 => MF(6), mf7 => MF(7), mf8 => MF(8), mf9 => MF(9), \-qdrive\ => \-qdrive\, qdrive => qdrive, qs0 => qs0, qs1 => qs1, srcq => srcq);

  -- Output assignments handled by direct component connections

end architecture; 