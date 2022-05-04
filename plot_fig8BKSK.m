%%% knock-out of BK SK channels increases hyperexcitability %%%%

initparams
t_startinj = 0;
t_stopinj = 115;
t_run = 200;

I_ext = 31;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);

fig = figure();
tiledlayout(2,1)
nexttile
plot(t, y(:,1))
ylim([-100,40])
xlabel('Time (ms)')
ylabel('Voltage (mV)')

gbk = 0;
gsk = 0;
t_startinj = 0;
t_stopinj = 115;
t_run = 200;

I_ext = 31;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);

nexttile
plot(t, y(:,1))
xlabel('Time (ms)')
ylabel('Voltage (mV)')

%%%%%%%%%%%%%%%%%%%%%%%%% IF curve %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% doesn't work bc integration failures %%%%

%{
initparams
i_ext = 20:1:200 ;

t_startinj = 0;
t_stopinj = 100;
t_run = 100;

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

fig2 = figure();
hold on
plot(comb(1,:), comb(2,:), '-o')

gbk = 0;
gsk = 0;
i_ext = 20:1:200 ;
t_startinj = 0;
t_stopinj = 100;
t_run = 100;

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
    comb2 = [i_store; freq];
    comb2( :, all(~comb2,1) ) = []; %remove 0s. 
end
plot(comb2(1,:), comb2(2,:), '-o')

hold off

legend({'Control', 'BK + SK Removed'})
xlabel('I_{ext} (pA)')
ylabel('Number of Spikes')
%}

saveas(fig, 'plot_removeBKSK.jpeg')



