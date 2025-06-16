library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity mos is
  port (
    -- Bus signals - inputs
    ALU : in std_logic_vector(32 downto 0);
    A   : in std_logic_vector(31 downto 0);
    R   : in std_logic_vector(31 downto 0);
    MSK : in std_logic_vector(31 downto 0);
    
    -- Output bus signal
    OB  : out std_logic_vector(31 downto 0);
    
    -- Control signals
    osel0a : in std_logic;
    osel1a : in std_logic;
    osel0b : in std_logic;
    osel1b : in std_logic;
    
    -- Special signals
    a31b : in std_logic;  -- Separate inverted signal for a31
    q31  : in std_logic   -- Special q31 signal for mo0
  );
end entity;

architecture structure of mos is
begin

  u_cadr_mo0 : cadr_mo0
    port map (
      alu0   => ALU(0),
      alu1   => ALU(1),
      alu2   => ALU(2),
      alu3   => ALU(3),
      alu4   => ALU(4),
      alu5   => ALU(5),
      alu6   => ALU(6),
      alu7   => ALU(7),
      alu8   => ALU(8),
      alu9   => ALU(9),
      alu10  => ALU(10),
      alu11  => ALU(11),
      alu12  => ALU(12),
      alu13  => ALU(13),
      alu14  => ALU(14),
      alu15  => ALU(15),
      alu16  => ALU(16),
      a0     => A(0),
      a1     => A(1),
      a2     => A(2),
      a3     => A(3),
      a4     => A(4),
      a5     => A(5),
      a6     => A(6),
      a7     => A(7),
      a8     => A(8),
      a9     => A(9),
      a10    => A(10),
      a11    => A(11),
      a12    => A(12),
      a13    => A(13),
      a14    => A(14),
      a15    => A(15),
      r0     => R(0),
      r1     => R(1),
      r2     => R(2),
      r3     => R(3),
      r4     => R(4),
      r5     => R(5),
      r6     => R(6),
      r7     => R(7),
      r8     => R(8),
      r9     => R(9),
      r10    => R(10),
      r11    => R(11),
      r12    => R(12),
      r13    => R(13),
      r14    => R(14),
      r15    => R(15),
      msk0   => MSK(0),
      msk1   => MSK(1),
      msk2   => MSK(2),
      msk3   => MSK(3),
      msk4   => MSK(4),
      msk5   => MSK(5),
      msk6   => MSK(6),
      msk7   => MSK(7),
      msk8   => MSK(8),
      msk9   => MSK(9),
      msk10  => MSK(10),
      msk11  => MSK(11),
      msk12  => MSK(12),
      msk13  => MSK(13),
      msk14  => MSK(14),
      msk15  => MSK(15),
      ob0    => OB(0),
      ob1    => OB(1),
      ob2    => OB(2),
      ob3    => OB(3),
      ob4    => OB(4),
      ob5    => OB(5),
      ob6    => OB(6),
      ob7    => OB(7),
      ob8    => OB(8),
      ob9    => OB(9),
      ob10   => OB(10),
      ob11   => OB(11),
      ob12   => OB(12),
      ob13   => OB(13),
      ob14   => OB(14),
      ob15   => OB(15),
      osel0b => osel0b,
      osel1b => osel1b,
      q31    => q31
    );

  u_cadr_mo1 : cadr_mo1
    port map (
      alu15  => ALU(15),
      alu16  => ALU(16),
      alu17  => ALU(17),
      alu18  => ALU(18),
      alu19  => ALU(19),
      alu20  => ALU(20),
      alu21  => ALU(21),
      alu22  => ALU(22),
      alu23  => ALU(23),
      alu24  => ALU(24),
      alu25  => ALU(25),
      alu26  => ALU(26),
      alu27  => ALU(27),
      alu28  => ALU(28),
      alu29  => ALU(29),
      alu30  => ALU(30),
      alu31  => ALU(31),
      alu32  => ALU(32),
      a16    => A(16),
      a17    => A(17),
      a18    => A(18),
      a19    => A(19),
      a20    => A(20),
      a21    => A(21),
      a22    => A(22),
      a23    => A(23),
      a24    => A(24),
      a25    => A(25),
      a26    => A(26),
      a27    => A(27),
      a28    => A(28),
      a29    => A(29),
      a30    => A(30),
      a31b   => a31b,
      r16    => R(16),
      r17    => R(17),
      r18    => R(18),
      r19    => R(19),
      r20    => R(20),
      r21    => R(21),
      r22    => R(22),
      r23    => R(23),
      r24    => R(24),
      r25    => R(25),
      r26    => R(26),
      r27    => R(27),
      r28    => R(28),
      r29    => R(29),
      r30    => R(30),
      r31    => R(31),
      msk16  => MSK(16),
      msk17  => MSK(17),
      msk18  => MSK(18),
      msk19  => MSK(19),
      msk20  => MSK(20),
      msk21  => MSK(21),
      msk22  => MSK(22),
      msk23  => MSK(23),
      msk24  => MSK(24),
      msk25  => MSK(25),
      msk26  => MSK(26),
      msk27  => MSK(27),
      msk28  => MSK(28),
      msk29  => MSK(29),
      msk30  => MSK(30),
      msk31  => MSK(31),
      ob16   => OB(16),
      ob17   => OB(17),
      ob18   => OB(18),
      ob19   => OB(19),
      ob20   => OB(20),
      ob21   => OB(21),
      ob22   => OB(22),
      ob23   => OB(23),
      ob24   => OB(24),
      ob25   => OB(25),
      ob26   => OB(26),
      ob27   => OB(27),
      ob28   => OB(28),
      ob29   => OB(29),
      ob30   => OB(30),
      ob31   => OB(31),
      osel0a => osel0a,
      osel1a => osel1a
    );

end structure; 