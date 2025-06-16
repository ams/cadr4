library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity amem is
  port (
    -- Clock and control signals
    clk3d           : in  std_logic;
    clk3e           : in  std_logic;
    dest            : in  std_logic;
    destm           : in  std_logic;
    \-reset\        : in  std_logic;
    tse3a           : in  std_logic;
    tse4a           : in  std_logic;
    wp3a            : in  std_logic;
    \-amemenb\      : in  std_logic;
    apassenb        : in  std_logic;
    \-apassenb\     : in  std_logic;
    
    -- Bus signals
    IR              : in  std_logic_vector(41 downto 14);
    L               : in  std_logic_vector(31 downto 0);
    
    -- Output bus signals
    A               : out std_logic_vector(31 downto 0);
    AADR            : out std_logic_vector(9 downto 0);
    AMEM            : out std_logic_vector(31 downto 0);
    WADR            : out std_logic_vector(9 downto 0);
    
    -- Individual output signals
    lparity         : in  std_logic;
    amemparity      : out std_logic;
    aparity         : out std_logic;
    a31a            : out std_logic;
    a31b            : out std_logic;
    \-apass\        : out std_logic;
    apass1          : out std_logic;
    apass2          : out std_logic;
    \-awpa\         : out std_logic;
    \-awpb\         : out std_logic;
    \-awpc\         : out std_logic;
    destd           : out std_logic;
    destmd          : out std_logic
  );
end entity;

architecture rtl of amem is

  -- Internal signals
  signal aadr0a, aadr0b : std_logic;
  signal aadr1a, aadr1b : std_logic;
  signal aadr2a, aadr2b : std_logic;
  signal aadr3a, aadr3b : std_logic;
  signal aadr4a, aadr4b : std_logic;
  signal aadr5a, aadr5b : std_logic;
  signal aadr6a, aadr6b : std_logic;
  signal aadr7a, aadr7b : std_logic;
  signal aadr8a, aadr8b : std_logic;
  signal aadr9a, aadr9b : std_logic;
  signal awpa, awpb, awpc : std_logic;
  signal amem_low, amem_high : std_logic_vector(15 downto 0);
  signal amem_par : std_logic;
  signal wadr0, wadr1, wadr2, wadr3, wadr4, wadr5, wadr6, wadr7, wadr8, wadr9 : std_logic;

begin

  -- Map bus outputs
  AADR <= aadr9a & aadr8a & aadr7a & aadr6a & aadr5a & aadr4a & aadr3a & aadr2a & aadr1a & aadr0a;
  AMEM <= amem_high & amem_low;
  WADR <= wadr9 & wadr8 & wadr7 & wadr6 & wadr5 & wadr4 & wadr3 & wadr2 & wadr1 & wadr0;
  amemparity <= amem_par;
  \-awpa\ <= awpa;
  \-awpb\ <= awpb;
  \-awpc\ <= awpc;

  actl_inst: cadr_actl port map (
    clk3d           => clk3d,
    clk3e           => clk3e,
    dest            => dest,
    destm           => destm,
    ir14            => IR(14),
    ir15            => IR(15),
    ir16            => IR(16),
    ir17            => IR(17),
    ir18            => IR(18),
    ir19            => IR(19),
    ir20            => IR(20),
    ir21            => IR(21),
    ir22            => IR(22),
    ir23            => IR(23),
    ir32            => IR(32),
    ir33            => IR(33),
    ir34            => IR(34),
    ir35            => IR(35),
    ir36            => IR(36),
    ir37            => IR(37),
    ir38            => IR(38),
    ir39            => IR(39),
    ir40            => IR(40),
    ir41            => IR(41),
    \-reset\        => \-reset\,
    tse3a           => tse3a,
    tse4a           => tse4a,
    wp3a            => wp3a,
    \-aadr0a\       => aadr0a,
    \-aadr0b\       => aadr0b,
    \-aadr1a\       => aadr1a,
    \-aadr1b\       => aadr1b,
    \-aadr2a\       => aadr2a,
    \-aadr2b\       => aadr2b,
    \-aadr3a\       => aadr3a,
    \-aadr3b\       => aadr3b,
    \-aadr4a\       => aadr4a,
    \-aadr4b\       => aadr4b,
    \-aadr5a\       => aadr5a,
    \-aadr5b\       => aadr5b,
    \-aadr6a\       => aadr6a,
    \-aadr6b\       => aadr6b,
    \-aadr7a\       => aadr7a,
    \-aadr7b\       => aadr7b,
    \-aadr8a\       => aadr8a,
    \-aadr8b\       => aadr8b,
    \-aadr9a\       => aadr9a,
    \-aadr9b\       => aadr9b,
    \-amemenb\      => \-amemenb\,
    \-apass\        => \-apass\,
    apass1          => apass1,
    apass2          => apass2,
    apassenb        => apassenb,
    \-apassenb\     => \-apassenb\,
    \-awpa\         => awpa,
    \-awpb\         => awpb,
    \-awpc\         => awpc,
    destd           => destd,
    destmd          => destmd,
    wadr0           => wadr0,
    wadr1           => wadr1,
    wadr2           => wadr2,
    wadr3           => wadr3,
    wadr4           => wadr4,
    wadr5           => wadr5,
    wadr6           => wadr6,
    wadr7           => wadr7,
    wadr8           => wadr8,
    wadr9           => wadr9
  );

  amem1_inst: cadr_amem1 port map (
    \-aadr0a\       => aadr0a,
    \-aadr1a\       => aadr1a,
    \-aadr2a\       => aadr2a,
    \-aadr3a\       => aadr3a,
    \-aadr4a\       => aadr4a,
    \-aadr5a\       => aadr5a,
    \-aadr6a\       => aadr6a,
    \-aadr7a\       => aadr7a,
    \-aadr8a\       => aadr8a,
    \-aadr9a\       => aadr9a,
    \-awpb\         => awpb,
    \-awpc\         => awpc,
    l0              => L(0),
    l1              => L(1),
    l2              => L(2),
    l3              => L(3),
    l4              => L(4),
    l5              => L(5),
    l6              => L(6),
    l7              => L(7),
    l8              => L(8),
    l9              => L(9),
    l10             => L(10),
    l11             => L(11),
    l12             => L(12),
    l13             => L(13),
    l14             => L(14),
    l15             => L(15),
    amem0           => amem_low(0),
    amem1           => amem_low(1),
    amem2           => amem_low(2),
    amem3           => amem_low(3),
    amem4           => amem_low(4),
    amem5           => amem_low(5),
    amem6           => amem_low(6),
    amem7           => amem_low(7),
    amem8           => amem_low(8),
    amem9           => amem_low(9),
    amem10          => amem_low(10),
    amem11          => amem_low(11),
    amem12          => amem_low(12),
    amem13          => amem_low(13),
    amem14          => amem_low(14),
    amem15          => amem_low(15)
  );

  amem0_inst: cadr_amem0 port map (
    \-aadr0b\       => aadr0b,
    \-aadr1b\       => aadr1b,
    \-aadr2b\       => aadr2b,
    \-aadr3b\       => aadr3b,
    \-aadr4b\       => aadr4b,
    \-aadr5b\       => aadr5b,
    \-aadr6b\       => aadr6b,
    \-aadr7b\       => aadr7b,
    \-aadr8b\       => aadr8b,
    \-aadr9b\       => aadr9b,
    \-awpa\         => awpa,
    \-awpb\         => awpb,
    l16             => L(16),
    l17             => L(17),
    l18             => L(18),
    l19             => L(19),
    l20             => L(20),
    l21             => L(21),
    l22             => L(22),
    l23             => L(23),
    l24             => L(24),
    l25             => L(25),
    l26             => L(26),
    l27             => L(27),
    l28             => L(28),
    l29             => L(29),
    l30             => L(30),
    l31             => L(31),
    lparity         => lparity,
    amem16          => amem_high(0),
    amem17          => amem_high(1),
    amem18          => amem_high(2),
    amem19          => amem_high(3),
    amem20          => amem_high(4),
    amem21          => amem_high(5),
    amem22          => amem_high(6),
    amem23          => amem_high(7),
    amem24          => amem_high(8),
    amem25          => amem_high(9),
    amem26          => amem_high(10),
    amem27          => amem_high(11),
    amem28          => amem_high(12),
    amem29          => amem_high(13),
    amem30          => amem_high(14),
    amem31          => amem_high(15),
    amemparity      => amem_par
  );

  alatch_inst: cadr_alatch port map (
    amem0           => amem_low(0),
    amem1           => amem_low(1),
    amem2           => amem_low(2),
    amem3           => amem_low(3),
    amem4           => amem_low(4),
    amem5           => amem_low(5),
    amem6           => amem_low(6),
    amem7           => amem_low(7),
    amem8           => amem_low(8),
    amem9           => amem_low(9),
    amem10          => amem_low(10),
    amem11          => amem_low(11),
    amem12          => amem_low(12),
    amem13          => amem_low(13),
    amem14          => amem_low(14),
    amem15          => amem_low(15),
    amem16          => amem_high(0),
    amem17          => amem_high(1),
    amem18          => amem_high(2),
    amem19          => amem_high(3),
    amem20          => amem_high(4),
    amem21          => amem_high(5),
    amem22          => amem_high(6),
    amem23          => amem_high(7),
    amem24          => amem_high(8),
    amem25          => amem_high(9),
    amem26          => amem_high(10),
    amem27          => amem_high(11),
    amem28          => amem_high(12),
    amem29          => amem_high(13),
    amem30          => amem_high(14),
    amem31          => amem_high(15),
    \-amemenb\      => \-amemenb\,
    amemparity      => amem_par,
    \-apassenb\     => \-apassenb\,
    apassenb        => apassenb,
    clk3e           => clk3e,
    l0              => L(0),
    l1              => L(1),
    l2              => L(2),
    l3              => L(3),
    l4              => L(4),
    l5              => L(5),
    l6              => L(6),
    l7              => L(7),
    l8              => L(8),
    l9              => L(9),
    l10             => L(10),
    l11             => L(11),
    l12             => L(12),
    l13             => L(13),
    l14             => L(14),
    l15             => L(15),
    l16             => L(16),
    l17             => L(17),
    l18             => L(18),
    l19             => L(19),
    l20             => L(20),
    l21             => L(21),
    l22             => L(22),
    l23             => L(23),
    l24             => L(24),
    l25             => L(25),
    l26             => L(26),
    l27             => L(27),
    l28             => L(28),
    l29             => L(29),
    l30             => L(30),
    l31             => L(31),
    lparity         => lparity,
    a0              => A(0),
    a1              => A(1),
    a2              => A(2),
    a3              => A(3),
    a4              => A(4),
    a5              => A(5),
    a6              => A(6),
    a7              => A(7),
    a8              => A(8),
    a9              => A(9),
    a10             => A(10),
    a11             => A(11),
    a12             => A(12),
    a13             => A(13),
    a14             => A(14),
    a15             => A(15),
    a16             => A(16),
    a17             => A(17),
    a18             => A(18),
    a19             => A(19),
    a20             => A(20),
    a21             => A(21),
    a22             => A(22),
    a23             => A(23),
    a24             => A(24),
    a25             => A(25),
    a26             => A(26),
    a27             => A(27),
    a28             => A(28),
    a29             => A(29),
    a30             => A(30),
    a31a            => a31a,
    a31b            => a31b,
    aparity         => aparity
  );

end architecture; 