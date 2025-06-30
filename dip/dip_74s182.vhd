library ieee;
use ieee.std_logic_1164.all;

use work.sn74.sn74s182;

entity dip_74s182 is
  port (
    p7  : out std_logic; -- XOUT
    p10 : out std_logic; -- YOUT
    p6  : in  std_logic; -- X3
    p5  : in  std_logic; -- Y3
    
    p9  : out std_logic; -- COUT2 (active low)
    p15 : in  std_logic; -- X2
    p14 : in  std_logic; -- Y2

    p11 : out std_logic; -- COUT1 (active low)
    p2  : in  std_logic; -- X1
    p1  : in  std_logic; -- Y1
    
    p12 : out std_logic; -- COUT0 (active low)
    p4  : in  std_logic; -- X0
    p3  : in  std_logic; -- Y0
    
    p13 : in  std_logic
    );
end entity;

architecture dip of dip_74s182 is
begin
  U1 : sn74s182
    port map (
          Xo_e    => p7,
    Yo_e    => p10,
      CNZ_e   => p9,
      CNY_e   => p11,
      CNX_e   => p12,
      X_e     => p6 & p15 & p2 & p4,  -- X[3:0] = p6,p15,p2,p4
      Y_e     => p5 & p14 & p1 & p3,  -- Y[3:0] = p5,p14,p1,p3
      CN_e    => p13
      );
end architecture;
