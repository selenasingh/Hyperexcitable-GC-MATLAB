function betanf = b_nf(v) %matches .mod file
    betanf = 0.264/exp((v+65-22)/40);
end

%{
function betanf = b_nf(v)
    betanf = 0.264/(exp(((v-22)/40)));
end
%}