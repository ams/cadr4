library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity set_md is
  port (
    -- Clock signals
    \-clk2c\ : in std_logic;
    tse2 : in std_logic;
    
    -- Bus inputs
    OB : in std_logic_vector(31 downto 0);
    MDS : in std_logic_vector(31 downto 0);
    
    -- Other inputs
    \-destmdr\ : in std_logic;
    \-ignpar\ : in std_logic;
    \-loadmd\ : in std_logic;
    \mempar in\ : in std_logic;
    \-srcmd\ : in std_logic;
    mdparodd : in std_logic;
    mdsela : in std_logic;
    mdselb : in std_logic;
    \-memdrive.a\ : in std_logic;
    \-memdrive.b\ : in std_logic;
    
    -- Bus outputs
    MD : out std_logic_vector(31 downto 0);
    MF : out std_logic_vector(31 downto 0);
    MEM : out std_logic_vector(31 downto 0);
    
    -- Other outputs
    \-mddrive\ : out std_logic;
    srcmd : out std_logic;
    destmdr : out std_logic;
    loadmd : out std_logic;
    mdclk : out std_logic;
    mdgetspar : out std_logic;
    mdhaspar : out std_logic;
    mdpar : out std_logic
  );
end set_md;

architecture rtl of set_md is
  -- Internal signals for MD bus (inverted)
  signal int_md : std_logic_vector(31 downto 0);
  signal int_mds : std_logic_vector(31 downto 0);

begin

  -- cadr_md instance
  u_md: cadr_md port map (
    \-clk2c\ => \-clk2c\, tse2 => tse2,
    \-destmdr\ => \-destmdr\, \-ignpar\ => \-ignpar\, \-loadmd\ => \-loadmd\,
    \mempar in\ => \mempar in\, \-srcmd\ => \-srcmd\,
    \-mds0\ => int_mds(0), \-mds1\ => int_mds(1), \-mds2\ => int_mds(2), \-mds3\ => int_mds(3),
    \-mds4\ => int_mds(4), \-mds5\ => int_mds(5), \-mds6\ => int_mds(6), \-mds7\ => int_mds(7),
    \-mds8\ => int_mds(8), \-mds9\ => int_mds(9), \-mds10\ => int_mds(10), \-mds11\ => int_mds(11),
    \-mds12\ => int_mds(12), \-mds13\ => int_mds(13), \-mds14\ => int_mds(14), \-mds15\ => int_mds(15),
    \-mds16\ => int_mds(16), \-mds17\ => int_mds(17), \-mds18\ => int_mds(18), \-mds19\ => int_mds(19),
    \-mds20\ => int_mds(20), \-mds21\ => int_mds(21), \-mds22\ => int_mds(22), \-mds23\ => int_mds(23),
    \-mds24\ => int_mds(24), \-mds25\ => int_mds(25), \-mds26\ => int_mds(26), \-mds27\ => int_mds(27),
    \-mds28\ => int_mds(28), \-mds29\ => int_mds(29), \-mds30\ => int_mds(30), \-mds31\ => int_mds(31),
    \-md0\ => int_md(0), \-md1\ => int_md(1), \-md2\ => int_md(2), \-md3\ => int_md(3),
    \-md4\ => int_md(4), \-md5\ => int_md(5), \-md6\ => int_md(6), \-md7\ => int_md(7),
    \-md8\ => int_md(8), \-md9\ => int_md(9), \-md10\ => int_md(10), \-md11\ => int_md(11),
    \-md12\ => int_md(12), \-md13\ => int_md(13), \-md14\ => int_md(14), \-md15\ => int_md(15),
    \-md16\ => int_md(16), \-md17\ => int_md(17), \-md18\ => int_md(18), \-md19\ => int_md(19),
    \-md20\ => int_md(20), \-md21\ => int_md(21), \-md22\ => int_md(22), \-md23\ => int_md(23),
    \-md24\ => int_md(24), \-md25\ => int_md(25), \-md26\ => int_md(26), \-md27\ => int_md(27),
    \-md28\ => int_md(28), \-md29\ => int_md(29), \-md30\ => int_md(30), \-md31\ => int_md(31),
    mf0 => MF(0), mf1 => MF(1), mf2 => MF(2), mf3 => MF(3), mf4 => MF(4), mf5 => MF(5), mf6 => MF(6), mf7 => MF(7),
    mf8 => MF(8), mf9 => MF(9), mf10 => MF(10), mf11 => MF(11), mf12 => MF(12), mf13 => MF(13), mf14 => MF(14), mf15 => MF(15),
    mf16 => MF(16), mf17 => MF(17), mf18 => MF(18), mf19 => MF(19), mf20 => MF(20), mf21 => MF(21), mf22 => MF(22), mf23 => MF(23),
    mf24 => MF(24), mf25 => MF(25), mf26 => MF(26), mf27 => MF(27), mf28 => MF(28), mf29 => MF(29), mf30 => MF(30), mf31 => MF(31),
    \-mddrive\ => \-mddrive\, srcmd => srcmd, destmdr => destmdr, loadmd => loadmd,
    mdclk => mdclk, mdgetspar => mdgetspar, mdhaspar => mdhaspar, mdpar => mdpar
  );

  -- cadr_mds instance
  u_mds: cadr_mds port map (
    \-md0\ => int_md(0), \-md1\ => int_md(1), \-md2\ => int_md(2), \-md3\ => int_md(3),
    \-md4\ => int_md(4), \-md5\ => int_md(5), \-md6\ => int_md(6), \-md7\ => int_md(7),
    \-md8\ => int_md(8), \-md9\ => int_md(9), \-md10\ => int_md(10), \-md11\ => int_md(11),
    \-md12\ => int_md(12), \-md13\ => int_md(13), \-md14\ => int_md(14), \-md15\ => int_md(15),
    \-md16\ => int_md(16), \-md17\ => int_md(17), \-md18\ => int_md(18), \-md19\ => int_md(19),
    \-md20\ => int_md(20), \-md21\ => int_md(21), \-md22\ => int_md(22), \-md23\ => int_md(23),
    \-md24\ => int_md(24), \-md25\ => int_md(25), \-md26\ => int_md(26), \-md27\ => int_md(27),
    \-md28\ => int_md(28), \-md29\ => int_md(29), \-md30\ => int_md(30), \-md31\ => int_md(31),
    mdparodd => mdparodd, mdsela => mdsela, mdselb => mdselb,
    \-memdrive.a\ => \-memdrive.a\, \-memdrive.b\ => \-memdrive.b\,
    ob0 => OB(0), ob1 => OB(1), ob2 => OB(2), ob3 => OB(3), ob4 => OB(4), ob5 => OB(5), ob6 => OB(6), ob7 => OB(7),
    ob8 => OB(8), ob9 => OB(9), ob10 => OB(10), ob11 => OB(11), ob12 => OB(12), ob13 => OB(13), ob14 => OB(14), ob15 => OB(15),
    ob16 => OB(16), ob17 => OB(17), ob18 => OB(18), ob19 => OB(19), ob20 => OB(20), ob21 => OB(21), ob22 => OB(22), ob23 => OB(23),
    ob24 => OB(24), ob25 => OB(25), ob26 => OB(26), ob27 => OB(27),
    \-mds0\ => int_mds(0), \-mds1\ => int_mds(1), \-mds2\ => int_mds(2), \-mds3\ => int_mds(3),
    \-mds4\ => int_mds(4), \-mds5\ => int_mds(5), \-mds6\ => int_mds(6), \-mds7\ => int_mds(7),
    \-mds8\ => int_mds(8), \-mds9\ => int_mds(9), \-mds10\ => int_mds(10), \-mds11\ => int_mds(11),
    \-mds12\ => int_mds(12), \-mds13\ => int_mds(13), \-mds14\ => int_mds(14), \-mds15\ => int_mds(15),
    \-mds16\ => int_mds(16), \-mds17\ => int_mds(17), \-mds18\ => int_mds(18), \-mds19\ => int_mds(19),
    \-mds20\ => int_mds(20), \-mds21\ => int_mds(21), \-mds22\ => int_mds(22), \-mds23\ => int_mds(23),
    \-mds24\ => int_mds(24), \-mds25\ => int_mds(25), \-mds26\ => int_mds(26), \-mds27\ => int_mds(27),
    mem0 => MEM(0), mem1 => MEM(1), mem2 => MEM(2), mem3 => MEM(3), mem4 => MEM(4), mem5 => MEM(5), mem6 => MEM(6), mem7 => MEM(7),
    mem8 => MEM(8), mem9 => MEM(9), mem10 => MEM(10), mem11 => MEM(11), mem12 => MEM(12), mem13 => MEM(13), mem14 => MEM(14), mem15 => MEM(15),
    mem16 => MEM(16), mem17 => MEM(17), mem18 => MEM(18), mem19 => MEM(19), mem20 => MEM(20), mem21 => MEM(21), mem22 => MEM(22), mem23 => MEM(23),
    mem24 => MEM(24), mem25 => MEM(25), mem26 => MEM(26), mem27 => MEM(27), mem28 => MEM(28), mem29 => MEM(29), mem30 => MEM(30), mem31 => MEM(31)
  );

  -- Connect output buses (invert the internal signals)
  MD <= not int_md;
  MDS <= not int_mds;

end rtl; 