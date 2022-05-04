function taup = p_tau(v)
    taup = 1/(6.1*exp((-v/-98.92))+81.1*exp((v/67.08)));
end