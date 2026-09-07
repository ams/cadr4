library ieee;
use ieee.std_logic_1164.all;

library work;
use work.misc.all;

-- sn74124 is actually a dual VCO.  In CADR it is used as a single
-- fixed-frequency oscillator, so only the enable and output of one half are
-- modelled.
--
-- The frequency is set by an external capacitor, so it belongs to the socket
-- rather than to the part and the dip wrapper supplies it.  REQTIM 0A01 is
-- the only instance on the boards cadr4 models.
--
-- Two things about this part are fixed by MIT rather than by the datasheet,
-- and the REQTIM timeout lands on MIT's own figures only if both hold.
--
-- The period is 2 us.  rom/mit/cadr1/reqtim.prom says so in its header --
-- "This Assumes Roughly 2 uSec clock intervals" -- and labels every entry of
-- its table in 2 uSec steps; doc/ai/cadrdc/dctmot.drw carries the annotation
-- on the drawing beside the same part in the same role, "74LS124  PERIOD =
-- 1.8 - 2.0 usec.".
--
-- The first rising edge coincides with the enable, so the output is low while
-- disabled.  doc/ttl/sn74124.pdf says otherwise: it has the output idle high
-- and the gating "ensures that the first output pulse is neither clipped nor
-- extended", which puts the first rising edge half a period on.  That sheet is
-- TI's SN54S124/SN74S124, first published in December 1983 and last revised in
-- 2004, describing an S part; the board is 1978 and carries an LS.  MIT's
-- numbers decide it: the REQTIM timeout flags are registered by the 74LS273 at
-- 0B01, so a flag the PROM raises in state 5 reaches the board on the sixth
-- edge.  MIT labels that 10 uSec, which needs the sixth rising edge exactly
-- five periods after the enable -- the half-period reading puts it at 11 us.
--
-- Nothing on the board can observe the disabled level: the 74LS273 this
-- clocks is held cleared over exactly that interval.  Low is chosen because
-- it is what makes the enable itself a rising edge.

entity sn74124 is
  generic (period : time := 2 us);
  port (
    en_n : in  std_logic; -- Pin 6 (-1EN)
    y    : out std_logic  -- Pin 7 (1Y)
  );
end entity;


architecture behavioral of sn74124 is
  signal en_n_i : std_logic;
  constant half_period : time := period / 2;
begin
  en_n_i <= ttl_input(en_n);

  process
  begin
    -- low while disabled
    y <= '0';

    loop
      wait until en_n_i = '0';

      -- the first rising edge coincides with the enable
      y <= '1';

      while en_n_i = '0' loop
        -- half a period, but a disable pre-empts it
        wait until en_n_i = '1' for half_period;
        if en_n_i = '1' then
          y <= '0';
          exit;
        else
          y <= not y;
        end if;
      end loop;
    end loop;
  end process;
end architecture;
