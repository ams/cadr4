-- Four-Bit Shifter With Three-State Outputs

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am2510 is
  port (
    sel1, sel0                    : in  std_logic;
    ce_n                          : in  std_logic;
    i3, i2, i1, i0, i_1, i_2, i_3 : in  std_logic;
    o0, o1, o2, o3                : out std_logic
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
