function betam = b_m(v) %matches .mod file
    if abs((v+60-45)/5) < 1e-6 %protects against zero in denom
        betam = 5*(1-(v+60-45)/5/2); 
    else
        betam = 0.3*(v+60-45)/(exp(((v+60-45)/5))-1);
    end %end if
end

%{
function betam = b_m(v)
    betam = 0.3*(v-53)/(exp(((v-53)/5))-1);
end
%}