-- Testbench for the npc page: next PC selection, PC register and the
-- PC + 1 (IPC) adder chain.
--
-- npc = spc / ir / dpc / ipc selected by pcs1,pcs0 = 00 / 01 / 10 / 11
-- (74S153 inputs C0..C3, with trapa/trapb as active-low strobes; a trap
-- forces npc = 0),
-- pc <= npc on the rising edge of clk4b (74S374), ipc = pc + hi4 (74S283
-- chain, hi4 is the carry into the lowest nibble; pccry3/7/11 are the
-- nibble carries).

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cadr_book.all;

entity cadr_npc_ipc_tb is
end entity;

architecture testbench of cadr_npc_ipc_tb is

  signal clk4b : std_logic := '0';
  signal hi4   : std_logic := '1';
  signal trapa : std_logic := '1';
  signal trapb : std_logic := '1';
  signal pcs0  : std_logic := '0';
  signal pcs1  : std_logic := '0';

  signal dpc, spc, ir : std_logic_vector(13 downto 0) := (others => '0');
  signal pc, ipc, npc : std_logic_vector(13 downto 0);
  signal pccry3, pccry7, pccry11 : std_logic;

begin

  uut : cadr_npc
    port map (
      clk4b => clk4b, hi4 => hi4, trapa => trapa, trapb => trapb,
      pcs0 => pcs0, pcs1 => pcs1,
      dpc0 => dpc(0), dpc1 => dpc(1), dpc2 => dpc(2), dpc3 => dpc(3),
      dpc4 => dpc(4), dpc5 => dpc(5), dpc6 => dpc(6), dpc7 => dpc(7),
      dpc8 => dpc(8), dpc9 => dpc(9), dpc10 => dpc(10), dpc11 => dpc(11),
      dpc12 => dpc(12), dpc13 => dpc(13),
      spc0 => spc(0), spc1a => spc(1), spc2 => spc(2), spc3 => spc(3),
      spc4 => spc(4), spc5 => spc(5), spc6 => spc(6), spc7 => spc(7),
      spc8 => spc(8), spc9 => spc(9), spc10 => spc(10), spc11 => spc(11),
      spc12 => spc(12), spc13 => spc(13),
      ir12 => ir(0), ir13 => ir(1), ir14 => ir(2), ir15 => ir(3),
      ir16 => ir(4), ir17 => ir(5), ir18 => ir(6), ir19 => ir(7),
      ir20 => ir(8), ir21 => ir(9), ir22 => ir(10), ir23 => ir(11),
      ir24 => ir(12), ir25 => ir(13),
      pc0 => pc(0), pc1 => pc(1), pc2 => pc(2), pc3 => pc(3),
      pc4 => pc(4), pc5 => pc(5), pc6 => pc(6), pc7 => pc(7),
      pc8 => pc(8), pc9 => pc(9), pc10 => pc(10), pc11 => pc(11),
      pc12 => pc(12), pc13 => pc(13),
      ipc0 => ipc(0), ipc1 => ipc(1), ipc2 => ipc(2), ipc3 => ipc(3),
      ipc4 => ipc(4), ipc5 => ipc(5), ipc6 => ipc(6), ipc7 => ipc(7),
      ipc8 => ipc(8), ipc9 => ipc(9), ipc10 => ipc(10), ipc11 => ipc(11),
      ipc12 => ipc(12), ipc13 => ipc(13),
      npc0 => npc(0), npc1 => npc(1), npc2 => npc(2), npc3 => npc(3),
      npc4 => npc(4), npc5 => npc(5), npc6 => npc(6), npc7 => npc(7),
      npc8 => npc(8), npc9 => npc(9), npc10 => npc(10), npc11 => npc(11),
      npc12 => npc(12), npc13 => npc(13),
      pccry3 => pccry3, pccry7 => pccry7, pccry11 => pccry11
    );

  process
    -- lets the mux settle after a select or data change, then clocks
    procedure clock is
    begin
      wait for 5 ns;
      clk4b <= '1';
      wait for 5 ns;
      clk4b <= '0';
      wait for 5 ns;
    end procedure;

    procedure check_pc(v : integer; msg : string) is
      constant inc : integer := (v + 1) mod 16384;
    begin
      assert to_integer(unsigned(pc)) = v
        report msg & ": pc = " & integer'image(to_integer(unsigned(pc))) & ", expected " & integer'image(v)
        severity error;
      assert to_integer(unsigned(ipc)) = inc
        report msg & ": ipc = " & integer'image(to_integer(unsigned(ipc))) & ", expected " & integer'image(inc)
        severity error;
      assert (pccry3 = '1') = (v mod 16 = 15)
        report msg & ": pccry3 wrong for pc " & integer'image(v) severity error;
      assert (pccry7 = '1') = (v mod 256 = 255)
        report msg & ": pccry7 wrong for pc " & integer'image(v) severity error;
      assert (pccry11 = '1') = (v mod 4096 = 4095)
        report msg & ": pccry11 wrong for pc " & integer'image(v) severity error;
    end procedure;

    type int_array is array (natural range <>) of integer;
    constant values : int_array := (0, 1, 15, 16, 255, 256, 4095, 4096, 8#257#, 8#313#, 16382, 16383);
  begin
    -- a trap forces npc to zero whatever is selected
    pcs1 <= '0'; pcs0 <= '1';
    ir <= (others => '1');
    wait for 5 ns;
    assert to_integer(unsigned(npc)) = 0 report "trap: npc not zero" severity error;
    clock;
    check_pc(0, "trap");

    -- ir source: pc loads the ir field, ipc is pc + 1 with the nibble carries
    trapa <= '0'; trapb <= '0';
    for i in values'range loop
      ir <= std_logic_vector(to_unsigned(values(i), 14));
      wait for 5 ns;
      assert to_integer(unsigned(npc)) = values(i)
        report "ir source: npc = " & integer'image(to_integer(unsigned(npc))) & ", expected " & integer'image(values(i))
        severity error;
      clock;
      check_pc(values(i), "ir source");
    end loop;

    -- ipc source: the pc counts, and wraps at 2**14
    pcs1 <= '1'; pcs0 <= '1';
    for i in 1 to 3 loop
      clock;
      check_pc((16383 + i) mod 16384, "ipc source");
    end loop;

    -- dpc source
    pcs1 <= '1'; pcs0 <= '0';
    dpc <= std_logic_vector(to_unsigned(8#1234#, 14));
    clock;
    check_pc(8#1234#, "dpc source");

    -- spc source
    pcs1 <= '0'; pcs0 <= '0';
    spc <= std_logic_vector(to_unsigned(8#4321#, 14));
    clock;
    check_pc(8#4321#, "spc source");

    -- without the carry in, ipc equals pc
    hi4 <= '0';
    wait for 5 ns;
    assert ipc = pc report "hi4 = 0: ipc should equal pc" severity error;
    assert pccry3 = '0' and pccry7 = '0' and pccry11 = '0'
      report "hi4 = 0: no nibble carry expected" severity error;

    report "cadr_npc_ipc_tb: done";
    wait;
  end process;

end architecture;
