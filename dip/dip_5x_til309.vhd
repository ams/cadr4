library ieee;
use ieee.std_logic_1164.all;

use std.textio.all;

library work;
use work.other.all;

entity dip_5x_til309 is
  port (        
    p1 : in std_logic; --  pc0
    p2 : in std_logic;
    p3 : in std_logic;
    p4 : in std_logic;
    p5 : in std_logic;
    p6 : in std_logic;
    p7 : in std_logic;
    p8 : in std_logic;
    p9 : in std_logic;
    p10 : in std_logic;
    p11 : in std_logic;
    p12 : in std_logic;
    p13 : in std_logic;
    p14 : in std_logic; -- pc13
    p15 : in std_logic; -- promenable
    p16 : in std_logic; -- ipe
    p17 : in std_logic; -- dpe
    p18 : in std_logic; -- tilt0 
    p19 : in std_logic -- tilt1
    );
end entity;

architecture behavioral of dip_5x_til309 is
begin
  process (all)
    variable l : line;
    variable disp0 : std_logic_vector(2 downto 0);
    variable disp1 : std_logic_vector(2 downto 0);
    variable disp2 : std_logic_vector(2 downto 0);
    variable disp3 : std_logic_vector(2 downto 0);
    variable disp4 : std_logic_vector(2 downto 0);
  begin
    write(l, to_ostring(p3 & p2 & p1));
    write(l, to_ostring(p6 & p5 & p4));
    write(l, to_ostring(p9 & p8 & p7));
    write(l, to_ostring(p12 & p11 & p10));
    write(l, to_ostring('0' & p14 & p13));

    if p15 = '1' then
      write(l, String'(" PROMENABLE "));
    else
      write(l, String'(" promenable "));
    end if;

    if p16 = '1' then
      write(l, String'("IPE "));
    else
      write(l, String'("ipe "));
    end if;

    if p17 = '1' then 
      write(l, String'("DPE "));
    else
      write(l, String'("dpe "));
    end if;

    if p18 = '1' then
      write(l, String'("TILT0 "));
    else
      write(l, String'("tilt0 "));
    end if;

    if p19 = '1' then
      write(l, String'("TILT1 "));
    else
      write(l, String'("tilt1 "));
    end if;

    write(l, now, justified => RIGHT, field => 10, UNIT => ns);

    writeline(output, l);

  end process;

end architecture;
