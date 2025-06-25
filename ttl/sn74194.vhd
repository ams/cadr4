-- 4-Bit Bidirectional Universal Shift Registers

library ieee;
use ieee.std_logic_1164.all;

entity sn74194 is
  port (
    clk : in std_logic; -- Pin 11

    sil   : in std_logic; -- Pin 7 (SL SER)
    sir   : in std_logic; -- Pin 2 (SR SER)
    clr_n : in std_logic; -- Pin 1 (CLR)

    i0 : in std_logic; -- Pin 3 (A)
    i1 : in std_logic; -- Pin 4 (B)
    i2 : in std_logic; -- Pin 5 (C)
    i3 : in std_logic; -- Pin 6 (D)
    s0 : in std_logic; -- Pin 9 (S0)
    s1 : in std_logic; -- Pin 10 (S1)

    q0 : out std_logic; -- Pin 15 (QA)
    q1 : out std_logic; -- Pin 14 (QB)
    q2 : out std_logic; -- Pin 13 (QC)
    q3 : out std_logic  -- Pin 12 (QD)
    );
end;

architecture ttl of sn74194 is
  signal clk_i, sil_i, sir_i, clr_n_i, i0_i, i1_i, i2_i, i3_i, s0_i, s1_i : std_logic;
  signal reg : std_logic_vector(3 downto 0) := (others => '0');
begin

  clk_i <= 'H';
  sil_i <= 'H';
  sir_i <= 'H';
  clr_n_i <= 'H';
  i0_i <= 'H';
  i1_i <= 'H';
  i2_i <= 'H';
  i3_i <= 'H';
  s0_i <= 'H';
  s1_i <= 'H';

  clk_i <= clk;
  sil_i <= sil;
  sir_i <= sir;
  clr_n_i <= clr_n;
  i0_i <= i0;
  i1_i <= i1;
  i2_i <= i2;
  i3_i <= i3;
  s0_i <= s0;
  s1_i <= s1;

  process(all)
    variable sel : std_logic_vector(1 downto 0);
  begin
    if to_x01(clr_n_i) = '0' then
      reg <= (others => '0');
    elsif to_x01(clr_n_i) = 'X' then
      reg <= (others => 'X');
    elsif rising_edge(clk_i) then
      sel := s1_i & s0_i;
      case sel is
        when "00"   => null;                              -- hold
        when "01"   => reg <= sir_i & reg(3 downto 1);    -- shift right
        when "10"   => reg <= reg(2 downto 0) & sil_i;    -- shift left
        when others => reg <= i3_i & i2_i & i1_i & i0_i;  -- load
      end case;
    end if;
  end process;

  q3 <= reg(3); q2 <= reg(2); q1 <= reg(1); q0 <= reg(0);
end;
