function alphac = a_c(v) %matches .mod file
    if abs((v-19.88)/-10) < 1e-6 %protects against zero in denom
        alphac = -10*(1-(v-19.88)/-10/2); 
    else
        alphac = -0.19*(v-19.88)/(exp(((v-19.88)/-10))-1);
    end
end