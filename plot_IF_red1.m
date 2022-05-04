%%% IF-Curves for reduced models %%%
initparams
%%%%%%%%%%%%%%% MEMBRANEODE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_ext = [0.7:0.01:1 1:1:10];

t_startinj = 0;
t_stopinj = 100;
t_run = 110;

clear freq i_store
for i=1:length(i_ext)
    I_ext = i_ext(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0];
    [t,y] = ode15s(@membraneODE, tspan, y0);% options);
    if max(t) == t_run
        freq(i) = length(findpeaks(y(:,1), 'MinPeakHeight', -10));
        i_store(i) = i_ext(i);
    end
    comb = [i_store; freq];
    comb( :, all(~comb,1) ) = []; %remove 0s. 
end

fig = figure();
nexttile
hold on 

plot(comb(1,:), comb(2,:), '-o')



%%%%%%%%%%%%%%% MEMBRANEODE CA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
initparams
i_ext = [0.7:0.01:1 1:1:10];

t_startinj = 0;
t_stopinj = 100;
t_run = 110;

clear freq i_store
for i=1:length(i_ext)
    I_ext = i_ext(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0];
    [t,y] = ode15s(@membraneODE_ca, tspan, y0);% options);
    if max(t) == t_run
        freq(i) = length(findpeaks(y(:,1), 'MinPeakHeight', -10));
        i_store(i) = i_ext(i);
    end
    comb = [i_store; freq];
    comb( :, all(~comb,1) ) = []; %remove 0s. 
end

plot(comb(1,:), comb(2,:), '-o')

%%%%%%%%%%%%%%% MEMBRANEODE CA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_ext = [0.7:0.01:1 1:1:10];

t_startinj = 0;
t_stopinj = 100;
t_run = 110;

clear freq i_store
for i=1:length(i_ext)
    I_ext = i_ext(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0];
    [t,y] = ode15s(@membraneODE_withcon, tspan, y0);% options);
    if max(t) == t_run
        freq(i) = length(findpeaks(y(:,1), 'MinPeakHeight', -10));
        i_store(i) = i_ext(i);
    end
    comb = [i_store; freq];
    comb( :, all(~comb,1) ) = []; %remove 0s. 
end

plot(comb(1,:), comb(2,:), '-o')

hold off

legend({'Sodium + Potassium', '+ Calcium', '+ {d[Ca^{2+}]/dt}'}, 'location', 'best')
xlabel('I_{ext} (pA)')
ylabel('Number of Spikes')



%%%%%%%%%%%%%%%%% BK SK %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_ext = 30:1:200 ;

t_startinj = 100;
t_stopinj = 500;
t_run = 550;

nexttile

hold on 
clear freq i_store
for i=1:length(i_ext)
    I_ext = i_ext(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0];
    [t,y] = ode15s(@membraneODE_withcon_bksk, tspan, y0);% options);
    if max(t) == t_run
        freq(i) = length(findpeaks(y(:,1), 'MinPeakHeight', -10));
        i_store(i) = i_ext(i);
    end
    comb = [i_store; freq];
    comb( :, all(~comb,1) ) = []; %remove 0s. 

end

plot(comb(1,:), comb(2,:), '-o')

%%%%%%%%%%%%%%%%% complete model %%%%%%%%%%%%%%%%%%%%%%

i_ext = 30:1:200 ;

t_startinj = 100;
t_stopinj = 500;
t_run = 550;

clear freq i_store
for i=1:length(i_ext)
    I_ext = i_ext(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
    [t,y] = ode15s(@granulecell, tspan, y0);% options);
    if max(t) == t_run
        freq(i) = length(findpeaks(y(:,1), 'MinPeakHeight', -10));
        i_store(i) = i_ext(i);
    end
    comb = [i_store; freq];
    comb( :, all(~comb,1) ) = []; %remove 0s. 

end

plot(comb(1,:), comb(2,:), '-o')

hold off
legend({'+BK & SK', 'Complete model'}, 'location', 'best')
xlabel('I_{ext} (pA)')
ylabel('Number of Spikes')

saveas(fig, 'plot_IFcurves_redmods.jpeg')




