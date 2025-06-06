-- 4-Bit Bidirectional Universal Shift Registers
-- SN74194 4-Bit Bidirectional Universal Shift Register

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74194 is
  port (
    clk : in std_logic;

    sil   : in std_logic;
    sir   : in std_logic;
    clr_n : in std_logic;

    i0 : in std_logic;
    i1 : in std_logic;
    i2 : in std_logic;
    i3 : in std_logic;
    s0 : in std_logic;
    s1 : in std_logic;

    q0 : out std_logic;
    q1 : out std_logic;
    q2 : out std_logic;
    q3 : out std_logic
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
        when "00"   => null;                          -- hold
        when "01"   => reg <= sir & reg(3 downto 1);  -- shift right
        when "10"   => reg <= reg(2 downto 0) & sil;  -- shift left
        when others => reg <= i3 & i2 & i1 & i0;      -- load
      end case;
    end if;
  end process;

  q3 <= reg(3); q2 <= reg(2); q1 <= reg(1); q0 <= reg(0);
end;
