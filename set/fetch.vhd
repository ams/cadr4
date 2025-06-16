library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity fetch is
  port (
    -- Clock signals
    clk2c : in std_logic;
    clk4c : in std_logic;
    
    -- Debug control
    \-idebug\   : in std_logic;
    \-lddbirh\  : in std_logic;
    \-lddbirm\  : in std_logic;
    \-lddbirl\  : in std_logic;
    
    -- Bus signals
    AA  : in  std_logic_vector(15 downto 0);
    M   : in  std_logic_vector(31 downto 0);
    SPY : in  std_logic_vector(15 downto 0);
    
    -- Output bus signals
    I   : out std_logic_vector(48 downto 0);
    IWR : out std_logic_vector(47 downto 0)
  );
end entity;

architecture structure of fetch is
begin

  u_cadr_iwr : cadr_iwr
    port map (
      clk2c => clk2c,
      clk4c => clk4c,
      aa0   => AA(0),
      aa1   => AA(1),
      aa2   => AA(2),
      aa3   => AA(3),
      aa4   => AA(4),
      aa5   => AA(5),
      aa6   => AA(6),
      aa7   => AA(7),
      aa8   => AA(8),
      aa9   => AA(9),
      aa10  => AA(10),
      aa11  => AA(11),
      aa12  => AA(12),
      aa13  => AA(13),
      aa14  => AA(14),
      aa15  => AA(15),
      m0    => M(0),
      m1    => M(1),
      m2    => M(2),
      m3    => M(3),
      m4    => M(4),
      m5    => M(5),
      m6    => M(6),
      m7    => M(7),
      m8    => M(8),
      m9    => M(9),
      m10   => M(10),
      m11   => M(11),
      m12   => M(12),
      m13   => M(13),
      m14   => M(14),
      m15   => M(15),
      m16   => M(16),
      m17   => M(17),
      m18   => M(18),
      m19   => M(19),
      m20   => M(20),
      m21   => M(21),
      m22   => M(22),
      m23   => M(23),
      m24   => M(24),
      m25   => M(25),
      m26   => M(26),
      m27   => M(27),
      m28   => M(28),
      m29   => M(29),
      m30   => M(30),
      m31   => M(31),
      iwr0  => IWR(0),
      iwr1  => IWR(1),
      iwr2  => IWR(2),
      iwr3  => IWR(3),
      iwr4  => IWR(4),
      iwr5  => IWR(5),
      iwr6  => IWR(6),
      iwr7  => IWR(7),
      iwr8  => IWR(8),
      iwr9  => IWR(9),
      iwr10 => IWR(10),
      iwr11 => IWR(11),
      iwr12 => IWR(12),
      iwr13 => IWR(13),
      iwr14 => IWR(14),
      iwr15 => IWR(15),
      iwr16 => IWR(16),
      iwr17 => IWR(17),
      iwr18 => IWR(18),
      iwr19 => IWR(19),
      iwr20 => IWR(20),
      iwr21 => IWR(21),
      iwr22 => IWR(22),
      iwr23 => IWR(23),
      iwr24 => IWR(24),
      iwr25 => IWR(25),
      iwr26 => IWR(26),
      iwr27 => IWR(27),
      iwr28 => IWR(28),
      iwr29 => IWR(29),
      iwr30 => IWR(30),
      iwr31 => IWR(31),
      iwr32 => IWR(32),
      iwr33 => IWR(33),
      iwr34 => IWR(34),
      iwr35 => IWR(35),
      iwr36 => IWR(36),
      iwr37 => IWR(37),
      iwr38 => IWR(38),
      iwr39 => IWR(39),
      iwr40 => IWR(40),
      iwr41 => IWR(41),
      iwr42 => IWR(42),
      iwr43 => IWR(43),
      iwr44 => IWR(44),
      iwr45 => IWR(45),
      iwr46 => IWR(46),
      iwr47 => IWR(47)
    );

  u_cadr_debug : cadr_debug
    port map (
      \-idebug\  => \-idebug\,
      \-lddbirh\ => \-lddbirh\,
      \-lddbirm\ => \-lddbirm\,
      \-lddbirl\ => \-lddbirl\,
      spy0       => SPY(0),
      spy1       => SPY(1),
      spy2       => SPY(2),
      spy3       => SPY(3),
      spy4       => SPY(4),
      spy5       => SPY(5),
      spy6       => SPY(6),
      spy7       => SPY(7),
      spy8       => SPY(8),
      spy9       => SPY(9),
      spy10      => SPY(10),
      spy11      => SPY(11),
      spy12      => SPY(12),
      spy13      => SPY(13),
      spy14      => SPY(14),
      spy15      => SPY(15),
      i0         => I(0),
      i1         => I(1),
      i2         => I(2),
      i3         => I(3),
      i4         => I(4),
      i5         => I(5),
      i6         => I(6),
      i7         => I(7),
      i8         => I(8),
      i9         => I(9),
      i10        => I(10),
      i11        => I(11),
      i12        => I(12),
      i13        => I(13),
      i14        => I(14),
      i15        => I(15),
      i16        => I(16),
      i17        => I(17),
      i18        => I(18),
      i19        => I(19),
      i20        => I(20),
      i21        => I(21),
      i22        => I(22),
      i23        => I(23),
      i24        => I(24),
      i25        => I(25),
      i26        => I(26),
      i27        => I(27),
      i28        => I(28),
      i29        => I(29),
      i30        => I(30),
      i31        => I(31),
      i32        => I(32),
      i33        => I(33),
      i34        => I(34),
      i35        => I(35),
      i36        => I(36),
      i37        => I(37),
      i38        => I(38),
      i39        => I(39),
      i40        => I(40),
      i41        => I(41),
      i42        => I(42),
      i43        => I(43),
      i44        => I(44),
      i45        => I(45),
      i46        => I(46),
      i47        => I(47)
    );
    
  -- Extend I bus to 49 bits - bit 48 is not connected to cadr_debug
  I(48) <= '0';

end structure; 