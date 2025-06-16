library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity ireg is
  port (
    -- Clock signals
    clk3a : in std_logic;
    clk3b : in std_logic;
    
    -- Control signals
    \-destimod0\ : in std_logic;
    \-destimod1\ : in std_logic;
    
    -- Input signal for parity calculation
    imodd : in std_logic;
    
    -- Input bus (48-bit)
    I : in std_logic_vector(48 downto 0);
    
    -- Output bus (48-bit)  
    OB : in std_logic_vector(47 downto 0);
    
    -- Input/Output bus (48-bit)
    IOB : out std_logic_vector(47 downto 0);
    
    -- Instruction register output (48-bit)
    IR : out std_logic_vector(48 downto 0);
    
    -- Parity outputs
    ipar0 : out std_logic;
    ipar1 : out std_logic;
    ipar2 : out std_logic;
    ipar3 : out std_logic;
    iparity : out std_logic;
    iparok : out std_logic
  );
end entity;

architecture rtl of ireg is

  -- Internal signals for IOB from cadr_ior
  signal iob_int : std_logic_vector(47 downto 0);
  
  -- Internal IR signals for parity calculation
  signal ir_int : std_logic_vector(48 downto 0);

begin

  -- CADR IOR instance (I/O Register)
  u_ior: cadr_ior
    port map (
      i12   => I(12),
      ob12  => OB(12),
      iob12 => iob_int(12),
      i13   => I(13),
      ob13  => OB(13),
      iob13 => iob_int(13),
      iob14 => iob_int(14),
      i14   => I(14),
      ob14  => OB(14),
      iob15 => iob_int(15),
      i15   => I(15),
      ob15  => OB(15),
      i8    => I(8),
      ob8   => OB(8),
      iob8  => iob_int(8),
      i9    => I(9),
      ob9   => OB(9),
      iob9  => iob_int(9),
      iob10 => iob_int(10),
      i10   => I(10),
      ob10  => OB(10),
      iob11 => iob_int(11),
      i11   => I(11),
      ob11  => OB(11),
      i4    => I(4),
      ob4   => OB(4),
      iob4  => iob_int(4),
      i5    => I(5),
      ob5   => OB(5),
      iob5  => iob_int(5),
      iob6  => iob_int(6),
      i6    => I(6),
      ob6   => OB(6),
      iob7  => iob_int(7),
      i7    => I(7),
      ob7   => OB(7),
      i0    => I(0),
      ob0   => OB(0),
      iob0  => iob_int(0),
      i1    => I(1),
      iob1  => iob_int(1),
      iob2  => iob_int(2),
      i2    => I(2),
      ob2   => OB(2),
      iob3  => iob_int(3),
      i3    => I(3),
      ob3   => OB(3),
      i20   => I(20),
      ob20  => OB(20),
      iob20 => iob_int(20),
      i21   => I(21),
      ob21  => OB(21),
      iob21 => iob_int(21),
      iob22 => iob_int(22),
      i22   => I(22),
      ob22  => OB(22),
      iob23 => iob_int(23),
      i23   => I(23),
      ob23  => OB(23),
      i16   => I(16),
      ob16  => OB(16),
      iob16 => iob_int(16),
      i17   => I(17),
      ob17  => OB(17),
      iob17 => iob_int(17),
      iob18 => iob_int(18),
      i18   => I(18),
      ob18  => OB(18),
      iob19 => iob_int(19),
      i19   => I(19),
      ob19  => OB(19),
      i44   => I(44),
      iob44 => iob_int(44),
      i45   => I(45),
      iob45 => iob_int(45),
      iob46 => iob_int(46),
      i46   => I(46),
      iob47 => iob_int(47),
      i47   => I(47),
      i40   => I(40),
      iob40 => iob_int(40),
      i41   => I(41),
      iob41 => iob_int(41),
      iob42 => iob_int(42),
      i42   => I(42),
      iob43 => iob_int(43),
      i43   => I(43),
      i36   => I(36),
      iob36 => iob_int(36),
      i37   => I(37),
      iob37 => iob_int(37),
      iob38 => iob_int(38),
      i38   => I(38),
      iob39 => iob_int(39),
      i39   => I(39),
      i32   => I(32),
      iob32 => iob_int(32),
      i33   => I(33),
      iob33 => iob_int(33),
      iob34 => iob_int(34),
      i34   => I(34),
      iob35 => iob_int(35),
      i35   => I(35),
      i28   => I(28),
      iob28 => iob_int(28),
      i29   => I(29),
      iob29 => iob_int(29),
      iob30 => iob_int(30),
      i30   => I(30),
      iob31 => iob_int(31),
      i31   => I(31),
      i24   => I(24),
      ob24  => OB(24),
      iob24 => iob_int(24),
      i25   => I(25),
      ob25  => OB(25),
      iob25 => iob_int(25),
      iob26 => iob_int(26),
      i26   => I(26),
      iob27 => iob_int(27),
      i27   => I(27),
      ob1   => OB(1)
    );
  
  -- CADR IREG instance (Instruction Register)
  u_ireg: cadr_ireg
    port map (
      \-destimod0\ => \-destimod0\,
      ir15         => ir_int(15),
      iob15        => iob_int(15),
      i15          => I(15),
      i14          => I(14),
      iob14        => iob_int(14),
      ir14         => ir_int(14),
      clk3a        => clk3a,
      ir13         => ir_int(13),
      iob13        => iob_int(13),
      i13          => I(13),
      i12          => I(12),
      iob12        => iob_int(12),
      ir12         => ir_int(12),
      ir11         => ir_int(11),
      iob11        => iob_int(11),
      i11          => I(11),
      i10          => I(10),
      iob10        => iob_int(10),
      ir10         => ir_int(10),
      ir9          => ir_int(9),
      iob9         => iob_int(9),
      i9           => I(9),
      i8           => I(8),
      iob8         => iob_int(8),
      ir8          => ir_int(8),
      ir7          => ir_int(7),
      iob7         => iob_int(7),
      i7           => I(7),
      i6           => I(6),
      iob6         => iob_int(6),
      ir6          => ir_int(6),
      ir5          => ir_int(5),
      iob5         => iob_int(5),
      i5           => I(5),
      i4           => I(4),
      iob4         => iob_int(4),
      ir4          => ir_int(4),
      ir3          => ir_int(3),
      iob3         => iob_int(3),
      i3           => I(3),
      i2           => I(2),
      iob2         => iob_int(2),
      ir2          => ir_int(2),
      ir1          => ir_int(1),
      iob1         => iob_int(1),
      i1           => I(1),
      i0           => I(0),
      iob0         => iob_int(0),
      ir0          => ir_int(0),
      ir23         => ir_int(23),
      iob23        => iob_int(23),
      i23          => I(23),
      i22          => I(22),
      iob22        => iob_int(22),
      ir22         => ir_int(22),
      clk3b        => clk3b,
      ir21         => ir_int(21),
      iob21        => iob_int(21),
      i21          => I(21),
      i20          => I(20),
      iob20        => iob_int(20),
      ir20         => ir_int(20),
      ir19         => ir_int(19),
      iob19        => iob_int(19),
      i19          => I(19),
      i18          => I(18),
      iob18        => iob_int(18),
      ir18         => ir_int(18),
      ir17         => ir_int(17),
      iob17        => iob_int(17),
      i17          => I(17),
      i16          => I(16),
      iob16        => iob_int(16),
      ir16         => ir_int(16),
      \-destimod1\ => \-destimod1\,
      i48          => I(48),
      ir48         => ir_int(48),
      ir47         => ir_int(47),
      iob47        => iob_int(47),
      i47          => I(47),
      i46          => I(46),
      iob46        => iob_int(46),
      ir46         => ir_int(46),
      ir45         => ir_int(45),
      iob45        => iob_int(45),
      i45          => I(45),
      i44          => I(44),
      iob44        => iob_int(44),
      ir44         => ir_int(44),
      ir43         => ir_int(43),
      iob43        => iob_int(43),
      i43          => I(43),
      i42          => I(42),
      iob42        => iob_int(42),
      ir42         => ir_int(42),
      ir41         => ir_int(41),
      iob41        => iob_int(41),
      i41          => I(41),
      i40          => I(40),
      iob40        => iob_int(40),
      ir40         => ir_int(40),
      ir39         => ir_int(39),
      iob39        => iob_int(39),
      i39          => I(39),
      i38          => I(38),
      iob38        => iob_int(38),
      ir38         => ir_int(38),
      ir37         => ir_int(37),
      iob37        => iob_int(37),
      i37          => I(37),
      i36          => I(36),
      iob36        => iob_int(36),
      ir36         => ir_int(36),
      ir35         => ir_int(35),
      iob35        => iob_int(35),
      i35          => I(35),
      i34          => I(34),
      iob34        => iob_int(34),
      ir34         => ir_int(34),
      ir33         => ir_int(33),
      iob33        => iob_int(33),
      i33          => I(33),
      i32          => I(32),
      iob32        => iob_int(32),
      ir32         => ir_int(32),
      ir31         => ir_int(31),
      iob31        => iob_int(31),
      i31          => I(31),
      i30          => I(30),
      iob30        => iob_int(30),
      ir30         => ir_int(30),
      ir29         => ir_int(29),
      iob29        => iob_int(29),
      i29          => I(29),
      i28          => I(28),
      iob28        => iob_int(28),
      ir28         => ir_int(28),
      ir27         => ir_int(27),
      iob27        => iob_int(27),
      i27          => I(27),
      i26          => I(26),
      iob26        => iob_int(26),
      ir26         => ir_int(26),
      ir25         => ir_int(25),
      iob25        => iob_int(25),
      i25          => I(25),
      i24          => I(24),
      iob24        => iob_int(24),
      ir24         => ir_int(24)
    );

  -- CADR IPAR instance (Instruction Parity)
  u_ipar: cadr_ipar port map (ir41 => ir_int(41), ir42 => ir_int(42), ir43 => ir_int(43), ir44 => ir_int(44), ir45 => ir_int(45), ir46 => ir_int(46), ir47 => ir_int(47), ipar3 => ipar3, ir36 => ir_int(36), ir37 => ir_int(37), ir38 => ir_int(38), ir39 => ir_int(39), ir40 => ir_int(40), ir5 => ir_int(5), ir6 => ir_int(6), ir7 => ir_int(7), ir8 => ir_int(8), ir9 => ir_int(9), ir10 => ir_int(10), ir11 => ir_int(11), ipar0 => ipar0, ir0 => ir_int(0), ir1 => ir_int(1), ir2 => ir_int(2), ir3 => ir_int(3), ir4 => ir_int(4), ir29 => ir_int(29), ir30 => ir_int(30), ir31 => ir_int(31), ir32 => ir_int(32), ir33 => ir_int(33), ir34 => ir_int(34), ir35 => ir_int(35), ipar2 => ipar2, ir24 => ir_int(24), ir25 => ir_int(25), ir26 => ir_int(26), ir27 => ir_int(27), ir28 => ir_int(28), iparity => iparity, ipar1 => ipar1, ir48 => ir_int(48), ir17 => ir_int(17), ir18 => ir_int(18), ir19 => ir_int(19), ir20 => ir_int(20), ir21 => ir_int(21), ir22 => ir_int(22), ir23 => ir_int(23), ir12 => ir_int(12), ir13 => ir_int(13), ir14 => ir_int(14), ir15 => ir_int(15), ir16 => ir_int(16), imodd => imodd, iparok => iparok);

  -- Output assignments
  IOB <= iob_int;
  IR <= ir_int;

end architecture; 