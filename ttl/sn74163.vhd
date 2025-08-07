-- Synchronous 4-Bit Binary Counter
-- SN74163 with synchronous clear

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.misc.all;

entity sn74163 is
  port (
    -- Control and status
    tc      : out std_logic;  -- Terminal count
    clk     : in  std_logic;  -- Clock
    clr_n   : in  std_logic;  -- Synchronous clear (active low)
    pe_n    : in  std_logic;  -- Parallel enable (active low)
    enb_p   : in  std_logic;  -- Count enable parallel
    enb_t   : in  std_logic;  -- Count enable trickle
    
    -- Data inputs (parallel load)
    i3, i2, i1, i0 : in  std_logic;
    
    -- Data outputs
    d3, d2, d1, d0 : out std_logic
    );
end;

architecture behavioral of sn74163 is
  signal clk_i, clr_n_i, pe_n_i, enb_p_i, enb_t_i, i3_i, i2_i, i1_i, i0_i : std_logic;
  signal cnt : unsigned(3 downto 0) := (others => '0');    -- internal 4-bit register
  
  -- Named constants for better readability
  constant COUNT_WIDTH    : natural := 4;
  constant MAX_COUNT      : natural := 15;  -- 2^COUNT_WIDTH - 1
begin

  clk_i <= ttl_input(clk);
  clr_n_i <= ttl_input(clr_n);
  pe_n_i <= ttl_input(pe_n);
  enb_p_i <= ttl_input(enb_p);
  enb_t_i <= ttl_input(enb_t);
  i3_i <= ttl_input(i3);
  i2_i <= ttl_input(i2);
  i1_i <= ttl_input(i1);
  i0_i <= ttl_input(i0);

  ------------------------------------------------------------------
  -- synchronous logic
  ------------------------------------------------------------------
  process(all)
    variable load_val : unsigned(3 downto 0);
  begin
    if rising_edge(clk_i) then
      -- synchronous clear has highest priority
      if clr_n_i = '0' then
        cnt <= (others => '0');
        
      -- synchronous parallel load has next priority
      elsif pe_n_i = '0' then
        load_val := unsigned(std_logic_vector'(i3_i & i2_i & i1_i & i0_i));
        cnt      <= load_val;

      -- otherwise count when both enables are asserted (high)
      elsif (enb_t_i = '1' and enb_p_i = '1') then
        cnt <= cnt + 1;               -- up-count (wraps 15→0)
      end if;
    -- if enables are not both high, the register simply holds
    end if;
  end process;

  ------------------------------------------------------------------
  -- pin drivers
  ------------------------------------------------------------------
  d0 <= cnt(0);
  d1 <= cnt(1);
  d2 <= cnt(2);
  d3 <= cnt(3);

  -- terminal count generation
  -- TC is high when:
  -- 1. Both enables are active (high)
  -- 2. Counter is at terminal count (15 for binary counter)
  process(all)
    variable at_terminal_count : boolean;
    variable cnt_std : std_logic_vector(3 downto 0);
  begin
    -- Convert counter to std_logic_vector for metavalue checking
    cnt_std := std_logic_vector(cnt);
    
    -- Initialize variable
    at_terminal_count := false;
    
    -- Check if counter is at terminal count (only if counter is valid)
    if not is_x(cnt_std) then
      at_terminal_count := (cnt_std = "1111");  -- binary terminal count (15)
    end if;
    
    -- Generate terminal count output
    if (enb_t_i = '1' and enb_p_i = '1') and at_terminal_count then
      tc <= '1';  -- Active high terminal count
    else
      tc <= '0';  -- Not at terminal count
    end if;
  end process;
end architecture;
