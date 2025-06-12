library ieee;
use ieee.std_logic_1164.all;

-- Testbench created by OpenAI Codex



entity ff_jkpc_tb is
end;

architecture testbench of ff_jkpc_tb is

  signal q_n : std_logic;
  signal q   : std_logic;
  signal k   : std_logic;
  signal j   : std_logic;
  signal clk : std_logic;
  signal pre : std_logic;
  signal clr : std_logic;
begin

  uut : entity work.ff_jkpc port map(
    clk => clk,
    pre => pre,
    clr => clr,
    j   => j,
    k   => k,
    q   => q,
    q_n => q_n
    );

  -- Stimulus created by OpenAI Codex
  process
  begin
    clk <= '0';
    j   <= '0';
    k   <= '0';
    pre <= '1';
    clr <= '1';
    wait for 1 ns;

    -- asynchronous clear - this initializes the flip-flop from 'U' state
    pre <= '1'; clr <= '0';
    wait for 1 ns;
    assert q = '0' and q_n = '1' report "Clear operation failed";

    -- asynchronous preset
    clr <= '1'; pre <= '0';
    wait for 1 ns;
    assert q = '1' and q_n = '0' report "Preset operation failed";

    -- when both preset and clear are inactive, value should hold
    pre <= '1'; clr <= '1';
    wait for 1 ns;
    for i in 1 to 3 loop
      clk <= '1'; wait for 1 ns; clk <= '0'; wait for 1 ns;
      assert q = '1' and q_n = '0' report "Hold state failed";
    end loop;

    wait;
  end process;

end;

