%%%% plot var calcium removal rate on bursting %%%%
initparams

clear eca_store cai_store
t_startinj = 0;
t_stopinj = 300;
t_run = 500;

vartau = [1.2, 9, 18];

fig=figure();
tiledlayout(3,1)

nexttile
hold on 

for i=1:length(vartau)
    tau = vartau(i);
    I_ext = 39;
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
    [t,y] = ode15s(@granulecell, tspan, y0);
    plot(t,y(:,1))
end
hold off

legend({'\tau = 1.2 ms', '\tau = 9 ms', '\tau = 18 ms'})
xlabel('Time (ms)')
ylabel('Voltage (mV)')

%%%%%%%%%%%%%%%%% CALCIUM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t_startinj = 0;
t_stopinj = 300;
t_run = 500;

vartau = [1.2, 9, 18];

nexttile
hold on 

for i=1:length(vartau)
    tau = vartau(i);
    I_ext = 39;
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
    [t,y] = ode15s(@granulecell, tspan, y0);
    for k=1:length(y(:,15))
        eca_store(k) = eca(y(k,13), y(k,14), y(k,15));
        cai_store(k) = y(k,13)+ y(k,14)+ y(k,15);
    end
    plot(t, eca_store)
    clear eca_store cai_store
end
hold off

legend({'\tau = 1.2 ms', '\tau = 9 ms', '\tau = 18 ms'}, 'location', 'best')
xlabel('Time (ms)')
ylabel('Ca^{2+} Reversal Potential (mV)')

nexttile
hold on 

for i=1:length(vartau)
    tau = vartau(i);
    I_ext = 39;
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
    [t,y] = ode15s(@granulecell, tspan, y0);
    for k=1:length(y(:,15))
        eca_store(k) = eca(y(k,13), y(k,14), y(k,15));
        cai_store(k) = y(k,13)+ y(k,14)+ y(k,15);
    end
    plot(t, cai_store)
    clear eca_store cai_store
end
hold off

legend({'\tau = 1.2 ms', '\tau = 9 ms', '\tau = 18 ms'})
xlabel('Time (ms)')
ylabel('[Ca^{2+}] (mM)')

saveas(fig, 'plot_vartau.jpeg')

%%%%%%%%%%%%%%%%%%%%%%%%%% F-I curve %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_ext = 10:10:200 ; % RE-RUN WITH SMALLER STEPS
vartau = [1.2, 9.1, 18];

t_startinj = 0;
t_stopinj = 100;
t_run = 100;

clear freq i_store comb comb2 comb3
for i=1:length(i_ext)
    I_ext = i_ext(i);
    tau = vartau(1);
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

clear freq i_store
for i=1:length(i_ext)
    I_ext = i_ext(i);
    tau = vartau(2);
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

clear freq i_store
for i=1:length(i_ext)
    I_ext = i_ext(i);
    tau = vartau(3);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
    [t,y] = ode15s(@granulecell, tspan, y0);% options);
    if max(t) == t_run
        freq(i) = length(findpeaks(y(:,1), 'MinPeakHeight', -10));
        i_store(i) = i_ext(i);
    end
comb3 = [i_store; freq];
comb3( :, all(~comb3,1) ) = []; %remove 0s. 
end


fig2 = figure();
hold on
plot(comb(1,:), comb(2,:), '-o')
plot(comb2(1,:), comb2(2,:), '-o')
plot(comb3(1,:), comb3(2,:), '-o')
hold off

legend({'\tau = 1.2 ms', '\tau = 9.1 ms', '\tau = 18 ms'})
xlabel('I_{ext} (pA)')
ylabel('Number of Spikes')

