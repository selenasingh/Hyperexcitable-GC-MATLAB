function dy = membraneODE(t, y) 
[g, e, elecparam, calciump] = loadglobal; %load params. g(i) is conductance, e(j) is reversal potential for i,jth ion
dy = zeros(7,1);
    if t>=elecparam(5) && t<elecparam(6)
    dy(1) = (elecparam(1) ... %external current
        - g(1)*(y(2)^3).* y(3)*(y(1)-e(1)) ... %SODIUM
        - g(2)*(y(4)^4).*(y(1)-e(2)) ... %FAST POTASSIUM
        - g(3)*(y(5)^4).*(y(1)-e(2))...%SLOW POTASSIUM
        - g(4)*y(6)*y(7).*(y(1)-e(2)))/elecparam(2); %A-TYPE POTASSIUM
    else 
         dy(1) = (0 ... %external current
        - g(1)*(y(2)^3).* y(3)*(y(1)-e(1)) ... %SODIUM
        - g(2)*(y(4)^4).*(y(1)-e(2)) ... %FAST POTASSIUM
        - g(3)*(y(5)^4).*(y(1)-e(2))...%SLOW POTASSIUM
        - g(4)*y(6)*y(7).*(y(1)-e(2)))/elecparam(2); %A-TYPE POTASSIUM
    end

dy(2) = a_m(y(1)).*(1-y(2)) - b_m(y(1)).* y(2); %dm/dt SODIUM
dy(3) = a_h(y(1)).*(1-y(3)) - b_h(y(1)).* y(3); %dh/dt SODIUM
dy(4) = a_nf(y(1)).*(1-y(4)) - b_nf(y(1)).* y(4); %dnf/dt FAST POTASSIUM
dy(5) = a_ns(y(1)).*(1-y(5)) - b_ns(y(1)).* y(5); %dns/dt SLOW POTASSIUM 
dy(6) = ((1/(1+a_k(y(1))))-y(6)) / ((b_k(y(1)/(0.015*(1+a_k(y(1))))))); %dk/dt A-TYPE POTASSIUM
dy(7) = ((1/(1+a_l(y(1))))-y(7)) / ((b_l(y(1))/(0.015*(1+a_l(y(1)))))); %dl/dt A-TYPE POTASSIUM

end % end function 
