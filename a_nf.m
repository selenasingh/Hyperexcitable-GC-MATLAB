function alphanf = a_nf(v) %matches .mod file
    if abs((v+65-47)/-6) < 1e-6 %protects against 0 in denom
        alphanf = -6*(1-(v+65-47)/-6/2);
    else
        alphanf = -0.07*(v+65-47)/(exp(((v+65-47)/-6))-1);  
    end %end if
end


%{
function alphanf = a_nf(v)
    alphanf = -0.07*(v-47)/(exp(((v-47)/-6))-1);
end
%}