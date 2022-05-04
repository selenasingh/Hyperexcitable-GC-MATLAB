function alphaa = a_a(v) %matches .mod file
    if abs((v-19.26)/-10) < 1e-6 %protects against zero in denom
        alphaa = -10*(1-(v-19.26)/-10/2); 
    else
    alphaa = -0.2*(v-19.26)/(exp(((v-19.26)/-10))-1);
    end %end if
end