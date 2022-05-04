function alphao = a_o(cai, v) %matches .mod file 
    %cai = tcai + ncai + lcai;
    d = .84;
    R = 8.313424;
    F = 96520;
    abar = .28;
    k = .48e-3;
    T = 310.15;
    alphao = cai*abar/(cai + k*exp(-2*d*F*v/R/T));
end