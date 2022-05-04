function alphae = a_e(v) %matches .mod file
    if abs((v-81.5)/-10) < 1e-6 %protects against zero in denom
        alphae = -10*(1-(v-81.5)/-10/2);
    else
        alphae = -15.69*(v-81.5)/(exp(((v-81.5)/-10))-1);
    end
end