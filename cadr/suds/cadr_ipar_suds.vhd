-- IPAR -- IR PARITY

library work;
use work.dip.all;
use work.misc.all;

architecture suds of cadr_ipar is
begin
ipar_3e02 : dip_93s48 port map (p1 => ir41, p2 => ir42, p3 => ir43, p4 => ir44, p5 => ir45, p6 => ir46, p7 => ir47, p9 => ipar3, p10 => open, p11 => ir36, p12 => ir37, p13 => ir38, p14 => ir39, p15 => ir40);
ipar_3e04 : dip_93s48 port map (p1 => ir5, p2 => ir6, p3 => ir7, p4 => ir8, p5 => ir9, p6 => ir10, p7 => ir11, p9 => ipar0, p10 => open, p11 => ir0, p12 => ir1, p13 => ir2, p14 => ir3, p15 => ir4);
ipar_3e21 : dip_93s48 port map (p1 => ir29, p2 => ir30, p3 => ir31, p4 => ir32, p5 => ir33, p6 => ir34, p7 => ir35, p9 => ipar2, p10 => open, p11 => ir24, p12 => ir25, p13 => ir26, p14 => ir27, p15 => ir28);
ipar_3f22 : dip_93s48 port map (p1 => gnd, p2 => gnd, p3 => gnd, p4 => gnd, p5 => gnd, p6 => gnd, p7 => gnd, p9 => iparity, p10 => open, p11 => ipar0, p12 => ipar1, p13 => ipar2, p14 => ipar3, p15 => ir48);
ipar_3f24 : dip_93s48 port map (p1 => ir17, p2 => ir18, p3 => ir19, p4 => ir20, p5 => ir21, p6 => ir22, p7 => ir23, p9 => ipar1, p10 => open, p11 => ir12, p12 => ir13, p13 => ir14, p14 => ir15, p15 => ir16);
ipar_4e03 : dip_74s32 port map (p1 => 'Z', p2 => 'Z', p3 => open, p4 => imodd, p5 => iparity, p6 => iparok, p8 => open, p9 => 'Z', p10 => 'Z', p11 => open, p12 => 'Z', p13 => 'Z');
end architecture;
