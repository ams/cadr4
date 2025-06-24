-- Four-Bit Shifter with Three-State Outputs
-- AMD Am25S10
-- doc/ttl/am25s10.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am25s10 is
  port (
    sel1 : in  std_logic := 'H';
    sel0 : in  std_logic := 'H';
    ce_n : in  std_logic := 'H';
    i3   : in  std_logic := 'H';
    i2   : in  std_logic := 'H';
    i1   : in  std_logic := 'H';
    i0   : in  std_logic := 'H';
    i_1  : in  std_logic := 'H';
    i_2  : in  std_logic := 'H';
    i_3  : in  std_logic := 'H';
    o0   : out std_logic;
    o1   : out std_logic;
    o2   : out std_logic;
    o3   : out std_logic
    );
end entity;

architecture ttl of am25s10 is
begin

  process (all)
    variable sel : unsigned(1 downto 0);
  begin    
    if ce_n = '0' then
      sel := sel0 & sel1;
      case sel is
        when "00"   => o0 <= i0; o1 <= i1; o2 <= i2; o3 <= i3;
        when "01"   => o0 <= i_1; o1 <= i0; o2 <= i1; o3 <= i2;
        when "10"   => o0 <= i_2; o1 <= i_1; o2 <= i0; o3 <= i1;
        when "11"   => o0 <= i_3; o1 <= i_2; o2 <= i_1; o3 <= i0;
        when others => o0 <= 'X'; o1 <= 'X'; o2 <= 'X'; o3 <= 'X';
      end case;
    else
      o0 <= 'Z'; o1 <= 'Z'; o2 <= 'Z'; o3 <= 'Z';
    end if;
  end process;

end architecture;
