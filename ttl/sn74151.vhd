-- 8-Line To 1-Line Data Selectors/Multiplexers
-- This component selects one of eight data inputs based on three select lines.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74151 is
  port (
    i3   : in  std_logic; -- Pin 1
    i2   : in  std_logic; -- Pin 2
    i1   : in  std_logic; -- Pin 3
    i0   : in  std_logic; -- Pin 4
    q    : out std_logic; -- Pin 5
    q_n  : out std_logic; -- Pin 6
    ce_n : in  std_logic; -- Pin 7

    sel0 : in  std_logic; -- Pin 9
    sel1 : in  std_logic; -- Pin 10
    sel2 : in  std_logic; -- Pin 11
    i4   : in  std_logic; -- Pin 12
    i5   : in  std_logic; -- Pin 13
    i6   : in  std_logic; -- Pin 14
    i7   : in  std_logic  -- Pin 15
    );
end;

-- ChatGPT o3 implementation
architecture ttl of sn74151 is
    -- handy vector to index the inputs
    signal data_bus : std_logic_vector(0 to 7);
begin
    -- concatenate the individual inputs into a vector
    data_bus <= i0 & i1 & i2 & i3 & i4 & i5 & i6 & i7;

    -- core multiplexer with active-low chip-enable
    process(all)
        variable sel : std_logic_vector(2 downto 0);
        variable sel_int : integer;
    begin
        if ce_n = '0' then
            sel := sel2 & sel1 & sel0;  -- sel2 is MSB, sel0 is LSB
            sel_int := to_integer(unsigned(sel));
            q   <= data_bus(sel_int);
            q_n <= not data_bus(sel_int);
        else
            q   <= 'X';
            q_n <= 'X';
        end if;
    end process;
end architecture;
