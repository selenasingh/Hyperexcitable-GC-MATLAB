function [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj)
    g = [gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak]';
    e = [ena, ek, ecl, ekir]';
    elecparam = [I_ext,C, depth, F, t_startinj, t_stopinj]';
    calciump = [reCa, tau, B]';
end 
