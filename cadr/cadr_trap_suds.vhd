-- TRAP -- PARITY ERROR TRAP

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_trap is
signal net_0 : std_logic;
begin
trap_1d12 : dip_74s86 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => mdparerr, p12 => mdpareven, p13 => mdpar);
trap_1e28 : dip_93s48 port map (p1 => \-md5\, p2 => \-md6\, p3 => \-md7\, p4 => \-md8\, p5 => \-md9\, p6 => \-md10\, p7 => \-md11\, p9 => mdparl, p10 => open, p11 => \-md0\, p12 => \-md1\, p13 => \-md2\, p14 => \-md3\, p15 => \-md4\);
trap_1e29 : dip_93s48 port map (p1 => \-md17\, p2 => \-md18\, p3 => \-md19\, p4 => \-md20\, p5 => \-md21\, p6 => \-md22\, p7 => \-md23\, p9 => mdparm, p10 => open, p11 => \-md12\, p12 => \-md13\, p13 => \-md14\, p14 => \-md15\, p15 => \-md16\);
trap_1e30 : dip_93s48 port map (p1 => \-md29\, p2 => \-md30\, p3 => \-md31\, p4 => mdparl, p5 => mdparm, p6 => gnd, p7 => gnd, p9 => mdparodd, p10 => mdpareven, p11 => \-md24\, p12 => \-md25\, p13 => \-md26\, p14 => \-md27\, p15 => \-md28\);
trap_3e30 : dip_74s20 port map (p1 => mdparerr, p2 => mdhaspar, p4 => \use.md\, p5 => \-wait\, p6 => \-parerr\, p8 => open, p9 => 'Z', p10 => 'Z', p12 => 'Z', p13 => 'Z');
trap_3f18 : dip_74s02o port map (p1 => open, p2 => 'Z', p3 => 'Z', p4 => \-trap\, p5 => net_0, p6 => \boot.trap\, p8 => \-trapenb\, p9 => \-parerr\, p10 => net_0, p11 => trapenb, p12 => \-parerr\, p13 => \-memparok\);
trap_3f19 : dip_74s04 port map (p1 => \-trap\, p2 => trapb, p3 => \-trap\, p4 => trapa, p5 => \-memparok\, p6 => memparok, p8 => \-trapenb\, p9 => trapenb, p10 => open, p11 => 'Z', p12 => open, p13 => 'Z');
end architecture;
