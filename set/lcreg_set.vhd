library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity lcreg_set is
  port (
    clk1a : in std_logic;
    clk2a : in std_logic;
    clk2c : in std_logic;
    clk3c : in std_logic;
    OB : in std_logic_vector(31 downto 0);
    IR : in std_logic_vector(48 downto 0);
    SPC : in std_logic_vector(18 downto 0);
    \-destlc\ : in std_logic;
    \-reset\ : in std_logic;
    \-srcspcpopreal\ : in std_logic;
    \-srclc\ : in std_logic;
    needfetch : in std_logic;
    \prog.unibus.reset\ : in std_logic;
    \int.enable\ : in std_logic;
    \sequence.break\ : in std_logic;
    tse1a : in std_logic;
    int : in std_logic;
    irdisp : in std_logic;
    \-spop\ : in std_logic;
    LC : out std_logic_vector(31 downto 0);
    MF : out std_logic_vector(31 downto 0);
    lcinc : out std_logic;
    lcry3 : out std_logic;
    \-sh4\ : out std_logic;
    \-sh3\ : out std_logic;
    \-ifetch\ : out std_logic
  );
end lcreg_set;

architecture rtl of lcreg_set is
  -- Internal signals
  signal lc_byte_mode : std_logic;
  signal lc0 : std_logic;
  signal lc1 : std_logic;
  signal lc2 : std_logic;
  signal lc3 : std_logic;
  signal lc0b : std_logic;
  signal needfetch : std_logic;

begin

  -- cadr_lc instance
  u_lc: cadr_lc port map (
    clk1a => clk1a, clk2a => clk2a, clk2c => clk2c,
    \-destlc\ => \-destlc\, \int.enable\ => \int.enable\, \lc byte mode\ => lc_byte_mode,
    \prog.unibus.reset\ => \prog.unibus.reset\, \sequence.break\ => \sequence.break\,
    needfetch => needfetch, tse1a => tse1a, \-srclc\ => \-srclc\,
    lc0b => lc0b, lc1 => lc1, lc2 => lc2, lc3 => lc3,
    ob4 => OB(4), ob5 => OB(5), ob6 => OB(6), ob7 => OB(7), ob8 => OB(8), ob9 => OB(9), ob10 => OB(10), ob11 => OB(11), 
    ob12 => OB(12), ob13 => OB(13), ob14 => OB(14), ob15 => OB(15), ob16 => OB(16), ob17 => OB(17), ob18 => OB(18), ob19 => OB(19),
    ob20 => OB(20), ob21 => OB(21), ob22 => OB(22), ob23 => OB(23), ob24 => OB(24), ob25 => OB(25),
    \-lcry3\ => \-lcry3\,
    \-lcdrive\ => \-lcdrive\, lcdrive => lcdrive, srclc => srclc,
    lc7 => LC(7), lc6 => LC(6), lc5 => LC(5), lc4 => LC(4), lc8 => LC(8), lc9 => LC(9), lc10 => LC(10), lc11 => LC(11),
    lc12 => LC(12), lc13 => LC(13), lc14 => LC(14), lc15 => LC(15), lc16 => LC(16), lc17 => LC(17), lc18 => LC(18), lc19 => LC(19),
    lc20 => LC(20), lc21 => LC(21), lc22 => LC(22), lc23 => LC(23), lc24 => LC(24), lc25 => LC(25),
    mf0 => MF(0), mf1 => MF(1), mf2 => MF(2), mf3 => MF(3), mf4 => MF(4), mf5 => MF(5), mf6 => MF(6), mf7 => MF(7),
    mf8 => MF(8), mf9 => MF(9), mf10 => MF(10), mf11 => MF(11), mf12 => MF(12), mf13 => MF(13), mf14 => MF(14), mf15 => MF(15),
    mf16 => MF(16), mf17 => MF(17), mf18 => MF(18), mf19 => MF(19), mf20 => MF(20), mf21 => MF(21), mf22 => MF(22), mf23 => MF(23),
    mf24 => MF(24), mf25 => MF(25), mf26 => MF(26), mf27 => MF(27), mf28 => MF(28), mf29 => MF(29), mf30 => MF(30), mf31 => MF(31),
    \-lcry7\ => \-lcry7\, \-lcry11\ => \-lcry11\, \-lcry15\ => \-lcry15\, \-lcry19\ => \-lcry19\, \-lcry23\ => \-lcry23\
  );

  -- cadr_lcc instance
  u_lcc: cadr_lcc port map (
    clk2a => clk2a, clk3c => clk3c,
    \-destlc\ => \-destlc\, int => int, irdisp => irdisp, \-spop\ => \-spop\,
    ir10 => IR(10), ir11 => IR(11), ir24 => IR(24), \-ir3\ => \-ir3\, \-ir4\ => \-ir4\,
    \lc byte mode\ => lc_byte_mode, \-reset\ => \-reset\,
    spc1 => SPC(1), spc14 => SPC(14), \-srcspcpopreal\ => \-srcspcpopreal\,
    ob0 => OB(0), ob1 => OB(1), ob2 => OB(2), ob3 => OB(3),
    \-lcinc\ => \-lcinc\, lca1 => open, lc1 => lc1, lca0 => open, lc0 => lc0,
    lcinc => lcinc, lcry3 => lcry3, lca3 => open, lc3 => lc3, lca2 => open, lc2 => lc2,
    lc0b => lc0b, \inst in left half\ => \inst in left half\, \-sh4\ => \-sh4\, \-sh3\ => \-sh3\,
    \inst in 2nd or 4th quarter\ => \inst in 2nd or 4th quarter\, \-lc modifies mrot\ => \-lc modifies mrot\,
    \-ifetch\ => \-ifetch\, needfetch => needfetch, \have wrong word\ => \have wrong word\,
    \last byte in word\ => \last byte in word\, \-newlc\ => \-newlc\, \-newlc.in\ => \-newlc.in\, newlc => newlc
  );

  -- Connect outputs
  \lc byte mode\ <= lc_byte_mode;
  LC(0) <= lc0;
  LC(1) <= lc1;
  LC(2) <= lc2;
  LC(3) <= lc3;
  needfetch <= needfetch;

end rtl; 