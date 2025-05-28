-- 4-Bit Bidirectional Universal Shift Registers
-- SN74194 4-Bit Bidirectional Universal Shift Register

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This is a 4-Bit Bidirectional Universal Shift Register
entity sn74194 is
  port (
    clk     : in std_logic; -- Pin 11 (Clock Input)

    sil     : in std_logic; -- Pin 7 (Shift Left Serial Input)
    sir     : in std_logic; -- Pin 2 (Shift Right Serial Input)
    clr_n   : in std_logic; -- Pin 1 (Master Clear Input Active Low)

    i0      : in std_logic; -- Pin 3 (Parallel Input A)
    i1      : in std_logic; -- Pin 4 (Parallel Input B)
    i2      : in std_logic; -- Pin 5 (Parallel Input C)
    i3      : in std_logic; -- Pin 6 (Parallel Input D)
    s0      : in std_logic; -- Pin 9 (Mode Control S0)
    s1      : in std_logic; -- Pin 10 (Mode Control S1)

    q0      : out std_logic; -- Pin 15 (Parallel Output QA)
    q1      : out std_logic; -- Pin 14 (Parallel Output QB)
    q2      : out std_logic; -- Pin 13 (Parallel Output QC)
    q3      : out std_logic  -- Pin 12 (Parallel Output QD)
    );
end;

-- ChatGPT Codex implementation
architecture ttl of sn74194 is
  signal reg : std_logic_vector(3 downto 0) := (others => '0');
begin
  process(clk, clr_n)
    variable sel : std_logic_vector(1 downto 0);
  begin
    if clr_n = '0' then
      reg <= (others => '0');
    elsif rising_edge(clk) then
      sel := s1 & s0;
      case sel is
        when "00"   => null;                  -- hold
        when "01"   => reg <= sir & reg(3 downto 1);       -- shift right
        when "10"   => reg <= reg(2 downto 0) & sil;       -- shift left
        when others => reg <= i3 & i2 & i1 & i0;             -- load
      end case;
    end if;
  end process;

  q3 <= reg(3); q2 <= reg(2); q1 <= reg(1); q0 <= reg(0);
end;
