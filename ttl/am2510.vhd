-- AM2510 Four-Bit Shifter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am2510 is
  port (
    sel1 : in  std_logic; -- pin 9
    sel0 : in  std_logic; -- pin 10
    ce_n : in  std_logic; -- pin 13
    i3   : in  std_logic; -- pin 7
    i2   : in  std_logic; -- pin 6
    i1   : in  std_logic; -- pin 5
    i0   : in  std_logic; -- pin 4
    i_1  : in  std_logic; -- pin 3
    i_2  : in  std_logic; -- pin 2
    i_3  : in  std_logic; -- pin 1
    o0   : out std_logic; -- pin 15
    o1   : out std_logic; -- pin 14
    o2   : out std_logic; -- pin 12
    o3   : out std_logic -- pin 11
    );
end am2510;

architecture ttl of am2510 is
begin

  process (sel0, sel1, ce_n, i3, i2, i1, i0, i_1, i_2, i_3)
    variable sel : unsigned(1 downto 0);
  begin
    sel := sel0 & sel1;

    if ce_n = '1' then
      o0 <= 'Z'; o1 <= 'Z'; o2 <= 'Z'; o3 <= 'Z';
    else
      case sel is
        when "00"   => o0 <= i0; o1 <= i1; o2 <= i2; o3 <= i3;
        when "01"   => o0 <= i_1; o1 <= i0; o2 <= i1; o3 <= i2;
        when "10"   => o0 <= i_2; o1 <= i_1; o2 <= i0; o3 <= i1;
        when "11"   => o0 <= i_3; o1 <= i_2; o2 <= i_1; o3 <= i0;
        when others => o0 <= 'Z'; o1 <= 'Z'; o2 <= 'Z'; o3 <= 'Z';
      end case;
    end if;
  end process;

end;
