-- TRAP -- PARITY ERROR TRAP

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_trap is
signal net_0 : std_logic;
begin
trap_1d12 : dip_74s86 port map (p1 => '0', p2 => '0', p3 => open, p4 => '0', p5 => '0', p6 => open, p8 => open, p9 => '0', p10 => '0', p11 => mdparerr, p12 => mdpareven, p13 => mdpar);
trap_1e28 : dip_93s48 port map (p1 => \-md5\, p2 => \-md6\, p3 => \-md7\, p4 => \-md8\, p5 => \-md9\, p6 => \-md10\, p7 => \-md11\, p9 => mdparl, p10 => open, p11 => \-md0\, p12 => \-md1\, p13 => \-md2\, p14 => \-md3\, p15 => \-md4\);
trap_1e29 : dip_93s48 port map (p1 => \-md17\, p2 => \-md18\, p3 => \-md19\, p4 => \-md20\, p5 => \-md21\, p6 => \-md22\, p7 => \-md23\, p9 => mdparm, p10 => open, p11 => \-md12\, p12 => \-md13\, p13 => \-md14\, p14 => \-md15\, p15 => \-md16\);
trap_1e30 : dip_93s48 port map (p1 => \-md29\, p2 => \-md30\, p3 => \-md31\, p4 => mdparl, p5 => mdparm, p6 => gnd, p7 => gnd, p9 => mdparodd, p10 => mdpareven, p11 => \-md24\, p12 => \-md25\, p13 => \-md26\, p14 => \-md27\, p15 => \-md28\);
trap_3e30 : \-parerr\ <= not (mdparerr and mdhaspar and \use.md\ and \-wait\);
trap_3f18 : \-trap\ <= net_0 nor \boot.trap\;
            net_0 <= \-trapenb\ nor \-parerr\;
            \-memparok\ <= trapenb nor \-parerr\;
trap_3f19 : trapb <= not \-trap\;
            trapa <= not \-trap\;
            memparok <= not \-memparok\;
            \-trapenb\ <= not trapenb;
end architecture;
