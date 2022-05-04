function alphak = a_k(v)
    zetan	= -3;
    halfn	= -33.6;
    celsius = 6.3;
    alphak = exp(1.e-3*zetan*(v-halfn)*9.648e4/(8.315*(273.16+celsius)));
end