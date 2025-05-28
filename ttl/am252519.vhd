-- AM252519 Quad Register with Two Independantly Controlled Three-State Outputs

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am252519 is
  port (
    clk        : in  std_logic; -- pin 9
    o_enb_n    : in  std_logic; -- pin 7
    inv        : in  std_logic; -- pin 18
    i0         : in  std_logic; -- pin 1
    i1         : in  std_logic; -- pin 4
    i2         : in  std_logic; -- pin 13
    i3         : in  std_logic; -- pin 16
    out_enb_n  : in  std_logic; -- pin 8
    clk_enb_n  : in  std_logic; -- pin 17
    asyn_clr_n : in  std_logic; -- pin 19
    q0a        : out std_logic; -- pin 2
    q1a        : out std_logic; -- pin 5
    q2a        : out std_logic; -- pin 12
    q3a        : out std_logic; -- pin 15
    q0b        : out std_logic; -- pin 3
    q1b        : out std_logic; -- pin 6
    q2b        : out std_logic; -- pin 11
    q3b        : out std_logic  -- pin 14
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
