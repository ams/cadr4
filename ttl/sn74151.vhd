-- Data Selectors / Multiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74151 is
  port (
    i0   : in  std_logic;
    i1   : in  std_logic;
    i2   : in  std_logic;
    i3   : in  std_logic;
    i4   : in  std_logic;
    i5   : in  std_logic;
    i6   : in  std_logic;
    i7   : in  std_logic;
    q    : out std_logic;
    q_n  : out std_logic;
    sel2 : in  std_logic;
    sel1 : in  std_logic;
    sel0 : in  std_logic;
    ce_n : in  std_logic
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
