-- Quad Register With Two Independantly Controlled Three-State Outputs

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am252519 is
  port (
    clk                : in  std_logic;
    o_enb_n            : in  std_logic;
    inv                : in  std_logic;
    i0, i1, i2, i3     : in  std_logic;
    out_enb_n          : in  std_logic;
    clk_enb_n          : in  std_logic;
    asyn_clr_n         : in  std_logic;
    q0a, q1a, q2a, q3a : out std_logic;
    q0b, q1b, q2b, q3b : out std_logic
    );
end am252519;

-- ChatGPT Codex implementation
architecture ttl of am252519 is
  signal reg4 : std_logic_vector(3 downto 0);
begin
  ------------------------------------------------------------------
  -- register operation
  ------------------------------------------------------------------
  process(clk, asyn_clr_n)
  begin
    if asyn_clr_n = '0' then
      reg4 <= (others => '0');
    elsif rising_edge(clk) then
      if clk_enb_n = '0' then
        reg4 <= i3 & i2 & i1 & i0;
      end if;
    end if;
  end process;

  ------------------------------------------------------------------
  -- output section
  ------------------------------------------------------------------
  process(all)
    variable val : std_logic_vector(3 downto 0);
  begin
    val := reg4;
    if inv = '1' then
      val := not val;
    end if;

    if o_enb_n = '0' then
      q3a <= val(3); q2a <= val(2); q1a <= val(1); q0a <= val(0);
    else
      q3a <= 'Z'; q2a <= 'Z'; q1a <= 'Z'; q0a <= 'Z';
    end if;

    if out_enb_n = '0' then
      q3b <= reg4(3); q2b <= reg4(2); q1b <= reg4(1); q0b <= reg4(0);
    else
      q3b <= 'Z'; q2b <= 'Z'; q1b <= 'Z'; q0b <= 'Z';
    end if;
  end process;
end;
