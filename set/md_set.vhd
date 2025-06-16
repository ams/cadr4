library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity md_set is
  port (
    \-clk2c\ : in std_logic;
    tse2 : in std_logic;
    OB : in std_logic_vector(31 downto 0);
    MDS : in std_logic_vector(31 downto 0);
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
    MD : out std_logic_vector(31 downto 0);
    MF : out std_logic_vector(31 downto 0);
    mdhaspar : out std_logic;
    mdpar : out std_logic
  );
end md_set;

architecture rtl of md_set is
  -- Internal signals for MD bus (inverted)
  signal md : std_logic_vector(31 downto 0);
  signal mds : std_logic_vector(31 downto 0);

begin

  -- cadr_md instance
  u_md: cadr_md port map (
    \-clk2c\ => \-clk2c\, tse2 => tse2,
    \-destmdr\ => \-destmdr\, \-ignpar\ => \-ignpar\, \-loadmd\ => \-loadmd\,
    \mempar in\ => \mempar in\, \-srcmd\ => \-srcmd\,
    \-mds0\ => mds(0), \-mds1\ => mds(1), \-mds2\ => mds(2), \-mds3\ => mds(3),
    \-mds4\ => mds(4), \-mds5\ => mds(5), \-mds6\ => mds(6), \-mds7\ => mds(7),
    \-mds8\ => mds(8), \-mds9\ => mds(9), \-mds10\ => mds(10), \-mds11\ => mds(11),
    \-mds12\ => mds(12), \-mds13\ => mds(13), \-mds14\ => mds(14), \-mds15\ => mds(15),
    \-mds16\ => mds(16), \-mds17\ => mds(17), \-mds18\ => mds(18), \-mds19\ => mds(19),
    \-mds20\ => mds(20), \-mds21\ => mds(21), \-mds22\ => mds(22), \-mds23\ => mds(23),
    \-mds24\ => mds(24), \-mds25\ => mds(25), \-mds26\ => mds(26), \-mds27\ => mds(27),
    \-mds28\ => mds(28), \-mds29\ => mds(29), \-mds30\ => mds(30), \-mds31\ => mds(31),
    \-md0\ => md(0), \-md1\ => md(1), \-md2\ => md(2), \-md3\ => md(3),
    \-md4\ => md(4), \-md5\ => md(5), \-md6\ => md(6), \-md7\ => md(7),
    \-md8\ => md(8), \-md9\ => md(9), \-md10\ => md(10), \-md11\ => md(11),
    \-md12\ => md(12), \-md13\ => md(13), \-md14\ => md(14), \-md15\ => md(15),
    \-md16\ => md(16), \-md17\ => md(17), \-md18\ => md(18), \-md19\ => md(19),
    \-md20\ => md(20), \-md21\ => md(21), \-md22\ => md(22), \-md23\ => md(23),
    \-md24\ => md(24), \-md25\ => md(25), \-md26\ => md(26), \-md27\ => md(27),
    \-md28\ => md(28), \-md29\ => md(29), \-md30\ => md(30), \-md31\ => md(31),
    mf0 => MF(0), mf1 => MF(1), mf2 => MF(2), mf3 => MF(3), mf4 => MF(4), mf5 => MF(5), mf6 => MF(6), mf7 => MF(7),
    mf8 => MF(8), mf9 => MF(9), mf10 => MF(10), mf11 => MF(11), mf12 => MF(12), mf13 => MF(13), mf14 => MF(14), mf15 => MF(15),
    mf16 => MF(16), mf17 => MF(17), mf18 => MF(18), mf19 => MF(19), mf20 => MF(20), mf21 => MF(21), mf22 => MF(22), mf23 => MF(23),
    mf24 => MF(24), mf25 => MF(25), mf26 => MF(26), mf27 => MF(27), mf28 => MF(28), mf29 => MF(29), mf30 => MF(30), mf31 => MF(31),
    \-mddrive\ => \-mddrive\, srcmd => \-srcmd\, destmdr => \-destmdr\, loadmd => \-loadmd\,
    mdclk => mdclk, mdgetspar => mdgetspar, mdhaspar => mdhaspar, mdpar => mdpar
  );

  -- cadr_mds instance
  u_mds: cadr_mds port map (
    \-md0\ => md(0), \-md1\ => md(1), \-md2\ => md(2), \-md3\ => md(3),
    \-md4\ => md(4), \-md5\ => md(5), \-md6\ => md(6), \-md7\ => md(7),
    \-md8\ => md(8), \-md9\ => md(9), \-md10\ => md(10), \-md11\ => md(11),
    \-md12\ => md(12), \-md13\ => md(13), \-md14\ => md(14), \-md15\ => md(15),
    \-md16\ => md(16), \-md17\ => md(17), \-md18\ => md(18), \-md19\ => md(19),
    \-md20\ => md(20), \-md21\ => md(21), \-md22\ => md(22), \-md23\ => md(23),
    \-md24\ => md(24), \-md25\ => md(25), \-md26\ => md(26), \-md27\ => md(27),
    \-md28\ => md(28), \-md29\ => md(29), \-md30\ => md(30), \-md31\ => md(31),
    mdparodd => mdparodd, mdsela => mdsela, mdselb => mdselb,
    \-memdrive.a\ => \-memdrive.a\, \-memdrive.b\ => \-memdrive.b\,
    ob0 => OB(0), ob1 => OB(1), ob2 => OB(2), ob3 => OB(3), ob4 => OB(4), ob5 => OB(5), ob6 => OB(6), ob7 => OB(7),
    ob8 => OB(8), ob9 => OB(9), ob10 => OB(10), ob11 => OB(11), ob12 => OB(12), ob13 => OB(13), ob14 => OB(14), ob15 => OB(15),
    ob16 => OB(16), ob17 => OB(17), ob18 => OB(18), ob19 => OB(19), ob20 => OB(20), ob21 => OB(21), ob22 => OB(22), ob23 => OB(23),
    ob24 => OB(24), ob25 => OB(25), ob26 => OB(26), ob27 => OB(27),
    \-mds0\ => mds(0), \-mds1\ => mds(1), \-mds2\ => mds(2), \-mds3\ => mds(3),
    \-mds4\ => mds(4), \-mds5\ => mds(5), \-mds6\ => mds(6), \-mds7\ => mds(7),
    \-mds8\ => mds(8), \-mds9\ => mds(9), \-mds10\ => mds(10), \-mds11\ => mds(11),
    \-mds12\ => mds(12), \-mds13\ => mds(13), \-mds14\ => mds(14), \-mds15\ => mds(15),
    \-mds16\ => mds(16), \-mds17\ => mds(17), \-mds18\ => mds(18), \-mds19\ => mds(19),
    \-mds20\ => mds(20), \-mds21\ => mds(21), \-mds22\ => mds(22), \-mds23\ => mds(23),
    \-mds24\ => mds(24), \-mds25\ => mds(25), \-mds26\ => mds(26), \-mds27\ => mds(27),
    mem0 => MEM(0), mem1 => MEM(1), mem2 => MEM(2), mem3 => MEM(3), mem4 => MEM(4), mem5 => MEM(5), mem6 => MEM(6), mem7 => MEM(7),
    mem8 => MEM(8), mem9 => MEM(9), mem10 => MEM(10), mem11 => MEM(11), mem12 => MEM(12), mem13 => MEM(13), mem14 => MEM(14), mem15 => MEM(15),
    mem16 => MEM(16), mem17 => MEM(17), mem18 => MEM(18), mem19 => MEM(19), mem20 => MEM(20), mem21 => MEM(21), mem22 => MEM(22), mem23 => MEM(23),
    mem24 => MEM(24), mem25 => MEM(25), mem26 => MEM(26), mem27 => MEM(27), mem28 => MEM(28), mem29 => MEM(29), mem30 => MEM(30), mem31 => MEM(31)
  );

  -- Connect output buses (invert the internal signals)
  MD <= not md;
  MDS <= not mds;

end rtl; 