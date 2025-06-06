-- High Speed Write-While-Read 64-Bit Bipolar RAM (32x2 RAM)
-- Datasheet for DM8221 not found. This VHDL model might be based on a non-standard or custom implementation.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm8221 is
  port (
    a0     : in  std_logic;
    a1     : in  std_logic;
    a2     : in  std_logic;
    a3     : in  std_logic;
    a4     : in  std_logic;
    ce     : in  std_logic;
    d0     : out std_logic;
    d1     : out std_logic;
    i0     : in  std_logic;
    i1     : in  std_logic;
    strobe : in  std_logic;
    wclk_n : in  std_logic;
    we0_n  : in  std_logic;
    we1_n  : in  std_logic
    );
end dm8221;

-- ChatGPT Codex implementation
architecture ttl of dm8221 is
  type ram_t is array (0 to 31) of std_logic_vector(1 downto 0);
  signal ram  : ram_t := (others => (others => '0'));
  signal addr : unsigned(4 downto 0);
begin
  addr <= a4 & a3 & a2 & a1 & a0;

  ------------------------------------------------------------------
  -- write on falling edge of wclk_n
  ------------------------------------------------------------------
  process(wclk_n)
  begin
    if falling_edge(wclk_n) then
      if ce = '1' and strobe = '1' then
        if we0_n = '0' then
          ram(to_integer(addr))(0) <= i0;
        end if;
        if we1_n = '0' then
          ram(to_integer(addr))(1) <= i1;
        end if;
      end if;
    end if;
  end process;

  ------------------------------------------------------------------
  -- asynchronous read
  ------------------------------------------------------------------
  process(all)
    variable word : std_logic_vector(1 downto 0);
  begin
    if ce = '1' then
      word := ram(to_integer(addr));
      d0   <= word(0); d1 <= word(1);
    else
      d0 <= 'Z'; d1 <= 'Z';
    end if;
  end process;
end;
