library ieee;
use ieee.std_logic_1164.all;

entity cadr1_requb is
  port (
    \-clk\          : in     std_logic;
    \db need ub\    : in     std_logic;
    \dbub master\   : in     std_logic;
    \hi 1-14\       : in     std_logic;
    \int busy t100\ : in     std_logic;
    \lm ub master\  : in     std_logic;
    \lmneedub (early)\ : in     std_logic;
    \lmub grant\    : in     std_logic;
    \nxm timeout\   : in     std_logic;
    \ssyn in\       : in     std_logic;
    reset           : in     std_logic;
    \lm need ub\    : inout  std_logic;
    \ssyn t0\       : inout  std_logic;
    \ssyn t100\     : inout  std_logic;
    \unibus request\ : inout  std_logic;
    \-lm need ub\   : out    std_logic;
    \-unibus request\ : out    std_logic;
    \lmub rq\       : out    std_logic;
    \msyn out\      : out    std_logic;
    \ssyn t150\     : out    std_logic;
    \ssyn t200\     : out    std_logic;
    \ssyn t250\     : out    std_logic;
    \ssyn t50\      : out    std_logic
  );
end entity cadr1_requb;
