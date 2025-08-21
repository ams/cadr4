-- DIP 74S181 Arithmetic Logic Unit
-- 20-pin DIP package

library ieee;
use ieee.std_logic_1164.all;

use work.sn74.sn74181;

entity dip_74s181 is
  port (    
    p16 : out std_logic; -- CN+4 (carry out, active low)
    p17 : out std_logic; -- Y (carry generate)
    p15 : out std_logic; -- X (carry propagate)
    p14 : out std_logic; -- A=B

    p13 : out std_logic; -- F3
    p11 : out std_logic; -- F2
    p10 : out std_logic; -- F1
    p9  : out std_logic; -- F0
    
    
    p18 : in  std_logic; -- B3
    p20 : in  std_logic; -- B2
    p22 : in  std_logic; -- B1
    p1  : in  std_logic; -- B0

    p19 : in  std_logic; -- A3
    p21 : in  std_logic; -- A2
    p23 : in  std_logic; -- A1
    p2  : in  std_logic; -- A0
    
    p8  : in  std_logic; -- M (mode)
    p3  : in  std_logic; -- S3
    p4  : in  std_logic; -- S2
    p5  : in  std_logic; -- S1
    p6  : in  std_logic; -- S0

    p7  : in  std_logic  -- CN (carry in, active low)
    
  );
end entity;

architecture structural of dip_74s181 is
  signal s_f : std_logic_vector(3 downto 0);
begin
  U1 : sn74181
    port map (
      CN4b_e => p16,
      Y_e    => p17,
      X_e    => p15,
      AEB_e  => p14,
      F_e    => s_f,
      B_e    => p18 & p20 & p22 & p1,
      A_e    => p19 & p21 & p23 & p2,
      M_e    => p8,
      S_e    => p3 & p4 & p5 & p6,
      CNb_e  => p7
    );
    
  -- Output assignments
  p13 <= s_f(3); -- F3
  p11 <= s_f(2); -- F2
  p10 <= s_f(1); -- F1
  p9  <= s_f(0); -- F0
  
end architecture;
