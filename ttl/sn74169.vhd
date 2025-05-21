-- Synchronous 4-Bit Up/Down Binary Counters

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74169 is
  port (
    co_n : out std_logic;
    i3   : in  std_logic;
    i2   : in  std_logic;
    i1   : in  std_logic;
    i0   : in  std_logic;

    o3 : out std_logic;
    o2 : out std_logic;
    o1 : out std_logic;
    o0 : out std_logic;

    enb_t_n : in std_logic;
    enb_p_n : in std_logic;
    load_n  : in std_logic;
    up_dn   : in std_logic;
    clk     : in std_logic
    );
end;

-- ChatGPT o3 implementation
architecture ttl of sn74169 is
  signal cnt : unsigned(3 downto 0);  -- internal 4-bit register
begin
    ------------------------------------------------------------------
    -- synchronous logic
    ------------------------------------------------------------------
    process(clk)
        variable load_val : unsigned(3 downto 0);
    begin
        if rising_edge(clk) then
            -- synchronous parallel load has top priority
            if load_n = '0' then
                load_val := unsigned'(i3 & i2 & i1 & i0);
                cnt <= load_val;

            -- otherwise count when both enables are asserted (low)
            elsif (enb_t_n = '0' and enb_p_n = '0') then
                if up_dn = '1' then
                    cnt <= cnt + 1;            -- up-count (wraps 15→0)
                else
                    cnt <= cnt - 1;            -- down-count (wraps 0→15)
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
    co_n <= '0' when (enb_t_n = '0' and enb_p_n = '0' and
                      ((up_dn = '1' and cnt = "1111") or   -- overflow when counting up
                       (up_dn = '0' and cnt = "0000")))    -- underflow when counting down
            else '1';
end architecture;
