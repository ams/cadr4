-- Synchronous 4-Bit Up/Down Binary Counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This is a Synchronous 4-Bit Up/Down Binary Counter
entity sn74169 is
  port (
    co_n    : out std_logic; -- Pin 15 (Terminal Count Output Active Low)
    i3      : in  std_logic; -- Pin 6 (Parallel Input D)
    i2      : in  std_logic; -- Pin 5 (Parallel Input C)
    i1      : in  std_logic; -- Pin 4 (Parallel Input B)
    i0      : in  std_logic; -- Pin 3 (Parallel Input A)

    o3      : out std_logic; -- Pin 10 (Output D)
    o2      : out std_logic; -- Pin 12 (Output C)
    o1      : out std_logic; -- Pin 13 (Output B)
    o0      : out std_logic; -- Pin 14 (Output A)

    enb_t_n : in std_logic; -- Pin 11 (Count Enable Trickle Input Active Low)
    enb_p_n : in std_logic; -- Pin 7 (Count Enable Parallel Input Active Low)
    load_n  : in std_logic; -- Pin 9 (Parallel Enable Input Active Low)
    up_dn   : in std_logic; -- Pin 1 (Up/Down Control Input)
    clk     : in std_logic -- Pin 2 (Clock Input)
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
    co_n <= '0' when (enb_t_n = '0' and enb_p_n = '0' and (
                        (load_n = '0' and ((up_dn = '1' and unsigned(std_logic_vector'(i3 & i2 & i1 & i0)) = to_unsigned(15, 4)) or (up_dn = '0' and unsigned(std_logic_vector'(i3 & i2 & i1 & i0)) = to_unsigned(0, 4)))) or
                        (load_n = '1' and ((up_dn = '1' and cnt = to_unsigned(15, 4)) or (up_dn = '0' and cnt = to_unsigned(0, 4))) )
                      ))
            else '1';
end architecture;
