library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn7438_tb is
end entity;

architecture testbench of sn7438_tb is

  signal g1a, g1b, g1q_n : std_logic;
  signal g2a, g2b, g2q_n : std_logic;
  signal g3a, g3b, g3q_n : std_logic;
  signal g4a, g4b, g4q_n : std_logic;
  
  -- Pull-up resistors for open-collector outputs
  signal g1q_n_pulled, g2q_n_pulled, g3q_n_pulled, g4q_n_pulled : std_logic;

begin

  uut : sn7438 port map(
    g1a => g1a, g1b => g1b, g1q_n => g1q_n,
    g2a => g2a, g2b => g2b, g2q_n => g2q_n,
    g3a => g3a, g3b => g3b, g3q_n => g3q_n,
    g4a => g4a, g4b => g4b, g4q_n => g4q_n
    );

  -- Simulate pull-up resistors: 'Z' becomes '1', '0' stays '0'
  g1q_n_pulled <= '1' when g1q_n = 'Z' else g1q_n;
  g2q_n_pulled <= '1' when g2q_n = 'Z' else g2q_n;
  g3q_n_pulled <= '1' when g3q_n = 'Z' else g3q_n;
  g4q_n_pulled <= '1' when g4q_n = 'Z' else g4q_n;

  process
    type pt is record
      i0, i1 : std_logic;
      q      : std_logic;  -- Expected output after pull-up
      q_oc   : std_logic;  -- Expected open-collector output ('Z' or '0')
    end record;
    type pa is array (natural range <>) of pt;

    constant p : pa :=
      (('0', '0', '1', 'Z'),  -- NAND(0,0) = 1, open-collector = Z
       ('0', '1', '1', 'Z'),  -- NAND(0,1) = 1, open-collector = Z
       ('1', '0', '1', 'Z'),  -- NAND(1,0) = 1, open-collector = Z
       ('1', '1', '0', '0')); -- NAND(1,1) = 0, open-collector = 0

  begin
    for i in p'range loop
      g1a <= p(i).i0; g1b <= p(i).i1;
      g2a <= p(i).i0; g2b <= p(i).i1;
      g3a <= p(i).i0; g3b <= p(i).i1;
      g4a <= p(i).i0; g4b <= p(i).i1;

      wait for 1 ns;

      -- Check open-collector outputs directly
      assert g1q_n = p(i).q_oc report "Gate 1 OC output mismatch";
      assert g2q_n = p(i).q_oc report "Gate 2 OC output mismatch";
      assert g3q_n = p(i).q_oc report "Gate 3 OC output mismatch";
      assert g4q_n = p(i).q_oc report "Gate 4 OC output mismatch";
      
      -- Check pulled-up outputs
      assert g1q_n_pulled = p(i).q report "Gate 1 pulled output mismatch";
      assert g2q_n_pulled = p(i).q report "Gate 2 pulled output mismatch";
      assert g3q_n_pulled = p(i).q report "Gate 3 pulled output mismatch";
      assert g4q_n_pulled = p(i).q report "Gate 4 pulled output mismatch";
    end loop;

    wait;
  end process;

end architecture;
