function betaq = b_q(ncai, lcai, tcai) %aradi and holmes, does not match .mod
    cca = ncai + lcai + tcai;
    betaq = 0.006/exp(((12*log(cca)+60.4)/35));
end