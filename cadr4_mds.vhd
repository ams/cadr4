library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_mds is
  port (
    \-memdrive.a\ : in  std_logic;
    \-md31\       : in  std_logic;
    mem24         : out std_logic;
    \-md30\       : in  std_logic;
    mem25         : out std_logic;
    \-md29\       : in  std_logic;
    mem26         : out std_logic;
    \-md28\       : in  std_logic;
    mem27         : out std_logic;
    \-md27\       : in  std_logic;
    mem28         : out std_logic;
    \-md26\       : in  std_logic;
    mem29         : out std_logic;
    \-md25\       : in  std_logic;
    mem30         : out std_logic;
    \-md24\       : in  std_logic;
    mem31         : out std_logic;
    \-memdrive.b\ : in  std_logic;
    \-md7\        : in  std_logic;
    mem0          : out std_logic;
    \-md6\        : in  std_logic;
    mem1          : out std_logic;
    \-md5\        : in  std_logic;
    mem2          : out std_logic;
    \-md4\        : in  std_logic;
    mem3          : out std_logic;
    \-md3\        : in  std_logic;
    mem4          : out std_logic;
    \-md2\        : in  std_logic;
    mem5          : out std_logic;
    \-md1\        : in  std_logic;
    mem6          : out std_logic;
    \-md0\        : in  std_logic;
    mem7          : out std_logic;
    \-md23\       : in  std_logic;
    mem16         : out std_logic;
    \-md22\       : in  std_logic;
    mem17         : out std_logic;
    \-md21\       : in  std_logic;
    mem18         : out std_logic;
    \-md20\       : in  std_logic;
    mem19         : out std_logic;
    \-md19\       : in  std_logic;
    mem20         : out std_logic;
    \-md18\       : in  std_logic;
    mem21         : out std_logic;
    \-md17\       : in  std_logic;
    mem22         : out std_logic;
    \-md16\       : in  std_logic;
    mem23         : out std_logic;
    \-md15\       : in  std_logic;
    mem8          : out std_logic;
    \-md14\       : in  std_logic;
    mem9          : out std_logic;
    \-md13\       : in  std_logic;
    mem10         : out std_logic;
    \-md12\       : in  std_logic;
    mem11         : out std_logic;
    \-md11\       : in  std_logic;
    mem12         : out std_logic;
    \-md10\       : in  std_logic;
    mem13         : out std_logic;
    \-md9\        : in  std_logic;
    mem14         : out std_logic;
    \-md8\        : in  std_logic;
    mem15         : out std_logic;
    mdsela        : in  std_logic;
    ob20          : in  std_logic;
    \-mds20\      : out std_logic;
    ob21          : in  std_logic;
    \-mds21\      : out std_logic;
    \-mds22\      : out std_logic;
    ob22          : in  std_logic;
    \-mds23\      : out std_logic;
    ob23          : in  std_logic;
    gnd           : in  std_logic;
    ob28          : in  std_logic;
    \-mds28\      : out std_logic;
    ob29          : in  std_logic;
    \-mds29\      : out std_logic;
    \-mds30\      : out std_logic;
    ob30          : in  std_logic;
    \-mds31\      : out std_logic;
    ob31          : in  std_logic;
    mdparodd      : in  std_logic;
    \mempar_out\  : out std_logic;
    hi11          : in  std_logic;
    mdselb        : in  std_logic;
    ob12          : in  std_logic;
    \-mds12\      : out std_logic;
    ob13          : in  std_logic;
    \-mds13\      : out std_logic;
    \-mds14\      : out std_logic;
    ob14          : in  std_logic;
    \-mds15\      : out std_logic;
    ob15          : in  std_logic;
    ob16          : in  std_logic;
    \-mds16\      : out std_logic;
    ob17          : in  std_logic;
    \-mds17\      : out std_logic;
    \-mds18\      : out std_logic;
    ob18          : in  std_logic;
    \-mds19\      : out std_logic;
    ob19          : in  std_logic;
    ob8           : in  std_logic;
    \-mds8\       : out std_logic;
    ob9           : in  std_logic;
    \-mds9\       : out std_logic;
    \-mds10\      : out std_logic;
    ob10          : in  std_logic;
    \-mds11\      : out std_logic;
    ob11          : in  std_logic;
    ob0           : in  std_logic;
    \-mds0\       : out std_logic;
    ob1           : in  std_logic;
    \-mds1\       : out std_logic;
    \-mds2\       : out std_logic;
    ob2           : in  std_logic;
    \-mds3\       : out std_logic;
    ob3           : in  std_logic;
    ob4           : in  std_logic;
    \-mds4\       : out std_logic;
    ob5           : in  std_logic;
    \-mds5\       : out std_logic;
    \-mds6\       : out std_logic;
    ob6           : in  std_logic;
    \-mds7\       : out std_logic;
    ob7           : in  std_logic;
    ob24          : in  std_logic;
    \-mds24\      : out std_logic;
    ob25          : in  std_logic;
    \-mds25\      : out std_logic;
    \-mds26\      : out std_logic;
    ob26          : in  std_logic;
    \-mds27\      : out std_logic;
    ob27          : in  std_logic);
end;

architecture ttl of cadr4_mds is
  signal nc308 : std_logic;
  signal nc309 : std_logic;
  signal nc310 : std_logic;
  signal nc311 : std_logic;
  signal nc312 : std_logic;
  signal nc313 : std_logic;
  signal nc314 : std_logic;
  signal nc315 : std_logic;
  signal nc316 : std_logic;
  signal nc317 : std_logic;
  signal nc318 : std_logic;
  signal nc319 : std_logic;
  signal nc320 : std_logic;
  signal nc321 : std_logic;
begin
  mds_1a11 : sn74s240 port map(aenb_n => \-memdrive.a\, ain0 => \-md31\, bout3 => mem24, ain1 => \-md30\, bout2 => mem25, ain2 => \-md29\, bout1 => mem26, ain3 => \-md28\, bout0 => mem27, bin0 => \-md27\, aout3 => mem28, bin1 => \-md26\, aout2 => mem29, bin2 => \-md25\, aout1 => mem30, bin3 => \-md24\, aout0 => mem31, benb_n => \-memdrive.b\);
  mds_1a15 : sn74s240 port map(aenb_n => \-memdrive.a\, ain0 => \-md7\, bout3 => mem0, ain1 => \-md6\, bout2 => mem1, ain2 => \-md5\, bout1 => mem2, ain3 => \-md4\, bout0 => mem3, bin0 => \-md3\, aout3 => mem4, bin1 => \-md2\, aout2 => mem5, bin2 => \-md1\, aout1 => mem6, bin3 => \-md0\, aout0 => mem7, benb_n => \-memdrive.b\);
  mds_1a17 : sn74s240 port map(aenb_n => \-memdrive.a\, ain0 => \-md23\, bout3 => mem16, ain1 => \-md22\, bout2 => mem17, ain2 => \-md21\, bout1 => mem18, ain3 => \-md20\, bout0 => mem19, bin0 => \-md19\, aout3 => mem20, bin1 => \-md18\, aout2 => mem21, bin2 => \-md17\, aout1 => mem22, bin3 => \-md16\, aout0 => mem23, benb_n => \-memdrive.b\);
  mds_1a19 : sn74s240 port map(aenb_n => \-memdrive.a\, ain0 => \-md15\, bout3 => mem8, ain1 => \-md14\, bout2 => mem9, ain2 => \-md13\, bout1 => mem10, ain3 => \-md12\, bout0 => mem11, bin0 => \-md11\, aout3 => mem12, bin1 => \-md10\, aout2 => mem13, bin2 => \-md9\, aout1 => mem14, bin3 => \-md8\, aout0 => mem15, benb_n => \-memdrive.b\);
  mds_1a28 : sn74s258 port map(sel    => mdsela, d0 => mem20, d1 => ob20, dy => \-mds20\, c0 => mem21, c1 => ob21, cy => \-mds21\, by => \-mds22\, b1 => ob22, b0 => mem22, ay => \-mds23\, a1 => ob23, a0 => mem23, enb_n => gnd);
  mds_1a30 : sn74s258 port map(sel    => mdsela, d0 => mem28, d1 => ob28, dy => \-mds28\, c0 => mem29, c1 => ob29, cy => \-mds29\, by => \-mds30\, b1 => ob30, b0 => mem30, ay => \-mds31\, a1 => ob31, a0 => mem31, enb_n => gnd);
  mds_1b05 : sn74s240 port map(aenb_n => \-memdrive.a\, ain0 => nc308, bout3 => nc309, ain1 => nc310, bout2 => nc311, ain2 => nc312, bout1 => nc313, ain3 => mdparodd, bout0 => nc314, bin0 => nc315, aout3 => \mempar_out\, bin1 => nc316, aout2 => nc317, bin2 => nc318, aout1 => nc319, bin3 => nc320, aout0 => nc321, benb_n => hi11);
  mds_1b27 : sn74s258 port map(sel    => mdselb, d0 => mem12, d1 => ob12, dy => \-mds12\, c0 => mem13, c1 => ob13, cy => \-mds13\, by => \-mds14\, b1 => ob14, b0 => mem14, ay => \-mds15\, a1 => ob15, a0 => mem15, enb_n => gnd);
  mds_1b30 : sn74s258 port map(sel    => mdsela, d0 => mem16, d1 => ob16, dy => \-mds16\, c0 => mem17, c1 => ob17, cy => \-mds17\, by => \-mds18\, b1 => ob18, b0 => mem18, ay => \-mds19\, a1 => ob19, a0 => mem19, enb_n => gnd);
  mds_1c26 : sn74s258 port map(sel    => mdselb, d0 => mem8, d1 => ob8, dy => \-mds8\, c0 => mem9, c1 => ob9, cy => \-mds9\, by => \-mds10\, b1 => ob10, b0 => mem10, ay => \-mds11\, a1 => ob11, a0 => mem11, enb_n => gnd);
  mds_1c29 : sn74s258 port map(sel    => mdselb, d0 => mem0, d1 => ob0, dy => \-mds0\, c0 => mem1, c1 => ob1, cy => \-mds1\, by => \-mds2\, b1 => ob2, b0 => mem2, ay => \-mds3\, a1 => ob3, a0 => mem3, enb_n => gnd);
  mds_2b02 : sn74s258 port map(sel    => mdselb, d0 => mem4, d1 => ob4, dy => \-mds4\, c0 => mem5, c1 => ob5, cy => \-mds5\, by => \-mds6\, b1 => ob6, b0 => mem6, ay => \-mds7\, a1 => ob7, a0 => mem7, enb_n => gnd);
  mds_2b05 : sn74s258 port map(sel    => mdsela, d0 => mem24, d1 => ob24, dy => \-mds24\, c0 => mem25, c1 => ob25, cy => \-mds25\, by => \-mds26\, b1 => ob26, b0 => mem26, ay => \-mds27\, a1 => ob27, a0 => mem27, enb_n => gnd);
end architecture;
