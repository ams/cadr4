library ieee;
use ieee.std_logic_1164.all;

library work;
use work.misc.all;

-- sn74124 is actually a dual VCO
-- however, in CADR, it is used as a single fixed frequency oscillator
-- hence, it is implemented like that only with en_n (-enable) and y (out) ports

-- Simplified SN74124: fixed-frequency oscillator
-- Ports:
--   en_n : active-low enable (0 = oscillate, 1 = disabled)
--   y    : output; when disabled, driven high immediately (synchronized to en_n)
entity sn74124 is
  port (
    en_n : in  std_logic;
    y    : out std_logic
  );
end entity;

architecture behavioral of sn74124 is
  signal en_n_i : std_logic;
  constant frequency_hz  : real := 10.0e6;                     -- 10 MHz
  constant half_period_t : time := 0.5 sec / frequency_hz;     -- 50 ns
begin
  -- Apply TTL input behavior (Z/H pulled high, L -> 0)
  en_n_i <= ttl_input(en_n);

  -- Oscillator process with immediate disable synchronization
  process
  begin
    -- Default to disabled-high on power-up
    y <= '1';

    -- Main service loop
    loop
      -- Wait until enabled (active-low)
      wait until en_n_i = '0';

      -- Start oscillation; choose a defined starting phase
      y <= '0';

      -- Toggle while enabled; each half-cycle can be pre-empted by disable
      while en_n_i = '0' loop
        -- Wait for half-period, but abort immediately if disabled goes high
        wait until en_n_i = '1' for half_period_t;
        if en_n_i = '1' then
          -- Synchronized disable: drive high immediately
          y <= '1';
          exit; -- exit oscillation loop; go wait for next enable
        else
          y <= not y;
        end if;
      end loop;
    end loop;
  end process;
end architecture;


