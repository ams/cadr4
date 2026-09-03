library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity helper_stop_if_prom_fails is 
    port (
      pc0     : in std_logic;
      pc1     : in std_logic;
      pc2     : in std_logic;
      pc3     : in std_logic;
      pc4     : in std_logic;
      pc5     : in std_logic;
      pc6     : in std_logic;
      pc7     : in std_logic;
      pc8     : in std_logic;
      pc9     : in std_logic;
      pc10    : in std_logic;
      pc11    : in std_logic;
      pc12    : in std_logic;
      pc13    : in std_logic;
      tpclk   : in std_logic;
      iwrited : in std_logic;
      \-promenable\ : in std_logic
    );
end entity;

architecture behavioral of helper_stop_if_prom_fails is
    -- PAGE-0-PARITY-FIX is at PROM 310 and reads main memory for the first
    -- time (doc/promh.9/promh.sym.9, doc/promh.9/promh.text.9)
    constant stop_pc : natural := 8#313#;
    signal pc : std_logic_vector(13 downto 0);
  begin
    pc <= pc13 & pc12 & pc11 & pc10 & pc9 & pc8 & pc7 & pc6 & pc5 & pc4 & pc3 & pc2 & pc1 & pc0;

    -- One sample per microinstruction, at the microcycle boundary.
    --
    -- Two conditions, each for its own reason. Sampling on the edge rather
    -- than on every change of the PC: CLEAR-I-MEMORY at PROM 246 writes the
    -- control store a location at a time and puts the address being written
    -- on the PC for part of its microcycle, so a check that watches the PC
    -- continuously stops on the write of 313 rather than on the fetch of it,
    -- ending the boot about 124000 microcycles early. Requiring iwrited low:
    -- a write microcycle is not an execution of the address on the PC, and
    -- saying so keeps this right whatever the sampling phase.
    --
    -- Stop only while executing from the PROM; the same address in IRAM is a
    -- normal microcode location once the machine runs from RAM.
    process (tpclk)
    begin
      if rising_edge(tpclk) then
        if \-promenable\ = '0' and iwrited = '0' then
          assert not is_x(pc)
            report "helper_stop_if_prom_fails: PC is X while running from the PROM"
            severity error;
          if not is_x(pc) and unsigned(pc) = stop_pc then
            -- check-boot greps for this line: reaching stop_pc is the only
            -- thing that distinguishes a boot that worked from a run that
            -- merely ended, and the simulator exits 0 either way
            report "helper_stop_if_prom_fails: the PROM reached 313" severity note;
            std.env.stop;
          end if;
        end if;
      end if;
    end process;

  end architecture;
