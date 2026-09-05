-- Testbench for the reqlm page: the XBUS REQUEST flip-flop.
--
-- Two masters ask reqlm for an Xbus cycle, and each term is a request
-- ANDed with that master's own Xbus grant:
--
--   XBUS REQUEST = (LMXRQ AND LMX GRANT A)
--                  OR (UBXRQ AND UBX GRANT A AND -UB TO MD AND MSYN IN)
--
-- E09 forms the Unibus master's term, C14 (74S51) ORs the two, A04
-- inverts, and B14 (74S74) latches it on INT BUSY T80; the same node is
-- the flip-flop's clear, so the request drops as soon as the term goes
-- away.
--
-- LMXRQ is made on the page: LMXRQ = not (-MEMRQ or ADR=UNIBUS), and
-- ADR=UNIBUS is C12 NORing -ADR17..-ADR21, so -MEMRQ = '0' with any
-- -ADRnn high is a processor Xbus request.

library ieee;
use ieee.std_logic_1164.all;

use work.busint_book.all;

entity busint_reqlm_tb is
end entity;

architecture testbench of busint_reqlm_tb is

  -- inputs, all inactive
  signal adr17_n, adr18_n, adr19_n, adr20_n, adr21_n : std_logic := '1';
  signal lm_ub_master_n : std_logic := '1';
  signal lmub_grant_n   : std_logic := '1';
  signal memrq_n        : std_logic := '1';
  signal ub_to_md_n     : std_logic := '1';
  signal ubx_grant_n    : std_logic := '1';
  signal hi_1_14        : std_logic := '1';
  signal int_busy_t100  : std_logic := '0';
  signal int_busy_t80   : std_logic := '0';
  signal lmub_grant     : std_logic := '0';
  signal lmx_grant_a    : std_logic := '0';
  signal lmx_grant      : std_logic := '0';
  signal msyn_in        : std_logic := '0';
  signal nxm_timeout    : std_logic := '0';
  signal ssyn_t150      : std_logic := '0';
  signal ubx_grant      : std_logic := '0';
  signal ubx_grant_a    : std_logic := '0';
  signal unibus_request : std_logic := '0';
  signal xbus_ack_in    : std_logic := '0';
  signal xbus_ignpar_in : std_logic := '0';
  signal lmrd, ubxrq, xrd, xwr : std_logic := '0';

  -- driven by the page
  signal lmxrq_n, loadmd_ack_n, xack_n, adr_unibus : std_logic := 'Z';
  signal ub_md_load, xbus_request, lmxrq, xack     : std_logic := 'Z';
  signal lm_grant_n, lm_ignpar_n, lmack_n, loadmd_n : std_logic;
  signal xbus_request_n, lm_memdrive_enb, lmneedub_early, loadmd_ack : std_logic;

begin

  uut : busint_reqlm
    port map (
      \-adr17\ => adr17_n, \-adr18\ => adr18_n, \-adr19\ => adr19_n,
      \-adr20\ => adr20_n, \-adr21\ => adr21_n,
      \-lm ub master\ => lm_ub_master_n, \-lmub grant\ => lmub_grant_n,
      \-memrq\ => memrq_n, \-ub to md\ => ub_to_md_n,
      \-ubx grant\ => ubx_grant_n, \hi 1-14\ => hi_1_14,
      \int busy t100\ => int_busy_t100, \int busy t80\ => int_busy_t80,
      \lmub grant\ => lmub_grant, \lmx grant a\ => lmx_grant_a,
      \lmx grant\ => lmx_grant, \msyn in\ => msyn_in,
      \nxm timeout\ => nxm_timeout, \ssyn t150\ => ssyn_t150,
      \ubx grant\ => ubx_grant, \ubx grant a\ => ubx_grant_a,
      \unibus request\ => unibus_request,
      \xbus ack in\ => xbus_ack_in, \xbus ignpar in\ => xbus_ignpar_in,
      lmrd => lmrd, ubxrq => ubxrq, xrd => xrd, xwr => xwr,
      \-lmxrq\ => lmxrq_n, \-loadmd ack\ => loadmd_ack_n,
      \-xack\ => xack_n, \adr=unibus\ => adr_unibus,
      \ub md load\ => ub_md_load, \xbus request\ => xbus_request,
      lmxrq => lmxrq, xack => xack,
      \-lm grant\ => lm_grant_n, \-lm ignpar\ => lm_ignpar_n,
      \-lmack\ => lmack_n, \-loadmd\ => loadmd_n,
      \-xbus request\ => xbus_request_n,
      \lm memdrive enb\ => lm_memdrive_enb,
      \lmneedub (early)\ => lmneedub_early, \loadmd ack\ => loadmd_ack
    );

  process

    -- lets the request term settle, then clocks the flip-flop
    procedure clock is
    begin
      wait for 5 ns;
      int_busy_t80 <= '1';
      wait for 5 ns;
      int_busy_t80 <= '0';
      wait for 5 ns;
    end procedure;

    procedure check_request(v : std_logic; msg : string) is
    begin
      assert xbus_request = v
        report msg & ": xbus request = " & std_logic'image(xbus_request)
             & ", expected " & std_logic'image(v)
        severity error;
      assert xbus_request_n = not v
        report msg & ": -xbus request = " & std_logic'image(xbus_request_n)
             & ", expected " & std_logic'image(not v)
        severity error;
    end procedure;

    -- no master asking
    procedure idle is
    begin
      memrq_n <= '1';
      lmx_grant_a <= '0';
      ubx_grant_a <= '0';
      ubxrq <= '0';
      ub_to_md_n <= '1';
      msyn_in <= '0';
      clock;
    end procedure;

  begin
    -- nothing asks: the flip-flop stays clear
    idle;
    check_request('0', "idle");

    -- the processor's own Xbus cycle: LMXRQ with LMX GRANT A
    memrq_n <= '0';                     -- with -ADR17..21 high, LMXRQ = '1'
    lmx_grant_a <= '1';
    clock;
    assert lmxrq = '1' report "processor cycle: lmxrq not made on the page" severity error;
    check_request('1', "processor cycle");
    idle;
    check_request('0', "processor cycle released");

    -- a Unibus master reaching the Xbus through the map: UBXRQ with the
    -- Unibus master's own grant, the address not going to MD, MSYN in.
    -- The processor is not asking and holds no grant.
    ubxrq <= '1';
    ubx_grant_a <= '1';
    ub_to_md_n <= '1';
    msyn_in <= '1';
    clock;
    assert lmxrq = '0' report "unibus master cycle: lmxrq should be low" severity error;
    check_request('1', "unibus master cycle");
    idle;
    check_request('0', "unibus master cycle released");

    -- the same Unibus request without the Unibus master's grant asks for
    -- nothing, even while the processor holds LMX GRANT A: that grant
    -- belongs to the processor's own cycle. This is what E09-2 decides.
    ubxrq <= '1';
    ubx_grant_a <= '0';
    lmx_grant_a <= '1';
    ub_to_md_n <= '1';
    msyn_in <= '1';
    clock;
    check_request('0', "unibus master without its grant");

    -- and the address going to MD, or no MSYN, holds it off as well
    ubx_grant_a <= '1';
    lmx_grant_a <= '0';
    ub_to_md_n <= '0';
    clock;
    check_request('0', "unibus master with -ub to md low");
    ub_to_md_n <= '1';
    msyn_in <= '0';
    clock;
    check_request('0', "unibus master without msyn in");
    idle;

    report "busint_reqlm_tb: done";
    wait;
  end process;

end architecture;
