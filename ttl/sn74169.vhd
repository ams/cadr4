-- Synchronous 4-Bit Up/Down Binary Counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74169 is
  port (
    -- Control and status
    co_n    : out std_logic;  -- Carry out (active low)
    clk     : in  std_logic := 'H';  -- Clock
    up_dn   : in  std_logic := 'H';  -- Up/Down control
    load_n  : in  std_logic := 'H';  -- Parallel load enable (active low)
    enb_p_n : in  std_logic := 'H';  -- Count enable parallel (active low)
    enb_t_n : in  std_logic := 'H';  -- Count enable trickle (active low)
    
    -- Data inputs (parallel load)
    i3, i2, i1, i0 : in  std_logic := 'H';
    
    -- Data outputs
    o3, o2, o1, o0 : out std_logic
    );
end;

architecture ttl of sn74169 is
  signal cnt : unsigned(3 downto 0) := (others => '0');    -- internal 4-bit register
  
  -- Named constants for better readability
  constant COUNT_WIDTH    : natural := 4;
  constant MAX_COUNT      : natural := 15;  -- 2^COUNT_WIDTH - 1
  constant MIN_COUNT      : natural := 0;
begin
  ------------------------------------------------------------------
  -- synchronous logic
  ------------------------------------------------------------------
  process(all)
    variable load_val : unsigned(3 downto 0);
  begin
    if rising_edge(clk) then
      -- synchronous parallel load has top priority
      if load_n = '0' then
        load_val := unsigned(std_logic_vector'(i3 & i2 & i1 & i0));
        cnt      <= load_val;

      -- otherwise count when both enables are asserted (low)
      elsif (to_x01(enb_t_n) = '0' and to_x01(enb_p_n) = '0') then
        if to_x01(up_dn) = '1' then
          cnt <= cnt + 1;               -- up-count (wraps 15→0)
        elsif to_x01(up_dn) = '0' then
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
    variable cnt_is_valid : boolean;
  begin
    -- Check if counter has valid (non-metavalue) content
    cnt_is_valid := not (is_x(std_logic_vector(cnt)));
    
    -- Check if counter is at terminal count (only if counter is valid)
    if cnt_is_valid then
      if to_x01(up_dn) = '1' then
        at_terminal_count := (cnt = to_unsigned(MAX_COUNT, COUNT_WIDTH));  -- up-count terminal
      elsif to_x01(up_dn) = '0' then
        at_terminal_count := (cnt = to_unsigned(MIN_COUNT, COUNT_WIDTH));   -- down-count terminal
      end if;
    else
      at_terminal_count := false;  -- Undefined counter cannot be at terminal count
    end if;
    
    -- Check if loading a terminal count value
    if to_x01(load_n) = '0' then
      if to_x01(up_dn) = '1' then
        loading_terminal_count := (unsigned(std_logic_vector'(i3 & i2 & i1 & i0)) = to_unsigned(MAX_COUNT, COUNT_WIDTH));
      elsif to_x01(up_dn) = '0' then
        loading_terminal_count := (unsigned(std_logic_vector'(i3 & i2 & i1 & i0)) = to_unsigned(MIN_COUNT, COUNT_WIDTH));
      end if;
    else
      loading_terminal_count := false;
    end if;
    
    -- Generate carry-out (active low)
    if (to_x01(enb_t_n) = '0' and to_x01(enb_p_n) = '0') and (at_terminal_count or loading_terminal_count) then
      co_n <= '0';  -- Active low terminal count
    else
      co_n <= '1';  -- Not at terminal count
    end if;
  end process;
end architecture;
