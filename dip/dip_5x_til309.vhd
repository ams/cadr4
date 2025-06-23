library ieee;
use ieee.std_logic_1164.all;

library work;
use work.other.all;

entity dip_5x_til309 is
  port (
    pc0 : in std_logic;
    pc1 : in std_logic;
    pc2 : in std_logic;
    pc3 : in std_logic;
    pc4 : in std_logic;
    pc5 : in std_logic;
    pc6 : in std_logic;
    pc7 : in std_logic;
    pc8 : in std_logic;
    pc9 : in std_logic;
    pc10 : in std_logic;
    pc11 : in std_logic;
    pc12 : in std_logic;
    pc13 : in std_logic;
    promenable : in std_logic;
    ipe : in std_logic;
    dpe : in std_logic;
    tilt0 : in std_logic;
    tilt1 : in std_logic
    );
end entity;

architecture behavioral of dip_5x_til309 is
begin
  process (all)
    variable disp0 : std_logic_vector(2 downto 0);
    variable disp1 : std_logic_vector(2 downto 0);
    variable disp2 : std_logic_vector(2 downto 0);
    variable disp3 : std_logic_vector(2 downto 0);
    variable disp4 : std_logic_vector(2 downto 0);
    variable promenable_txt : string(8 downto 0);
    variable ipe_txt : string(8 downto 0);
    variable dpe_txt : string(8 downto 0);
    variable tilt0_txt : string(8 downto 0);
    variable tilt1_txt : string(8 downto 0);
  begin
    disp0 := pc2 & pc1 & pc0;
    disp1 := pc5 & pc4 & pc3;
    disp2 := pc8 & pc7 & pc6;
    disp3 := pc11 & pc10 & pc9;
    disp4 := pc13 & pc12;
    
    if promenable = '1' then
      promenable_txt := "PROMENABLE ";
    else
      promenable_txt := "promenable ";
    end if;

    if ipe = '1' then
      ipe_txt := "IPE ";
    else
      ipe_txt := "ipe ";
    end if;

    if dpe = '1' then 
      dpe_txt := "DPE ";
    else
      dpe_txt := "dpe ";
    end if;

    if tilt0 = '1' then
      tilt0_txt := "TILT0 ";
    else
      tilt0_txt := "tilt0 ";
    end if;

    if tilt1 = '1' then
      tilt1_txt := "TILT1 ";
    else
      tilt1_txt := "tilt1 ";
    end if;

    report to_string(disp4) & to_string(disp3) & to_string(disp2) & to_string(disp1) & to_string(disp0);
    report promenable_txt & ipe_txt & dpe_txt & tilt0_txt & tilt1_txt;

  end process;

end architecture;
