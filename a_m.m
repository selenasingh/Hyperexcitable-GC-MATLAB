function alpham = a_m(v) %matches .mod file
    if abs((v+60-17)/-5) < 1e-6 %protects against zero in denom
        alpham = -5*(1-(v+60-17)/-5/2); 
    else
        alpham = -0.3*(v+60-17)/(exp(((v+60-17)/-5))-1);
    end %end if
end

%{
function alpham = a_m(v)
    alpham = -0.3*(v-25)/(exp(((v-25)/-5))-4);
end
%}