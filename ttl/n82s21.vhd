-- 32x2 WWRM (Write-While-Read Memory) RAM
-- Signetics N82S21
-- doc/ttl/n82s21.pdf

-- A Write While Read Memory element is a RAM provided with output latches,
-- in such a way that (read out) data may be retained in the latches either
-- when the chip is disabled or when new information has to be written in
-- the memory.
--
-- Truth table (CE, C, W0, W1, L):
--   X X X X 0  output hold: the word latched when L went from 1 to 0,
--              regardless of CE, address and control inputs
--   0 X X X 1  read and write disabled, outputs off (logic 1)
--   1 1 X X X  read: data stored in the addressed word
--   1 0 1 1 X  read: data stored in the addressed word
--   1 0 0 0 1  write: the data being written is at the outputs
--   1 0 1 0 X  write into bit 0 only (bit 1 is read)
--   1 0 0 1 X  write into bit 1 only (bit 0 is read)
--
-- The write is level sensitive: while CE=1, C=0 and Wx=0 the addressed bit
-- follows the data input; the data present when the write window closes
-- (C or Wx going high) is what stays stored. Address setup is required before
-- the window opens and address hold after it closes is 0 ns, so a word
-- addressed while the window is open is written.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.misc.all;

entity n82s21 is
  generic (fn : string := "");
  port (
    a0     : in  std_logic; -- 13
    a1     : in  std_logic; -- 12
    a2     : in  std_logic; -- 11
    a3     : in  std_logic; -- 10
    a4     : in  std_logic; -- 4
    ce     : in  std_logic; -- 5
    d0     : out std_logic; -- 7 (O0, open collector)
    d1     : out std_logic; -- 9 (O1, open collector)
    i0     : in  std_logic; -- 3
    i1     : in  std_logic; -- 14
    latch_n: in  std_logic; -- 6 (L)
    wclk_n : in  std_logic; -- 1 (C, write control)
    we0_n  : in  std_logic; -- 2 (W0)
    we1_n  : in  std_logic  -- 15 (W1)
    );
end entity;

architecture behavioral of n82s21 is
  signal a0_i, a1_i, a2_i, a3_i, a4_i, ce_i, i0_i, i1_i, latch_n_i, wclk_n_i, we0_n_i, we1_n_i : std_logic;
  signal ram : work.misc.word_array_t(0 to 31)(1 downto 0) := load_hex_file(fn, 32, 2);
  -- output latch: transparent while L=1, holds while L=0
  signal latched : std_logic_vector(1 downto 0) := (others => '0');
begin

  a0_i <= ttl_input(a0);
  a1_i <= ttl_input(a1);
  a2_i <= ttl_input(a2);
  a3_i <= ttl_input(a3);
  a4_i <= ttl_input(a4);
  ce_i <= ttl_input(ce);
  i0_i <= ttl_input(i0);
  i1_i <= ttl_input(i1);
  latch_n_i <= ttl_input(latch_n);
  wclk_n_i <= ttl_input(wclk_n);
  we0_n_i <= ttl_input(we0_n);
  we1_n_i <= ttl_input(we1_n);

  ------------------------------------------------------------------
  -- level-sensitive write: while CE=1 and C=0, each bit with Wx=0
  -- follows its data input
  ------------------------------------------------------------------
  process(all)
    variable addr : unsigned(4 downto 0);
  begin
    addr := a4_i & a3_i & a2_i & a1_i & a0_i;
    if ce_i = '1' and wclk_n_i = '0' and not is_x(addr) then
      if we0_n_i = '0' then
        ram(to_integer(addr))(0) <= i0_i;
      end if;
      if we1_n_i = '0' then
        ram(to_integer(addr))(1) <= i1_i;
      end if;
    end if;
  end process;

  ------------------------------------------------------------------
  -- read data and output latch
  -- The live read data is the addressed word with CE=1 (including the data
  -- being written) and all ones (outputs off) with CE=0. The latch passes
  -- the live data while L=1 and holds it while L=0, whatever CE and the
  -- address do meanwhile.
  ------------------------------------------------------------------
  process(all)
    variable addr : unsigned(4 downto 0);
    variable live : std_logic_vector(1 downto 0);
  begin
    addr := a4_i & a3_i & a2_i & a1_i & a0_i;
    if ce_i = '1' then
      if is_x(addr) then
        live := (others => 'X');
      else
        live := ram(to_integer(addr));
      end if;
    elsif ce_i = '0' then
      live := (others => '1');
    else
      live := (others => 'X');
    end if;

    if latch_n_i = '1' then
      latched <= live;
    elsif latch_n_i = '0' then
      null;  -- hold
    else
      latched <= (others => 'X');
    end if;
  end process;

  ------------------------------------------------------------------
  -- open-collector outputs: drive low for '0', float for '1'
  -- (an external pull-up resistor is required for a high level)
  ------------------------------------------------------------------
  d0 <= '0' when latched(0) = '0' else 'Z' when latched(0) = '1' else latched(0);
  d1 <= '0' when latched(1) = '0' else 'Z' when latched(1) = '1' else latched(1);

end architecture;
