-- Dual 4-Line To 1-Line Data Selectors/Multiplexers
-- This component selects one of four data inputs for two separate sections based on two select lines.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Datasheet: Texas Instruments SN74LS153 Dual 4-Line To 1-Line Data Selectors/Multiplexers, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN74LS153

entity sn74153 is
  port (
    enb1_n : in  std_logic; -- Pin 15
    sel1   : in  std_logic; -- Pin 14
    g1c3   : in  std_logic; -- Pin 13
    g1c2   : in  std_logic; -- Pin 12
    g1c1   : in  std_logic; -- Pin 11
    g1c0   : in  std_logic; -- Pin 10
    g1q    : out std_logic; -- Pin 7

    g2q    : out std_logic; -- Pin 9
    g2c0   : in  std_logic; -- Pin 6
    g2c1   : in  std_logic; -- Pin 5
    g2c2   : in  std_logic; -- Pin 4
    g2c3   : in  std_logic; -- Pin 3
    sel0   : in  std_logic; -- Pin 2
    enb2_n : in  std_logic  -- Pin 1
    );
end;

-- ChatGPT o3 implementation
architecture ttl of sn74153 is
    -- handy vector to index the inputs
    signal data_bus : std_logic_vector(0 to 7);
begin
    -- concatenate the individual inputs into a vector
    data_bus <= i0 & i1 & i2 & i3 & i4 & i5 & i6 & i7;

    -- core multiplexer with active-low chip-enable
    process(all)
        variable sel : std_logic_vector(0 to 1);
        variable sel_int : integer;
    begin
        if enb1_n = '0' then
            sel := sel1 & sel0;  -- sel1 is MSB, sel0 is LSB
            sel_int := to_integer(unsigned(sel));
            case sel_int is
                when 0 => g1q <= g1c0;
                when 1 => g1q <= g1c1;
                when 2 => g1q <= g1c2;
                when 3 => g1q <= g1c3;
                when others => g1q <= 'X';
            end case;
        else
            g1q <= 'X';
        end if;

        if enb2_n = '0' then
            sel := sel1 & sel0;
            sel_int := to_integer(unsigned(sel));
            case sel_int is
                when 0 => g2q <= g2c0;
                when 1 => g2q <= g2c1;
                when 2 => g2q <= g2c2;
                when 3 => g2q <= g2c3;
                when others => g2q <= 'X';
            end case;
        else
            g2q <= 'X';
        end if;
    end process;
end architecture;
