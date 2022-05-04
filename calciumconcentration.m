for i=1:length(y(:,15))
    eca_store(i) = eca(y(i,13), y(i,14), y(i,15));
    cai_store(i) = y(i,13)+ y(i,14)+ y(i,15);
end