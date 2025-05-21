-- Arithmetic Logic Units/Function Generators

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74181 is
  port (
    cout_n : out std_logic;
    y      : out std_logic;
    x      : out std_logic;
    aeb    : out std_logic;

    f0, f1, f2, f3 : out std_logic;

    b0, b1, b2, b3 : in std_logic;

    a0, a1, a2, a3 : in std_logic;

    m              : in std_logic;
    s0, s1, s2, s3 : in std_logic;

    cin_n : in std_logic
    );
end;

architecture ttl of sn74181 is
  signal a  : unsigned(3 downto 0);
  signal b  : unsigned(3 downto 0);
  signal sel: unsigned(3 downto 0);
begin
  a   <= a3 & a2 & a1 & a0;
  b   <= b3 & b2 & b1 & b0;
  sel <= s3 & s2 & s1 & s0;

  process(all)
    variable tmp : unsigned(4 downto 0);
  begin
    if m = '0' then
      -- simple arithmetic mode: addition
      tmp := ('0' & a) + ('0' & b) + ("0000" & (not cin_n));
    else
      -- simple logic mode
      case sel is
        when "0000" => tmp := '0' & (a and b);
        when "0001" => tmp := '0' & (a or b);
        when "0010" => tmp := '0' & (a xor b);
        when others  => tmp := '0' & (not (a xor b));
      end case;
    end if;

    f3 <= tmp(3); f2 <= tmp(2); f1 <= tmp(1); f0 <= tmp(0);
    cout_n <= not tmp(4);
    aeb <= '1' when a = b else '0';
    x <= '0';
    y <= '0';
  end process;
end;
