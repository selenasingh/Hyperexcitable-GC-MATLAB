function betah = b_h(v) %matches .mod file
    betah = 3.33/(1+exp((v+60-47.5)/-10));
end

%{
function betah = b_h(v)
    betah = 3.33/(exp(((v-55.3)/-10)+1));
end
%}