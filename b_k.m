function betak = b_k(v)
    zetan	= -3;
    gmn	= 0.6;
    vhalfn	= -33.6;
    celsius = 6.3;
    betak = exp(1.e-3*zetan*gmn*(v-vhalfn)*9.648e4/(8.315*(273.16+celsius))) ;
end