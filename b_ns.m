function betans = b_ns(v) %matches .mod file
    betans = 0.1056/exp((v+65-10)/40);
end


%{
function betans = b_ns(v)
    betans = 0.1056/(exp(((v-10)/40)));
end
%}