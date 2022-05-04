function alphans = a_ns(v) %matches .mod file
    if abs((v+65-35)/-6) < 1e-6 %protects against 0 in denom
        alphans = -6*(1-(v+65-35)/-6/2); 
    else
        alphans = -0.028*(v+65-35)/(exp(((v+65-35)/-6))-1);
    end %end if
end


%{
function alphans = a_ns(v)
    alphans = -0.028*(v-35)/(exp(((v-35)/-6))-1);
end
%}