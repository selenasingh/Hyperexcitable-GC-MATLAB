function alphal = a_l(v)
    zetal = 4;
    vhalfl	= -83;
    celsius = 6.3;
    alphal = exp(1.e-3*zetal*(v-vhalfl)*9.648e4/(8.315*(273.16+celsius))); 
end