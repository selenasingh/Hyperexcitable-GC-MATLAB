function eca_nernst = eca(tcai, ncai, lcai)
    R = 8.314; %J*K^-1*mol^-1 universal gas constant
    T = 310.15; %K temp in kelvin 
    z = 2; %valence of ion 
    F = 96485; %C*mol^-1 %faraday constant
    cao = 2; %mM
    cai = tcai + ncai + lcai;
    eca_nernst = ((1000)*R*T/(z*F))*log(cao/cai);
end