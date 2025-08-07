library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.misc.all;

entity am29701 is
  port (
    i1      : in  std_logic;
    i2      : in  std_logic;
    i3      : in  std_logic;
    i4      : in  std_logic;
    o1      : out std_logic;
    o2      : out std_logic;
    o3      : out std_logic;
    o4      : out std_logic;
    a0      : in  std_logic;
    a1      : in  std_logic;
    a2      : in  std_logic;
    a3      : in  std_logic;
    write_n : in  std_logic;
    ce_n    : in  std_logic
  );
end entity;

architecture rtl of am29701 is
  type ram_array is array (0 to 15) of std_logic_vector(3 downto 0);
  signal ram : ram_array := (others => (others => '0'));
  signal data_in : std_logic_vector(3 downto 0);
  
  -- TTL input processed signals
  signal i1_i, i2_i, i3_i, i4_i : std_logic;
  signal a0_i, a1_i, a2_i, a3_i : std_logic;
  signal write_n_i, ce_n_i : std_logic;
begin

  -- TTL input processing
  i1_i <= ttl_input(i1);
  i2_i <= ttl_input(i2);
  i3_i <= ttl_input(i3);
  i4_i <= ttl_input(i4);
  a0_i <= ttl_input(a0);
  a1_i <= ttl_input(a1);
  a2_i <= ttl_input(a2);
  a3_i <= ttl_input(a3);
  write_n_i <= ttl_input(write_n);
  ce_n_i <= ttl_input(ce_n);

  data_in <= i4_i & i3_i & i2_i & i1_i;
  
  -- Write process
  process(write_n_i, ce_n_i, a3_i, a2_i, a1_i, a0_i, data_in)
    variable addr_vec : std_logic_vector(3 downto 0);
    variable addr_int : integer;
  begin
    if ce_n_i = '0' and write_n_i = '0' then
      addr_vec := a3_i & a2_i & a1_i & a0_i;
      if not is_x(addr_vec) then
        addr_int := to_integer(unsigned(addr_vec));
        if addr_int >= 0 and addr_int <= 15 then
          ram(addr_int) <= data_in;
        end if;
      end if;
    end if;
  end process;
  
  -- Read process
  process(ce_n_i, a3_i, a2_i, a1_i, a0_i, ram)
    variable addr_vec : std_logic_vector(3 downto 0);
    variable addr_int : integer;
  begin
    if ce_n_i = '0' then
      addr_vec := a3_i & a2_i & a1_i & a0_i;
      if is_x(addr_vec) then
        -- Address contains metavalues, output should be unknown
        o1 <= 'X';
        o2 <= 'X';
        o3 <= 'X';
        o4 <= 'X';
      else
        addr_int := to_integer(unsigned(addr_vec));
        if addr_int >= 0 and addr_int <= 15 then
          o1 <= ram(addr_int)(0);
          o2 <= ram(addr_int)(1);
          o3 <= ram(addr_int)(2);
          o4 <= ram(addr_int)(3);
        else
          o1 <= 'U';
          o2 <= 'U';
          o3 <= 'U';
          o4 <= 'U';
        end if;
      end if;
    else
      o1 <= 'Z';
      o2 <= 'Z';
      o3 <= 'Z';
      o4 <= 'Z';
    end if;
  end process;

end architecture;
