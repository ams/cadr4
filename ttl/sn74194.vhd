-- 4-Bit Bidirectional Universal Shift Registers

library ieee;
use ieee.std_logic_1164.all;

entity sn74194 is
  port (
    clk : in std_logic := 'H'; -- Pin 11

    sil   : in std_logic := 'H'; -- Pin 7 (SL SER)
    sir   : in std_logic := 'H'; -- Pin 2 (SR SER)
    clr_n : in std_logic := 'H'; -- Pin 1 (CLR)

    i0 : in std_logic := 'H'; -- Pin 3 (A)
    i1 : in std_logic := 'H'; -- Pin 4 (B)
    i2 : in std_logic := 'H'; -- Pin 5 (C)
    i3 : in std_logic := 'H'; -- Pin 6 (D)
    s0 : in std_logic := 'H'; -- Pin 9 (S0)
    s1 : in std_logic := 'H'; -- Pin 10 (S1)

    q0 : out std_logic; -- Pin 15 (QA)
    q1 : out std_logic; -- Pin 14 (QB)
    q2 : out std_logic; -- Pin 13 (QC)
    q3 : out std_logic  -- Pin 12 (QD)
    );
end;

architecture ttl of sn74194 is
  signal reg : std_logic_vector(3 downto 0);
begin
  process(all)
    variable sel : std_logic_vector(1 downto 0);
  begin
    if to_x01(clr_n) = '0' then
      reg <= (others => '0');
    elsif to_x01(clr_n) = 'X' then
      reg <= (others => 'X');
    elsif rising_edge(clk) then
      sel := s1 & s0;
      case sel is
        when "00"   => null;                          -- hold
        when "01"   => reg <= sir & reg(3 downto 1);  -- shift right
        when "10"   => reg <= reg(2 downto 0) & sil;  -- shift left
        when others => reg <= i3 & i2 & i1 & i0;      -- load
      end case;
    end if;
  end process;

  q3 <= reg(3); q2 <= reg(2); q1 <= reg(1); q0 <= reg(0);
end;
