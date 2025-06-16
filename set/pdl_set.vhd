library ieee;
use ieee.std_logic_1164.all;
use work.cadr_book.all;

entity pdl_set is
  port (
    L : in std_logic_vector(31 downto 0);
    M : out std_logic_vector(31 downto 0);
    OB : in std_logic_vector(9 downto 0);
    MF : out std_logic_vector(11 downto 0);
    clk3f : in std_logic;
    clk4a : in std_logic;
    clk4b : in std_logic;
    \-clk4e\ : in std_logic;
    clk4f : in std_logic;
    \-destpdl(p)\ : in std_logic;
    \-destpdl(x)\ : in std_logic;
    \-destpdlp\ : in std_logic;
    \-destpdltop\ : in std_logic;
    \-destpdlx\ : in std_logic;
    \-destspc\ : in std_logic;
    imod : in std_logic;
    ir30 : in std_logic;
    lparity : in std_logic;
    nop : in std_logic;
    \-pdlcnt\ : in std_logic;
    \-reset\ : in std_logic;
    srcpdlidx : in std_logic;
    \-srcpdlpop\ : in std_logic;
    srcpdlptr : in std_logic;
    \-srcpdltop\ : in std_logic;
    tse4b : in std_logic;
    wp4a : in std_logic;
    \-destspcd\ : out std_logic;
    imodd : out std_logic;
    pdlenb : out std_logic;
    pdlwrited : out std_logic
  );
end;

architecture rtl of pdl_set is
  -- Internal signals for interconnections
  signal pdlidx : std_logic_vector(9 downto 0);
  signal pdlptr : std_logic_vector(9 downto 0);
  signal pdl : std_logic_vector(31 downto 0);
  signal pdla0a, pdla1a, pdla2a, pdla3a, pdla4a, pdla5a : std_logic;
  signal pdla6a, pdla7a, pdla8a, pdla9a : std_logic;
  signal pdla0b, pdla1b, pdla2b, pdla3b, pdla4b, pdla5b : std_logic;
  signal pdla6b, pdla7b, pdla8b, pdla9b : std_logic;
  signal pwpa, pwpb, pwpc : std_logic;
  signal pdlparity : std_logic;

begin
  -- Map bus outputs
  PDLIDX <= pdlidx;
  PDLPTR <= pdlptr;
  PDL <= pdl;
  pdlparity <= pdlparity;

  -- cadr_pdlptr instance
  u_pdlptr: cadr_pdlptr port map (
    clk3f => clk3f, \-destpdlp\ => \-destpdlp\, \-destpdlx\ => \-destpdlx\,
    ob0 => OB(0), ob1 => OB(1), ob2 => OB(2), ob3 => OB(3), ob4 => OB(4), ob5 => OB(5), ob6 => OB(6), ob7 => OB(7), ob8 => OB(8), ob9 => OB(9),
    \-pdlcnt\ => \-pdlcnt\, srcpdlidx => srcpdlidx, \-srcpdlpop\ => \-srcpdlpop\, srcpdlptr => srcpdlptr, tse4b => tse4b,
    mf0 => MF(0), mf1 => MF(1), mf2 => MF(2), mf3 => MF(3), mf4 => MF(4), mf5 => MF(5), mf6 => MF(6), mf7 => MF(7), mf8 => MF(8), mf9 => MF(9), mf10 => MF(10), mf11 => MF(11),
    \-pdlcry3\ => \-pdlcry3\, \-pdlcry7\ => \-pdlcry7\,
    pdlidx0 => pdlidx(0), pdlidx1 => pdlidx(1), pdlidx2 => pdlidx(2), pdlidx3 => pdlidx(3), pdlidx4 => pdlidx(4), pdlidx5 => pdlidx(5), pdlidx6 => pdlidx(6), pdlidx7 => pdlidx(7), pdlidx8 => pdlidx(8), pdlidx9 => pdlidx(9),
    pdlptr0 => pdlptr(0), pdlptr1 => pdlptr(1), pdlptr2 => pdlptr(2), pdlptr3 => pdlptr(3), pdlptr4 => pdlptr(4), pdlptr5 => pdlptr(5), pdlptr6 => pdlptr(6), pdlptr7 => pdlptr(7), pdlptr8 => pdlptr(8), pdlptr9 => pdlptr(9),
    pidrive => pidrive, \-ppdrive\ => \-ppdrive\
  );

  -- cadr_pdlctl instance
  u_pdlctl: cadr_pdlctl port map (
    clk4b => clk4b, \-clk4e\ => \-clk4e\, clk4f => clk4f,
    \-destpdl(p)\ => \-destpdl(p)\, \-destpdl(x)\ => \-destpdl(x)\, \-destpdltop\ => \-destpdltop\, \-destspc\ => \-destspc\,
    imod => imod, ir30 => ir30, nop => nop,
    pdlidx0 => pdlidx(0), pdlidx1 => pdlidx(1), pdlidx2 => pdlidx(2), pdlidx3 => pdlidx(3), pdlidx4 => pdlidx(4), pdlidx5 => pdlidx(5), pdlidx6 => pdlidx(6), pdlidx7 => pdlidx(7), pdlidx8 => pdlidx(8), pdlidx9 => pdlidx(9),
    pdlptr0 => pdlptr(0), pdlptr1 => pdlptr(1), pdlptr2 => pdlptr(2), pdlptr3 => pdlptr(3), pdlptr4 => pdlptr(4), pdlptr5 => pdlptr(5), pdlptr6 => pdlptr(6), pdlptr7 => pdlptr(7), pdlptr8 => pdlptr(8), pdlptr9 => pdlptr(9),
    \-reset\ => \-reset\, \-srcpdlpop\ => \-srcpdlpop\, \-srcpdltop\ => \-srcpdltop\, tse4b => tse4b, wp4a => wp4a,
    \-destspcd\ => \-destspcd\, imodd => imodd, \-imodd\ => \-imodd\,
    \-pdla0a\ => pdla0a, \-pdla1a\ => pdla1a, \-pdla2a\ => pdla2a, \-pdla3a\ => pdla3a, \-pdla4a\ => pdla4a, \-pdla5a\ => pdla5a, \-pdla6a\ => pdla6a, \-pdla7a\ => pdla7a, \-pdla8a\ => pdla8a, \-pdla9a\ => pdla9a,
    \-pdla0b\ => pdla0b, \-pdla1b\ => pdla1b, \-pdla2b\ => pdla2b, \-pdla3b\ => pdla3b, \-pdla4b\ => pdla4b, \-pdla5b\ => pdla5b, \-pdla6b\ => pdla6b, \-pdla7b\ => pdla7b, \-pdla8b\ => pdla8b, \-pdla9b\ => pdla9b,
    \-pdlcnt\ => open, pdlenb => pdlenb, \-pdldrive\ => \-pdldrive\,
    \-pdlpa\ => open, \-pdlpb\ => open,
    pdlwrite => pdlwrite, \-pdlwrited\ => \-pdlwrited\, pdlwrited => pdlwrited,
    pwidx => pwidx, \-pwidx\ => \-pwidx\,
    \-pwpa\ => pwpa, \-pwpb\ => pwpb, \-pwpc\ => pwpc
  );

  -- cadr_pdl1 instance (lower 16 bits)
  u_pdl1: cadr_pdl1 port map (
    l0 => L(0), l1 => L(1), l2 => L(2), l3 => L(3), l4 => L(4), l5 => L(5), l6 => L(6), l7 => L(7), l8 => L(8), l9 => L(9), l10 => L(10), l11 => L(11), l12 => L(12), l13 => L(13), l14 => L(14), l15 => L(15),
    \-pdla0a\ => pdla0a, \-pdla1a\ => pdla1a, \-pdla2a\ => pdla2a, \-pdla3a\ => pdla3a, \-pdla4a\ => pdla4a, \-pdla5a\ => pdla5a, \-pdla6a\ => pdla6a, \-pdla7a\ => pdla7a, \-pdla8a\ => pdla8a, \-pdla9a\ => pdla9a,
    \-pwpb\ => pwpb, \-pwpc\ => pwpc,
    pdl0 => pdl(0), pdl1 => pdl(1), pdl2 => pdl(2), pdl3 => pdl(3), pdl4 => pdl(4), pdl5 => pdl(5), pdl6 => pdl(6), pdl7 => pdl(7), pdl8 => pdl(8), pdl9 => pdl(9), pdl10 => pdl(10), pdl11 => pdl(11), pdl12 => pdl(12), pdl13 => pdl(13), pdl14 => pdl(14), pdl15 => pdl(15)
  );

  -- cadr_pdl0 instance (upper 16 bits)
  u_pdl0: cadr_pdl0 port map (
    l16 => L(16), l17 => L(17), l18 => L(18), l19 => L(19), l20 => L(20), l21 => L(21), l22 => L(22), l23 => L(23), l24 => L(24), l25 => L(25), l26 => L(26), l27 => L(27), l28 => L(28), l29 => L(29), l30 => L(30), l31 => L(31),
    lparity => lparity,
    \-pdla0b\ => pdla0b, \-pdla1b\ => pdla1b, \-pdla2b\ => pdla2b, \-pdla3b\ => pdla3b, \-pdla4b\ => pdla4b, \-pdla5b\ => pdla5b, \-pdla6b\ => pdla6b, \-pdla7b\ => pdla7b, \-pdla8b\ => pdla8b, \-pdla9b\ => pdla9b,
    \-pwpa\ => pwpa, \-pwpb\ => pwpb,
    pdl16 => pdl(16), pdl17 => pdl(17), pdl18 => pdl(18), pdl19 => pdl(19), pdl20 => pdl(20), pdl21 => pdl(21), pdl22 => pdl(22), pdl23 => pdl(23), pdl24 => pdl(24), pdl25 => pdl(25), pdl26 => pdl(26), pdl27 => pdl(27), pdl28 => pdl(28), pdl29 => pdl(29), pdl30 => pdl(30), pdl31 => pdl(31),
    pdlparity => pdlparity
  );

  -- cadr_platch instance
  u_platch: cadr_platch port map (
    clk4a => clk4a,
    pdl0 => pdl(0), pdl1 => pdl(1), pdl2 => pdl(2), pdl3 => pdl(3), pdl4 => pdl(4), pdl5 => pdl(5), pdl6 => pdl(6), pdl7 => pdl(7), pdl8 => pdl(8), pdl9 => pdl(9), pdl10 => pdl(10), pdl11 => pdl(11), pdl12 => pdl(12), pdl13 => pdl(13), pdl14 => pdl(14), pdl15 => pdl(15), pdl16 => pdl(16), pdl17 => pdl(17), pdl18 => pdl(18), pdl19 => pdl(19), pdl20 => pdl(20), pdl21 => pdl(21), pdl22 => pdl(22), pdl23 => pdl(23), pdl24 => pdl(24), pdl25 => pdl(25), pdl26 => pdl(26), pdl27 => pdl(27), pdl28 => pdl(28), pdl29 => pdl(29), pdl30 => pdl(30), pdl31 => pdl(31),
    \-pdldrive\ => \-pdldrive\, pdlparity => pdlparity,
    m0 => M(0), m1 => M(1), m2 => M(2), m3 => M(3), m4 => M(4), m5 => M(5), m6 => M(6), m7 => M(7), m8 => M(8), m9 => M(9), m10 => M(10), m11 => M(11), m12 => M(12), m13 => M(13), m14 => M(14), m15 => M(15), m16 => M(16), m17 => M(17), m18 => M(18), m19 => M(19), m20 => M(20), m21 => M(21), m22 => M(22), m23 => M(23), m24 => M(24), m25 => M(25), m26 => M(26), m27 => M(27), m28 => M(28), m29 => M(29), m30 => M(30), m31 => M(31)
  );

end; 