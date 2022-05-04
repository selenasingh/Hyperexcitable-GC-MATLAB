%%% plot_BD_subthresholdtospike%%%%%%

%%%%%%%%%%%%%%%%%%%%%% HC %%%%%%%%%%%%%%%%%%%
initparams
gkir = gkir * 0 ;
i_vals = [-0.5:0.1:-0.1 0:0.1:0.6];
t_startinj = 50;
t_stopinj = 60;
t_run = 150;

fig=figure();
tiledlayout(1,3)
nexttile
hold on
for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
    [t,y] = ode15s(@granulecell, tspan, y0);% options);

    plot(t,y(:,1)) 
end

hold off

xlim([40,70])
xlabel("Time (ms)")
ylabel("Membrane Potential (mV)")
legend({'I_{ext} = -0.5','I_{ext} = -0.4','I_{ext} = -0.3','I_{ext} = -0.2','I_{ext} = -0.1','I_{ext} = 0','I_{ext} = 0.1','I_{ext} = 0.2', 'I_{ext} = 0.3','I_{ext} = 0.4', 'I_{ext} = 0.5', 'I_{ext} = 0.6','I_{ext} = 0.7'}, Location = 'northeast')
title("HC")
%%%%%%%%%%%%%%%%%%%%%%%%%%%% BD-LR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
initparams
gna = gna * 1.03; 
gfkdr = 16 * 1.15 ; % mS/cm^2 Santhakumar
gskdr = 6 * 1.15; % mS/cm^2 Santhakumar
gka = 12 * 0.0096/0.008; % mS/cm^2 Santhakumar
gkir = 0.0144 * 0; % mS/cm^2 Yim
i_vals = [-0.5:0.1:-0.1 0:0.1:0.7];
t_startinj = 50;
t_stopinj = 60;
t_run = 150;

nexttile
hold on
for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
    [t,y] = ode15s(@granulecell, tspan, y0);% options);

    plot(t,y(:,1)) 
end

hold off
xlim([40,70])
xlabel("Time (ms)")
ylabel("Membrane Potential (mV)")
legend({'I_{ext} = -0.5','I_{ext} = -0.4','I_{ext} = -0.3','I_{ext} = -0.2','I_{ext} = -0.1','I_{ext} = 0','I_{ext} = 0.1','I_{ext} = 0.2', 'I_{ext} = 0.3','I_{ext} = 0.4', 'I_{ext} = 0.5', 'I_{ext} = 0.6','I_{ext} = 0.7'}, Location = 'northeast')
title("BD-LR")

%%%%%%%%%%%%%%%%%%%%%%%%%%%% BD-LNR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

initparams
gna = gna * 0.026/0.033; 
gfkdr = 16 * 1.3 ; % mS/cm^2 Santhakumar
gskdr = 6 * 1.3; % mS/cm^2 Santhakumar
gka = 12 * 0.0104/0.008; % mS/cm^2 Santhakumar
gkir = 0.0144 * 0; % mS/cm^2 Yim
i_vals = [-0.5:0.1:-0.1 0:0.1:0.7 1.1];
t_startinj = 50;
t_stopinj = 60;
t_run = 150;

nexttile
hold on
for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
    [t,y] = ode15s(@granulecell, tspan, y0);% options);

    plot(t,y(:,1)) 
end

hold off
xlim([40,70])
xlabel("Time (ms)")
ylabel("Membrane Potential (mV)")
legend({'I_{ext} = -0.5','I_{ext} = -0.4','I_{ext} = -0.3','I_{ext} = -0.2','I_{ext} = -0.1','I_{ext} = 0','I_{ext} = 0.1','I_{ext} = 0.2', 'I_{ext} = 0.3','I_{ext} = 0.4', 'I_{ext} = 0.5', 'I_{ext} = 0.6','I_{ext} = 0.7','I_{ext} = 1.1' }, Location = 'northeast')
title("BD-LNR")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% single spike of each condition against one another %%%
fig1=figure();
tiledlayout(1,2)
nexttile
hold on 
initparams
gkir = gkir * 0 ;
I_ext = 0.6;
t_startinj = 50;
t_stopinj = 100;
t_run = 150;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);% options);

plot(t,y(:,1)) 

initparams
gna = gna * 1.03; 
gfkdr = 16 * 1.15 ; % mS/cm^2 Santhakumar
gskdr = 6 * 1.15; % mS/cm^2 Santhakumar
gka = 12 * 0.0096/0.008; % mS/cm^2 Santhakumar
gkir = 0.0144 * 0; % mS/cm^2 Yim
I_ext = 0.7;
t_startinj = 50;
t_stopinj = 100;
t_run = 150;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);% options);

plot(t,y(:,1)) 

initparams
gna = gna * 0.026/0.033; 
gfkdr = 16 * 1.3 ; % mS/cm^2 Santhakumar
gskdr = 6 * 1.3; % mS/cm^2 Santhakumar
gka = 12 * 0.0104/0.008; % mS/cm^2 Santhakumar
gkir = 0.0144 * 0; % mS/cm^2 Yim
I_ext = 1.1;
t_startinj = 50;
t_stopinj = 100;
t_run = 150;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);% options);

plot(t,y(:,1)) 

hold off
xlim([48 55])
legend({'HC         (I_{ext} = 0.6 nA)', 'BD-LR   (I_{ext} = 0.7 nA)', 'BD-LNR (I_{ext} = 1.1 nA)'})
xlabel('Time (ms)')
ylabel('Voltage (mV)')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% single spike of each condition against one another %%%
nexttile
hold on 
initparams
gkir = gkir * 0 ;
I_ext = 90;
t_startinj = 0;
t_stopinj = 150;
t_run = 150;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);% options);

plot(t,y(:,1)) 

initparams
gna = gna * 1.03; 
gfkdr = 16 * 1.15 ; % mS/cm^2 Santhakumar
gskdr = 6 * 1.15; % mS/cm^2 Santhakumar
gka = 12 * 0.0096/0.008; % mS/cm^2 Santhakumar
gkir = 0.0144 * 0; % mS/cm^2 Yim
I_ext = 90;
t_startinj = 0;
t_stopinj = 150;
t_run = 150;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);% options);

plot(t,y(:,1)) 

initparams
gna = gna * 0.026/0.033; 
gfkdr = 16 * 1.3 ; % mS/cm^2 Santhakumar
gskdr = 6 * 1.3; % mS/cm^2 Santhakumar
gka = 12 * 0.0104/0.008; % mS/cm^2 Santhakumar
gkir = 0.0144 * 0; % mS/cm^2 Yim
I_ext = 90;
t_startinj = 0;
t_stopinj = 150;
t_run = 150;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);% options);

plot(t,y(:,1)) 

hold off
xlim([80 95])
legend({'HC', 'BD-LR', 'BD-LNR'})
xlabel('Time (ms)')
ylabel('Voltage (mV)')