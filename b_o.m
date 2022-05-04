function betao = b_o(cai, v) %matches .mod file 
    %cai = ncai + lcai + tcai;
    d = 1;
    R = 8.313424;
    F = 96520;
    bbar = .28;
    k = .13e-6;
    T = 310.15; 
    betao = bbar/(1 + cai/k*exp(-2*d*F*v/R/T));
end