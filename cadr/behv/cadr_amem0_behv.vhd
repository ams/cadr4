-- AMEM0 -- A MEMORY LEFT

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_amem0 is
  signal l_int : std_logic_vector(16 to 31);
  signal amem_int : std_logic_vector(16 to 31);

  function get_awp(i : integer) return std_logic is
  begin
    case i is
      when 22 | 23 | 30 | 31 | 28 | 26 | 24 | 27 | 29 => return awpa;
      when others                                     => return awpb;
    end case;
  end;

begin
  l_int    <= l16 & l17 & l18 & l19 & l20 & l21 & l22 & l23 & l24 & l25 & l26 & l27 & l28 & l29 & l30 & l31;
  amem_int <= amem16 & amem17 & amem18 & amem19 & amem20 & amem21 & amem22 & amem23 & amem24 & amem25 & amem26 & amem27 & amem28 & amem29 & amem30 & amem31;

  gen_amem0 : for i in 16 to 31 generate
    dip_inst : dip_93425a port map (p1  => gnd,
                                    p2  => \-aadr0b\,
                                    p3  => \-aadr1b\,
                                    p4  => \-aadr2b\,
                                    p5  => \-aadr3b\,
                                    p6  => \-aadr4b\,
                                    p7  => amem(i),
                                    p9  => \-aadr5b\,
                                    p10 => \-aadr6b\,
                                    p11 => \-aadr7b\,
                                    p12 => \-aadr8b\,
                                    p13 => \-aadr9b\,
                                    p14 => get_awp(i),
                                    p15 => l(i));
  end generate;

end architecture;
