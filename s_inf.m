function sinf = s_inf(ncai, lcai, tcai)
    cca = ncai + lcai + tcai;
    sinf = 1/(1+4/(1000*cca));
end