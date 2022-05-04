function dy = granulecell(t, y) 
[g, e, elecparam, calciump] = loadglobal; %load params. g(i) is conductance, e(j) is reversal potential for i,jth ion
dy = zeros(19,1);
if t>=elecparam(5) && t<elecparam(6) %if it's time for current injection, use this DE
dy(1) = (elecparam(1) ... %external current
        - g(1)*(y(2)^3).* y(3)*(y(1)-e(1)) ... %SODIUM
        - g(2)*(y(4)^4).*(y(1)-e(2)) ... %FAST POTASSIUM
        - g(3)*(y(5)^4).*(y(1)-e(2))...%SLOW POTASSIUM
        - g(4)*y(6)*y(7).*(y(1)-e(2)) ...%A-TYPE POTASSIUM
        - g(5)*(y(8)^2)*y(9).*(y(1)-eca(y(13), y(14), y(15))) ...%T-TYPE CALCIUM
        - g(6)*(y(10)^2)*y(11).*(y(1)-eca(y(13), y(14), y(15))) ...%N-TYPE CALCIUM 
        - g(7)*(y(12)^2).*(y(1)-eca(y(13), y(14), y(15))) ...%L-TYPE CALCIUM
        - g(8)*y(16).*(y(17)^2).*(y(1)-e(2)) ...%CALCIUM-DEP POTASSIUM (BK) [large conductance]
        - g(9)*(y(18)^2).*(y(1)-e(2)) ...%CALCIUM-DEP POTASSIUM (SK) [large conductance]
        - g(10)*(y(1)-e(3)) ...%TONIC GABA
        - g(11)*y(19).*(y(1)-e(4)) ... %KIR POTASSIUM
            )/elecparam(2); 
else %otherwise use this DE
    dy(1) = (0 ... %external current
        - g(1)*(y(2)^3).* y(3)*(y(1)-e(1)) ... %SODIUM
        - g(2)*(y(4)^4).*(y(1)-e(2)) ... %FAST POTASSIUM
        - g(3)*(y(5)^4).*(y(1)-e(2))...%SLOW POTASSIUM
        - g(4)*y(6)*y(7).*(y(1)-e(2)) ...%A-TYPE POTASSIUM
        - g(5)*(y(8)^2)*y(9).*(y(1)-eca(y(13), y(14), y(15))) ...%T-TYPE CALCIUM
        - g(6)*(y(10)^2)*y(11).*(y(1)-eca(y(13), y(14), y(15))) ...%N-TYPE CALCIUM 
        - g(7)*(y(12)^2).*(y(1)-eca(y(13), y(14), y(15))) ...%L-TYPE CALCIUM
        - g(8)*y(16).*(y(17)^2).*(y(1)-e(2)) ...%CALCIUM-DEP POTASSIUM (BK) [large conductance]
        - g(9)*(y(18)^2).*(y(1)-e(2)) ...%CALCIUM-DEP POTASSIUM (SK) [large conductance]
        - g(10)*(y(1)-e(3)) ...%TONIC GABA
        - g(11)*y(19).*(y(1)-e(4)) ... %KIR POTASSIUM
            )/elecparam(2); 
end %end if

dy(2) = a_m(y(1)).*(1-y(2)) - b_m(y(1)).* y(2); %dm/dt SODIUM
dy(3) = a_h(y(1)).*(1-y(3)) - b_h(y(1)).* y(3); %dh/dt SODIUM
dy(4) = a_nf(y(1)).*(1-y(4)) - b_nf(y(1)).* y(4); %dnf/dt FAST POTASSIUM
dy(5) = a_ns(y(1)).*(1-y(5)) - b_ns(y(1)).* y(5); %dns/dt SLOW POTASSIUM 
dy(6) = ((1/(1+a_k(y(1))))-y(6)) / ((b_k(y(1)/(0.015*(1+a_k(y(1))))))); %dk/dt A-TYPE POTASSIUM
dy(7) = ((1/(1+a_l(y(1))))-y(7)) / ((b_l(y(1))/(0.015*(1+a_l(y(1)))))); %dl/dt A-TYPE POTASSIUM
dy(8) = a_a(y(1)).*(1-y(8)) - b_a(y(1)).* y(8); %da/dt T-TYPE CALCIUM 
dy(9) = a_b(y(1)).*(1-y(9)) - b_b(y(1)).* y(9); %db/dt T-TYPE CALCIUM [WORKS--adding this increases current tolerance]
dy(10) = a_c(y(1)).*(1-y(10)) - b_c(y(1)).* y(10); %dc/dt N-TYPE CALCIUM 
dy(11) = a_d(y(1)).*(1-y(11)) - b_d(y(1)).* y(11); %dd/dt N-TYPE CALCIUM [WORKS--adding this introduces fast bursting]
dy(12) = a_e(y(1)).*(1-y(12)) - b_e(y(1)).* y(12);%de/dt L-TYPE CALCIUM [WORKS--adding this doesn't change much, more stability at higher currents?]

%calcium concentration eq'ns
dy(13) = -(g(5)*(y(8)^2)*y(9).*(y(1)-eca(y(13), y(14), y(15))))/elecparam(3)/elecparam(4) * (1e7) + (calciump(1)/3 - y(13))/calciump(2); %CALCIUM CONCENTRATION, T-TYPE 
dy(14) = -(g(6)*(y(10)^2)*y(11).*(y(1)-eca(y(13), y(14), y(15))))/elecparam(3)/elecparam(4) * (1e7) + (calciump(1)/3 - y(14))/calciump(2); %CALCIUM CONCENTRATION, N-TYPE
dy(15) = -(g(7)*(y(12)^2).*(y(1)-eca(y(13), y(14), y(15))))/elecparam(3)/elecparam(4) * (1e7) + (calciump(1)/3 - y(15))/calciump(2); %CALCIUM CONCENTRATION, L-TYPE

%calcium-dependant potassium
dy(16) = 7.5*(1-y(16)) - b_r(y(1)).* y(16); %CALCIUM-DEP POTASSIUM (BK) [WORKS--adding this removes fast bursting, increases current tolerance]
dy(17) = (s_inf(y(13), y(14), y(15))-y(17))/10; %CALCIUM-DEP POTASSIUM (BK) [WORKS--adding this removes fast bursting, increases current tolerance]
dy(18) = a_q(y(13), y(14), y(15)).*(1-y(18)) - b_q(y(13), y(14), y(15)).* y(18); %CALCIUM-DEP POTASSIUM (SK) [WORKS--increases current tolerance even more]

%final potassium channel 
dy(19) = (p_inf(y(1))-y(19))/p_tau(y(1)); %KIR POTASSIUM 
end % end function 
