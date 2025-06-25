-- Four-Bit Shifter with Three-State Outputs
-- AMD Am25S10
-- doc/ttl/am25s10.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am25s10 is
  port (
    sel1 : in  std_logic;
    sel0 : in  std_logic;
    ce_n : in  std_logic;
    i3   : in  std_logic;
    i2   : in  std_logic;
    i1   : in  std_logic;
    i0   : in  std_logic;
    i_1  : in  std_logic;
    i_2  : in  std_logic;
    i_3  : in  std_logic;
    o0   : out std_logic;
    o1   : out std_logic;
    o2   : out std_logic;
    o3   : out std_logic
    );
end entity;

architecture ttl of am25s10 is
  signal sel1_i, sel0_i, ce_n_i, i3_i, i2_i, i1_i, i0_i, i_1_i, i_2_i, i_3_i : std_logic;
begin

  sel1_i <= 'H';
  sel0_i <= 'H';
  ce_n_i <= 'H';
  i3_i <= 'H';
  i2_i <= 'H';
  i1_i <= 'H';
  i0_i <= 'H';
  i_1_i <= 'H';
  i_2_i <= 'H';
  i_3_i <= 'H';

  sel1_i <= sel1;
  sel0_i <= sel0;
  ce_n_i <= ce_n;
  i3_i <= i3;
  i2_i <= i2;
  i1_i <= i1;
  i0_i <= i0;
  i_1_i <= i_1;
  i_2_i <= i_2;
  i_3_i <= i_3;

  process (all)
    variable sel : unsigned(1 downto 0);
  begin    
    if to_x01(ce_n_i) = '0' then
      sel := sel1_i & sel0_i;
      case sel is
        when "00"   => o3 <= i3_i;  o2 <= i2_i;  o1 <= i1_i;  o0 <= i0_i;    -- no shift
        when "01"   => o3 <= i2_i;  o2 <= i1_i;  o1 <= i0_i;  o0 <= i_1_i;   -- shift right by 1
        when "10"   => o3 <= i1_i;  o2 <= i0_i;  o1 <= i_1_i; o0 <= i_2_i;   -- shift right by 2
        when "11"   => o3 <= i0_i;  o2 <= i_1_i; o1 <= i_2_i; o0 <= i_3_i;   -- shift right by 3
        when others => o3 <= 'X'; o2 <= 'X'; o1 <= 'X'; o0 <= 'X';
      end case;
    elsif to_x01(ce_n_i) = '1' then
      o0 <= 'Z'; o1 <= 'Z'; o2 <= 'Z'; o3 <= 'Z';
    else
      o0 <= 'X'; o1 <= 'X'; o2 <= 'X'; o3 <= 'X';
    end if;
  end process;

end architecture;
