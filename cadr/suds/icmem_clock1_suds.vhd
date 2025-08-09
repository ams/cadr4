-- CLOCK1 -- MASTER CLOCK

library work;
use work.dip.all;
use work.misc.all;

architecture suds of icmem_clock1 is
alias \-tpdone\ : std_logic is \-tpw60\;
signal net_00 : std_logic;
signal net_01 : std_logic;
begin
clock1_1c08 : dip_74s10 port map (p1 => \-clock reset b\, p2 => \-tpdone\, p3 => \-hang\, p4 => \-clock reset b\, p5 => cyclecompleted, p6 => \-tpr0\, p8 => open, p9 => 'Z', p10 => 'Z', p11 => 'Z', p12 => net_01, p13 => net_00);
clock1_1c09 : dip_74s00 port map (p1 => net_01, p2 => \-tpr40\, p3 => net_00, p4 => 'Z', p5 => 'Z', p6 => open, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
clock1_1c10 : dip_74s02 port map (p1 => open, p2 => 'Z', p3 => 'Z', p4 => open, p5 => 'Z', p6 => 'Z', p8 => 'Z', p9 => 'Z', p10 => open, p11 => net_00, p12 => gnd, p13 => cyclecompleted);
clock1_1c12 : dip_td50 port map (p1 => \-tprend\, p4 => \-tpw20\, p6 => \-tpw40\, p8 => \-tpw50\, p10 => \-tpw30\, p12 => \-tpw10\);
clock1_1c14 : dip_td25 port map (p1 => \-tpw50\, p4 => \-tpw60\, p6 => \-tpw70\, p8 => \-tpw75\, p10 => \-tpw65\, p12 => \-tpw55\);
clock1_1c15 : dip_td25 port map (p1 => \-tpw20\, p4 => \-tpw30a\, p6 => \-tpw40a\, p8 => \-tpw45\, p10 => \-tpw35\, p12 => \-tpw25\);
clock1_1d08 : dip_74s151 port map (p1 => \-tpr100\, p2 => \-tpr140\, p3 => \-tpr160\, p4 => \-tpr160\, p5 => \-tprend\, p6 => tprend, p7 => gnd, p9 => sspeed1, p10 => sspeed0, p11 => \-ilong\, p12 => \-tpr75\, p13 => \-tpr115\, p14 => \-tpr85\, p15 => \-tpr125\);
clock1_1d11 : dip_td25 port map (p1 => \-tpr0\, p4 => \-tpr10\, p6 => \-tpr20a\, p8 => \-tpr25\, p10 => \-tpr15\, p12 => \-tpr5\);
clock1_1d12 : dip_td100 port map (p1 => \-tpr0\, p4 => \-tpr40\, p6 => \-tpr80\, p8 => \-tpr100\, p10 => \-tpr60\, p12 => \-tpr20\);
clock1_1d13 : dip_td100 port map (p1 => \-tpr100\, p4 => \-tpr140\, p6 => \-tpr180\, p8 => \-tpr200\, p10 => \-tpr160\, p12 => \-tpr120\);
clock1_1d14 : dip_td25 port map (p1 => \-tpr100\, p4 => \-tpr110\, p6 => \-tpr120a\, p8 => \-tpr125\, p10 => \-tpr115\, p12 => \-tpr105\);
clock1_1d15 : dip_td25 port map (p1 => \-tpr60\, p4 => \-tpr70\, p6 => \-tpr80a\, p8 => \-tpr85\, p10 => \-tpr75\, p12 => \-tpr65\);
end architecture;
