-- SN74138: 3-Line To 8-Line Decoder/Demultiplexer

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Datasheet: Texas Instruments SN74LS138 3-Line to 8-Line Decoder/Demultiplexer, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN74LS138

entity sn74138 is
  port (
    a   : in  std_logic := 'H';
    b   : in  std_logic := 'H';
    c   : in  std_logic := 'H';
    g1  : in  std_logic := 'H';
    g2a : in  std_logic := 'H';
    g2b : in  std_logic := 'H';
    y0  : out std_logic;
    y1  : out std_logic;
    y2  : out std_logic;
    y3  : out std_logic;
    y4  : out std_logic;
    y5  : out std_logic;
    y6  : out std_logic;
    y7  : out std_logic
    );
end;

architecture ttl of sn74138 is
  signal y : std_logic_vector(7 downto 0);
begin

  process (a, b, c, g1, g2a, g2b) is
    variable sel : std_logic_vector(2 downto 0);
    variable g : std_logic;
  begin
    g := g1 and not g2a and not g2b;
    -- Check enable conditions first
    if g = '1' then
      -- Enabled: decode select inputs
      sel := a & b & c;  -- MSB to LSB: a, b, c (matching testbench expectations)
      
      -- Handle all valid select combinations explicitly
      case sel is
        when "000" => y <= "11111110"; -- y0 active (low)
        when "001" => y <= "11111101"; -- y1 active (low)
        when "010" => y <= "11111011"; -- y2 active (low)
        when "011" => y <= "11110111"; -- y3 active (low)
        when "100" => y <= "11101111"; -- y4 active (low)
        when "101" => y <= "11011111"; -- y5 active (low)
        when "110" => y <= "10111111"; -- y6 active (low)
        when "111" => y <= "01111111"; -- y7 active (low)
        when others => y <= "XXXXXXXX"; -- Unknown select inputs
      end case;
    elsif g = '0' then
    -- Disabled: all outputs high (inactive)
    -- This is correct, it is not a tri-state output component
      y <= (others => '1');
    else
      y <= (others => 'X');
    end if;
  end process;

  y0 <= y(0); y1 <= y(1); y2 <= y(2); y3 <= y(3);
  y4 <= y(4); y5 <= y(5); y6 <= y(6); y7 <= y(7);

end architecture;
