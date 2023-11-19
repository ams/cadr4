-- Data Selectors / Multiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74151 is
  port (
    ce_n                           : in  std_logic;
    sel0, sel1, sel2               : in  std_logic;
    i0, i1, i2, i3, i4, i5, i6, i7 : in  std_logic;
    q, q_n                         : out std_logic
    );
end;

architecture ttl of sn74151 is

  signal sel : std_logic_vector(0 to 2);
  signal i   : std_logic_vector(0 to 7);
  signal q_i : std_logic;

begin

  sel <= sel0 & sel1 & sel2;
  i   <= i(0) &i(1) &i(2) &i(3) &i(4) &i(5) &i(6) &i(7);

  process (ce_n, sel, i)
  begin
    q_i <= 'X';
    if not ce_n then
      case sel is
        when "000"  => q_i <= i0;
        when "001"  => q_i <= i1;
        when "010"  => q_i <= i2;
        when "011"  => q_i <= i3;
        when "100"  => q_i <= i4;
        when "101"  => q_i <= i5;
        when "110"  => q_i <= i6;
        when "111"  => q_i <= i7;
        when others => q_i <= 'X';
      end case;
    end if;
  end process;

  q   <= q_i;
  q_n <= not q_i;

end;
