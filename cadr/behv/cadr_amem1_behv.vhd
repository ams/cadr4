-- AMEM1 -- A MEMORY RIGHT

library work;
use work.dip.all;
use work.misc.all;

architecture behv of cadr_amem1 is
  signal l_int    : std_logic_vector(0 to 15);
  signal amem_int : std_logic_vector(0 to 15);

  function get_awp(i : integer) return std_logic is
  begin
    case i is
      when 14 | 15 | 13 | 11 => return awpb;
      when others            => return awpc;
    end case;
  end;

begin
  l_int    <= l0 & l1 & l2 & l3 & l4 & l5 & l6 & l7 & l8 & l9 & l10 & l11 & l12 & l13 & l14 & l15;
  amem_int <= amem0 & amem1 & amem2 & amem3 & amem4 & amem5 & amem6 & amem7 & amem8 & amem9 & amem10 & amem11 & amem12 & amem13 & amem14 & amem15;

  gen_amem1 : for i in 0 to 15 generate
    dip_inst : dip_93425a port map (
      p1  => gnd,
      p2  => \-aadr0a\,
      p3  => \-aadr1a\,
      p4  => \-aadr2a\,
      p5  => \-aadr3a\,
      p6  => \-aadr4a\,
      p7  => amem_int(i),
      p9  => \-aadr5a\,
      p10 => \-aadr6a\,
      p11 => \-aadr7a\,
      p12 => \-aadr8a\,
      p13 => \-aadr9a\,
      p14 => get_awp(i),
      p15 => l_int(i)
      );
  end generate;

end architecture;
