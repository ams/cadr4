-------------------------------------------------------------------------------
-- Title : GHDL UART
-- Project : GHDL UART
-------------------------------------------------------------------------------
-- File : ghdl_uart_pkg.vhd
-- Author : Wojciech M. Zabolotny ( wz...@ise.pw.edu.pl )
-- Created : 2011-06-02
-- Last update: 2025-06-14
-- Platform :
-- Standard : VHDL'93
-------------------------------------------------------------------------------
-- Description: GHDL UART allows you to communicate with IP core simulated in
-- GHDL simulator via pseudoterminal in Linux or similar system
-- You may use minicom, or your own program to connect to pseudoterminal
-- allocated by GHDL UART and work with simulated IP core like with real
-- hardware via hardware UART.
-------------------------------------------------------------------------------
-- Copyright (c) 2011
-- Published as PUBLIC DOMAIN
-------------------------------------------------------------------------------
-- Revisions :
-- Date Version Author Description
-- 2011-06-02 1.0 wzab Created

package ghdl_uart_pkg is

  function ghdl_pty_open
    return integer;
  attribute foreign of ghdl_pty_open : function is "VHPIDIRECT ghdl_pty_open";
  function ghdl_pty_read
    return integer;
  attribute foreign of ghdl_pty_read : function is "VHPIDIRECT ghdl_pty_read";
  function ghdl_pty_write (
    v : integer)
    return integer;
  attribute foreign of ghdl_pty_write   : function is "VHPIDIRECT ghdl_pty_write";
  function ghdl_pty_setupTerminal (baud : integer)
    return integer;
  attribute foreign of ghdl_pty_setupTerminal : function is
    "VHPIDIRECT ghdl_pty_setupTerminal";


end ghdl_uart_pkg;

package body ghdl_uart_pkg is

  function ghdl_pty_open
    return integer is
  begin  -- ghdl_pty_open
    assert false severity failure;
  end ghdl_pty_open;

  function ghdl_pty_read
    return integer is
  begin  -- ghdl_pty_read
    assert false severity failure;
  end ghdl_pty_read;

  function ghdl_pty_write (
    v : integer)
    return integer is
  begin  -- ghdl_pty_write
    assert false severity failure;
  end ghdl_pty_write;

  function ghdl_pty_setupTerminal (baud : integer)
    return integer is
  begin
    assert false severity failure;
  end ghdl_pty_setupTerminal;


end ghdl_uart_pkg;
