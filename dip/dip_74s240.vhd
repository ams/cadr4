library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library ttl;
	use ttl.sn74.all;
	use ttl.other.all;

      entity <dip-name> is port (
        <dip-pin-name> : <direction> std_logic;
        ...
        );
      end component;

      architecture dip of <dip-name> is
      begin
        ttl : <ttl-name> port map (<dip-pin-name> => <ttl-pin-name>, ...);
      end;
entity dip_74s240 is port (             -- sn74240 [74s240]
  p1  : in  std_logic;                  -- aenb_n
  p2  : in  std_logic;                  -- ain0
  p3  : out std_logic;                  -- bout3
  p4  : in  std_logic;                  -- ain1
  p5  : out std_logic;                  -- bout2
  p6  : in  std_logic;                  -- ain2
  p7  : out std_logic;                  -- bout1
  p8  : in  std_logic;                  -- ain3
  p9  : out std_logic;                  -- bout0
  p11 : in  std_logic;                  -- bin0
  p12 : out std_logic;                  -- aout3
  p13 : in  std_logic;                  -- bin1
  p14 : out std_logic;                  -- aout2
  p15 : in  std_logic;                  -- bin2
  p16 : out std_logic;                  -- aout1
  p17 : in  std_logic;                  -- bin3
  p18 : out std_logic;                  -- aout0
  p19 : in  std_logic                   -- benb_n
  );
end;

architecture dip of dip_74s240 is
begin
  ttl : sn74240 port map (p1 => aenb_n, p2 => ain0, p3 => bout3, p4 => ain1, p5 => bout2, p6 => ain2, p7 => bout1, p8 => ain3, p9 => bout0, p11 => bin0, p12 => aout3, p13 => bin1, p14 => aout2, p15 => bin2, p16 => aout1, p17 => bin3, p18 => aout0, p19 => benb_n);
end;
