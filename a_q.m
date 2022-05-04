function alphaq = a_q(ncai, lcai, tcai) %aradi and holmes, does not match .mod
    cca = ncai + lcai + tcai;
    alphaq = 0.00246/exp(((12*log(cca)+28.48)/-4.5));
end
