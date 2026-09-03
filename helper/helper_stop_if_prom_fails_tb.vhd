-- helper_stop_if_prom_fails must sample the PC once per microinstruction.
--
-- The CLEAR-I-MEMORY loop at PROM 246 puts the address being written on the
-- PC for part of its microcycle, so a check that watches the PC continuously
-- stops on the write of 313 instead of on the fetch of it. The stages below
-- present the write transient first and a genuine fetch last: a correct
-- helper survives every no-stop stage and stops in the last one.
--
-- Note on what this can and cannot catch: a wrongly early std.env.stop ends
-- the simulation with status 0, so `make run-...` cannot distinguish it by
-- exit code. What it does catch by exit code is the opposite regression, a
-- helper that no longer stops on a genuine fetch. The early-stop case shows
-- up as the reported end time: a correct helper runs to the last stage.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity helper_stop_if_prom_fails_tb is
end entity;

architecture behavioral of helper_stop_if_prom_fails_tb is
  constant tpclk_period : time := 220 ns;

  signal tpclk         : std_logic := '0';
  signal iwrited       : std_logic := '0';
  signal promenable_n  : std_logic := '0';
  signal pc            : std_logic_vector(13 downto 0) := (others => '0');
  signal running       : boolean := true;
begin

  tpclk <= not tpclk after tpclk_period / 2 when running else '0';

  dut : entity work.helper_stop_if_prom_fails port map (
    pc0 => pc(0),   pc1  => pc(1),  pc2  => pc(2),  pc3  => pc(3),
    pc4 => pc(4),   pc5  => pc(5),  pc6  => pc(6),  pc7  => pc(7),
    pc8 => pc(8),   pc9  => pc(9),  pc10 => pc(10), pc11 => pc(11),
    pc12 => pc(12), pc13 => pc(13),
    tpclk => tpclk, iwrited => iwrited,
    \-promenable\ => promenable_n
    );

  stimulus : process
    -- put a value on the PC strictly between two rising edges and take it
    -- away again, the way a control-store write does
    procedure transient_pc (value : natural; write_cycle : std_logic) is
    begin
      wait until rising_edge(tpclk);
      iwrited <= write_cycle;
      wait for tpclk_period / 4;
      pc <= std_logic_vector(to_unsigned(value, pc'length));
      wait for tpclk_period / 4;
      pc <= std_logic_vector(to_unsigned(8#250#, pc'length));
      wait for tpclk_period / 4;
      iwrited <= '0';
    end procedure;
  begin
    pc <= std_logic_vector(to_unsigned(8#250#, pc'length));

    -- 1. a control-store write of 313: on the PC, but a write microcycle
    transient_pc(8#313#, '1');
    transient_pc(8#313#, '1');

    -- 2. 313 on the PC between edges outside a write, which a helper that
    --    samples continuously still sees but an edge-sampled one does not
    transient_pc(8#313#, '0');

    -- 3. 313 held across an edge, but running from RAM rather than the PROM
    wait until rising_edge(tpclk);
    promenable_n <= '1';
    pc <= std_logic_vector(to_unsigned(8#313#, pc'length));
    wait until rising_edge(tpclk);
    wait until rising_edge(tpclk);
    pc <= std_logic_vector(to_unsigned(8#250#, pc'length));
    promenable_n <= '0';

    -- 4. a genuine fetch of 313 from the PROM: the helper must stop here
    wait until rising_edge(tpclk);
    pc <= std_logic_vector(to_unsigned(8#313#, pc'length));
    wait until rising_edge(tpclk);
    wait until rising_edge(tpclk);

    -- only reached if the helper failed to stop
    assert false
      report "helper_stop_if_prom_fails_tb: did not stop on a genuine fetch of 313"
      severity error;
    running <= false;
    wait;
  end process;

end architecture;
