library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

entity dip_16dummy is port (            -- ic_16dummy [16dummy]
  p1 : std_logic                        -- dummy
  );
end;

architecture dip of dip_16dummy is
begin
  ttl : ic_16dummy port map (p1 => dummy);
end;
