library ieee;
use ieee.std_logic_1164.all;
use work.cadr_book.all;

entity pdl is
  port (
    -- Bus signals
    L : in std_logic_vector(31 downto 0);
    M : out std_logic_vector(31 downto 0);
    OB : in std_logic_vector(9 downto 0);
    PDL : out std_logic_vector(31 downto 0);
    PDLIDX : out std_logic_vector(9 downto 0);
    PDLPTR : out std_logic_vector(9 downto 0);
    MF : out std_logic_vector(11 downto 0);
    
    -- Individual signals
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
    
    -- Output signals
    \-destspcd\ : out std_logic;
    imodd : out std_logic;
    \-imodd\ : out std_logic;
    \-pdlcry3\ : out std_logic;
    \-pdlcry7\ : out std_logic;
    \-pdldrive\ : out std_logic;
    pdlenb : out std_logic;
    pdlparity : out std_logic;
    pidrive : out std_logic;
    \-ppdrive\ : out std_logic;
    pdlwrite : out std_logic;
    \-pdlwrited\ : out std_logic;
    pdlwrited : out std_logic;
    pwidx : out std_logic;
    \-pwidx\ : out std_logic
  );
end;

architecture rtl of pdl is
  -- Internal signals for interconnections
  signal int_pdlidx : std_logic_vector(9 downto 0);
  signal int_pdlptr : std_logic_vector(9 downto 0);
  signal int_pdl : std_logic_vector(31 downto 0);
  signal int_pdla0a, int_pdla1a, int_pdla2a, int_pdla3a, int_pdla4a, int_pdla5a : std_logic;
  signal int_pdla6a, int_pdla7a, int_pdla8a, int_pdla9a : std_logic;
  signal int_pdla0b, int_pdla1b, int_pdla2b, int_pdla3b, int_pdla4b, int_pdla5b : std_logic;
  signal int_pdla6b, int_pdla7b, int_pdla8b, int_pdla9b : std_logic;
  signal int_pwpa, int_pwpb, int_pwpc : std_logic;
  signal int_pdlparity : std_logic;

begin
  -- Map bus outputs
  PDLIDX <= int_pdlidx;
  PDLPTR <= int_pdlptr;
  PDL <= int_pdl;
  pdlparity <= int_pdlparity;

  -- cadr_pdlptr instance
  u_pdlptr: cadr_pdlptr port map (
    clk3f => clk3f, \-destpdlp\ => \-destpdlp\, \-destpdlx\ => \-destpdlx\,
    ob0 => OB(0), ob1 => OB(1), ob2 => OB(2), ob3 => OB(3), ob4 => OB(4), ob5 => OB(5), ob6 => OB(6), ob7 => OB(7), ob8 => OB(8), ob9 => OB(9),
    \-pdlcnt\ => \-pdlcnt\, srcpdlidx => srcpdlidx, \-srcpdlpop\ => \-srcpdlpop\, srcpdlptr => srcpdlptr, tse4b => tse4b,
    mf0 => MF(0), mf1 => MF(1), mf2 => MF(2), mf3 => MF(3), mf4 => MF(4), mf5 => MF(5), mf6 => MF(6), mf7 => MF(7), mf8 => MF(8), mf9 => MF(9), mf10 => MF(10), mf11 => MF(11),
    \-pdlcry3\ => \-pdlcry3\, \-pdlcry7\ => \-pdlcry7\,
    pdlidx0 => int_pdlidx(0), pdlidx1 => int_pdlidx(1), pdlidx2 => int_pdlidx(2), pdlidx3 => int_pdlidx(3), pdlidx4 => int_pdlidx(4), pdlidx5 => int_pdlidx(5), pdlidx6 => int_pdlidx(6), pdlidx7 => int_pdlidx(7), pdlidx8 => int_pdlidx(8), pdlidx9 => int_pdlidx(9),
    pdlptr0 => int_pdlptr(0), pdlptr1 => int_pdlptr(1), pdlptr2 => int_pdlptr(2), pdlptr3 => int_pdlptr(3), pdlptr4 => int_pdlptr(4), pdlptr5 => int_pdlptr(5), pdlptr6 => int_pdlptr(6), pdlptr7 => int_pdlptr(7), pdlptr8 => int_pdlptr(8), pdlptr9 => int_pdlptr(9),
    pidrive => pidrive, \-ppdrive\ => \-ppdrive\
  );

  -- cadr_pdlctl instance
  u_pdlctl: cadr_pdlctl port map (
    clk4b => clk4b, \-clk4e\ => \-clk4e\, clk4f => clk4f,
    \-destpdl(p)\ => \-destpdl(p)\, \-destpdl(x)\ => \-destpdl(x)\, \-destpdltop\ => \-destpdltop\, \-destspc\ => \-destspc\,
    imod => imod, ir30 => ir30, nop => nop,
    pdlidx0 => int_pdlidx(0), pdlidx1 => int_pdlidx(1), pdlidx2 => int_pdlidx(2), pdlidx3 => int_pdlidx(3), pdlidx4 => int_pdlidx(4), pdlidx5 => int_pdlidx(5), pdlidx6 => int_pdlidx(6), pdlidx7 => int_pdlidx(7), pdlidx8 => int_pdlidx(8), pdlidx9 => int_pdlidx(9),
    pdlptr0 => int_pdlptr(0), pdlptr1 => int_pdlptr(1), pdlptr2 => int_pdlptr(2), pdlptr3 => int_pdlptr(3), pdlptr4 => int_pdlptr(4), pdlptr5 => int_pdlptr(5), pdlptr6 => int_pdlptr(6), pdlptr7 => int_pdlptr(7), pdlptr8 => int_pdlptr(8), pdlptr9 => int_pdlptr(9),
    \-reset\ => \-reset\, \-srcpdlpop\ => \-srcpdlpop\, \-srcpdltop\ => \-srcpdltop\, tse4b => tse4b, wp4a => wp4a,
    \-destspcd\ => \-destspcd\, imodd => imodd, \-imodd\ => \-imodd\,
    \-pdla0a\ => int_pdla0a, \-pdla1a\ => int_pdla1a, \-pdla2a\ => int_pdla2a, \-pdla3a\ => int_pdla3a, \-pdla4a\ => int_pdla4a, \-pdla5a\ => int_pdla5a, \-pdla6a\ => int_pdla6a, \-pdla7a\ => int_pdla7a, \-pdla8a\ => int_pdla8a, \-pdla9a\ => int_pdla9a,
    \-pdla0b\ => int_pdla0b, \-pdla1b\ => int_pdla1b, \-pdla2b\ => int_pdla2b, \-pdla3b\ => int_pdla3b, \-pdla4b\ => int_pdla4b, \-pdla5b\ => int_pdla5b, \-pdla6b\ => int_pdla6b, \-pdla7b\ => int_pdla7b, \-pdla8b\ => int_pdla8b, \-pdla9b\ => int_pdla9b,
    \-pdlcnt\ => open, pdlenb => pdlenb, \-pdldrive\ => \-pdldrive\,
    \-pdlpa\ => open, \-pdlpb\ => open,
    pdlwrite => pdlwrite, \-pdlwrited\ => \-pdlwrited\, pdlwrited => pdlwrited,
    pwidx => pwidx, \-pwidx\ => \-pwidx\,
    \-pwpa\ => int_pwpa, \-pwpb\ => int_pwpb, \-pwpc\ => int_pwpc
  );

  -- cadr_pdl1 instance (lower 16 bits)
  u_pdl1: cadr_pdl1 port map (
    l0 => L(0), l1 => L(1), l2 => L(2), l3 => L(3), l4 => L(4), l5 => L(5), l6 => L(6), l7 => L(7), l8 => L(8), l9 => L(9), l10 => L(10), l11 => L(11), l12 => L(12), l13 => L(13), l14 => L(14), l15 => L(15),
    \-pdla0a\ => int_pdla0a, \-pdla1a\ => int_pdla1a, \-pdla2a\ => int_pdla2a, \-pdla3a\ => int_pdla3a, \-pdla4a\ => int_pdla4a, \-pdla5a\ => int_pdla5a, \-pdla6a\ => int_pdla6a, \-pdla7a\ => int_pdla7a, \-pdla8a\ => int_pdla8a, \-pdla9a\ => int_pdla9a,
    \-pwpb\ => int_pwpb, \-pwpc\ => int_pwpc,
    pdl0 => int_pdl(0), pdl1 => int_pdl(1), pdl2 => int_pdl(2), pdl3 => int_pdl(3), pdl4 => int_pdl(4), pdl5 => int_pdl(5), pdl6 => int_pdl(6), pdl7 => int_pdl(7), pdl8 => int_pdl(8), pdl9 => int_pdl(9), pdl10 => int_pdl(10), pdl11 => int_pdl(11), pdl12 => int_pdl(12), pdl13 => int_pdl(13), pdl14 => int_pdl(14), pdl15 => int_pdl(15)
  );

  -- cadr_pdl0 instance (upper 16 bits)
  u_pdl0: cadr_pdl0 port map (
    l16 => L(16), l17 => L(17), l18 => L(18), l19 => L(19), l20 => L(20), l21 => L(21), l22 => L(22), l23 => L(23), l24 => L(24), l25 => L(25), l26 => L(26), l27 => L(27), l28 => L(28), l29 => L(29), l30 => L(30), l31 => L(31),
    lparity => lparity,
    \-pdla0b\ => int_pdla0b, \-pdla1b\ => int_pdla1b, \-pdla2b\ => int_pdla2b, \-pdla3b\ => int_pdla3b, \-pdla4b\ => int_pdla4b, \-pdla5b\ => int_pdla5b, \-pdla6b\ => int_pdla6b, \-pdla7b\ => int_pdla7b, \-pdla8b\ => int_pdla8b, \-pdla9b\ => int_pdla9b,
    \-pwpa\ => int_pwpa, \-pwpb\ => int_pwpb,
    pdl16 => int_pdl(16), pdl17 => int_pdl(17), pdl18 => int_pdl(18), pdl19 => int_pdl(19), pdl20 => int_pdl(20), pdl21 => int_pdl(21), pdl22 => int_pdl(22), pdl23 => int_pdl(23), pdl24 => int_pdl(24), pdl25 => int_pdl(25), pdl26 => int_pdl(26), pdl27 => int_pdl(27), pdl28 => int_pdl(28), pdl29 => int_pdl(29), pdl30 => int_pdl(30), pdl31 => int_pdl(31),
    pdlparity => int_pdlparity
  );

  -- cadr_platch instance
  u_platch: cadr_platch port map (
    clk4a => clk4a,
    pdl0 => int_pdl(0), pdl1 => int_pdl(1), pdl2 => int_pdl(2), pdl3 => int_pdl(3), pdl4 => int_pdl(4), pdl5 => int_pdl(5), pdl6 => int_pdl(6), pdl7 => int_pdl(7), pdl8 => int_pdl(8), pdl9 => int_pdl(9), pdl10 => int_pdl(10), pdl11 => int_pdl(11), pdl12 => int_pdl(12), pdl13 => int_pdl(13), pdl14 => int_pdl(14), pdl15 => int_pdl(15), pdl16 => int_pdl(16), pdl17 => int_pdl(17), pdl18 => int_pdl(18), pdl19 => int_pdl(19), pdl20 => int_pdl(20), pdl21 => int_pdl(21), pdl22 => int_pdl(22), pdl23 => int_pdl(23), pdl24 => int_pdl(24), pdl25 => int_pdl(25), pdl26 => int_pdl(26), pdl27 => int_pdl(27), pdl28 => int_pdl(28), pdl29 => int_pdl(29), pdl30 => int_pdl(30), pdl31 => int_pdl(31),
    \-pdldrive\ => \-pdldrive\, pdlparity => int_pdlparity,
    m0 => M(0), m1 => M(1), m2 => M(2), m3 => M(3), m4 => M(4), m5 => M(5), m6 => M(6), m7 => M(7), m8 => M(8), m9 => M(9), m10 => M(10), m11 => M(11), m12 => M(12), m13 => M(13), m14 => M(14), m15 => M(15), m16 => M(16), m17 => M(17), m18 => M(18), m19 => M(19), m20 => M(20), m21 => M(21), m22 => M(22), m23 => M(23), m24 => M(24), m25 => M(25), m26 => M(26), m27 => M(27), m28 => M(28), m29 => M(29), m30 => M(30), m31 => M(31)
  );

end; 