function betal = b_l(v)
    zetal = 4;
    vhalfl	= -83;
    celsius = 6.3;
    gml	= 1;
    betal = exp(1.e-3*zetal*gml*(v-vhalfl)*9.648e4/(8.315*(273.16+celsius)));
end