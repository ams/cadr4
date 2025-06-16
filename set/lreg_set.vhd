library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity lreg is
  port (
    -- Clock signal
    clk3f : in std_logic;
    
    -- Bus signals
    OB : in std_logic_vector(31 downto 0);
    
    -- Output bus signals
    L : out std_logic_vector(31 downto 0);
    
    -- Parity outputs
    lparl      : out std_logic;
    \-lparm\   : out std_logic;
    lparity    : out std_logic;
    \-lparity\ : out std_logic
  );
end entity;

architecture structure of lreg is
begin

  u_cadr_l : cadr_l
    port map (
      clk3f      => clk3f,
      ob0        => OB(0),
      ob1        => OB(1),
      ob2        => OB(2),
      ob3        => OB(3),
      ob4        => OB(4),
      ob5        => OB(5),
      ob6        => OB(6),
      ob7        => OB(7),
      ob8        => OB(8),
      ob9        => OB(9),
      ob10       => OB(10),
      ob11       => OB(11),
      ob12       => OB(12),
      ob13       => OB(13),
      ob14       => OB(14),
      ob15       => OB(15),
      ob16       => OB(16),
      ob17       => OB(17),
      ob18       => OB(18),
      ob19       => OB(19),
      ob20       => OB(20),
      ob21       => OB(21),
      ob22       => OB(22),
      ob23       => OB(23),
      ob24       => OB(24),
      ob25       => OB(25),
      ob26       => OB(26),
      ob27       => OB(27),
      ob28       => OB(28),
      ob29       => OB(29),
      ob30       => OB(30),
      ob31       => OB(31),
      l0         => L(0),
      l1         => L(1),
      l2         => L(2),
      l3         => L(3),
      l4         => L(4),
      l5         => L(5),
      l6         => L(6),
      l7         => L(7),
      l8         => L(8),
      l9         => L(9),
      l10        => L(10),
      l11        => L(11),
      l12        => L(12),
      l13        => L(13),
      l14        => L(14),
      l15        => L(15),
      l16        => L(16),
      l17        => L(17),
      l18        => L(18),
      l19        => L(19),
      l20        => L(20),
      l21        => L(21),
      l22        => L(22),
      l23        => L(23),
      l24        => L(24),
      l25        => L(25),
      l26        => L(26),
      l27        => L(27),
      l28        => L(28),
      l29        => L(29),
      l30        => L(30),
      l31        => L(31),
      lparl      => lparl,
      \-lparm\   => \-lparm\,
      lparity    => lparity,
      \-lparity\ => \-lparity\
    );

end structure; 