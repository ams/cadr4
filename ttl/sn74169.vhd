-- Synchronous 4-Bit Up/Down Binary Counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.misc.all;

entity sn74169 is
  port (
    -- Control and status
    co_n    : out std_logic;  -- Carry out (active low)
    clk     : in  std_logic;  -- Clock
    up_dn   : in  std_logic;  -- Up/Down control
    load_n  : in  std_logic;  -- Parallel load enable (active low)
    enb_p_n : in  std_logic;  -- Count enable parallel (active low)
    enb_t_n : in  std_logic;  -- Count enable trickle (active low)
    
    -- Data inputs (parallel load)
    i3, i2, i1, i0 : in  std_logic;
    
    -- Data outputs
    o3, o2, o1, o0 : out std_logic
    );
end entity;

architecture behavioral of sn74169 is
  signal clk_i, up_dn_i, load_n_i, enb_p_n_i, enb_t_n_i, i3_i, i2_i, i1_i, i0_i : std_logic;
  signal cnt : unsigned(3 downto 0) := (others => '0');    -- internal 4-bit register
  
  -- Named constants for better readability
  constant COUNT_WIDTH    : natural := 4;
  constant MAX_COUNT      : natural := 15;  -- 2^COUNT_WIDTH - 1
  constant MIN_COUNT      : natural := 0;
begin

  clk_i <= ttl_input(clk);
  up_dn_i <= ttl_input(up_dn);
  load_n_i <= ttl_input(load_n);
  enb_p_n_i <= ttl_input(enb_p_n);
  enb_t_n_i <= ttl_input(enb_t_n);
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
      -- synchronous parallel load has top priority
      if load_n_i = '0' then
        load_val := unsigned(std_logic_vector'(i3_i & i2_i & i1_i & i0_i));
        cnt      <= load_val;

      -- otherwise count when both enables are asserted (low)
      elsif (enb_t_n_i = '0' and enb_p_n_i = '0') then
        if up_dn_i = '1' then
          cnt <= cnt + 1;               -- up-count (wraps 15→0)
        elsif up_dn_i = '0' then
          cnt <= cnt - 1;               -- down-count (wraps 0→15)
        end if;
      end if;
    -- if enables are not both low, the register simply holds
    end if;
  end process;

  ------------------------------------------------------------------
  -- pin drivers
  ------------------------------------------------------------------
  o3 <= cnt(3);
  o2 <= cnt(2);
  o1 <= cnt(1);
  o0 <= cnt(0);

  -- terminal count / ripple-carry (active-low)
  -- Terminal count occurs when:
  -- 1. Both enables are active (low)
  -- 2. Either:
  --    a. Loading terminal count value (15 for up-count, 0 for down-count)
  --    b. Counter is at terminal count (15 for up-count, 0 for down-count)
  process(all)
    variable at_terminal_count : boolean;
    variable loading_terminal_count : boolean;
    variable cnt_std : std_logic_vector(3 downto 0);
  begin
    -- Convert counter to std_logic_vector for metavalue checking
    cnt_std := std_logic_vector(cnt);
    
    -- Initialize variables
    at_terminal_count := false;
    loading_terminal_count := false;
    
    -- Check if counter is at terminal count (only if counter is valid)
    if not is_x(cnt_std) then
      if up_dn_i = '1' then
        at_terminal_count := (cnt_std = "1111");  -- up-count terminal (15)
      elsif up_dn_i = '0' then
        at_terminal_count := (cnt_std = "0000");  -- down-count terminal (0)
      end if;
    end if;
    
    -- Check if loading a terminal count value
    if load_n_i = '0' then
      if up_dn_i = '1' then
        loading_terminal_count := std_logic_vector'(i3_i & i2_i & i1_i & i0_i) = "1111";  -- loading 15
      elsif up_dn_i = '0' then
        loading_terminal_count := std_logic_vector'(i3_i & i2_i & i1_i & i0_i) = "0000";  -- loading 0
      end if;
    end if;
    
    -- Generate carry-out (active low)
    if (enb_t_n_i = '0' and enb_p_n_i = '0') and (at_terminal_count or loading_terminal_count) then
      co_n <= '0';  -- Active low terminal count
    else
      co_n <= '1';  -- Not at terminal count
    end if;
  end process;
end architecture;
