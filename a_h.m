function alphah = a_h(v) %matches .mod file
    alphah = 0.23/exp((v+60+5)/20);
end

%{
function alphah = a_h(v)
    alphah = 0.23/(exp(((v-3)/20)));
end
%}