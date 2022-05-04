%%% current injection, complete granule cell model %%%


clear all 
close all
initparams


%%%%%%%%%%%%%%% SUBTHRESHOLD TO SPIKE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_vals = [-0.5:0.1:-0.1 0:0.1:0.7];
t_startinj = 50;
t_stopinj = 60;
t_run = 150;

nexttile([3,1])
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%% SPIKING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_vals = [40, 42, 45];
t_startinj = 100;
t_stopinj = 400;
t_run = 500;

for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
    [t,y] = ode15s(@granulecell, tspan, y0);% options);
    nexttile
    txt = ['I_{ext} = ', num2str(i_vals(i))];
    plot(t,y(:,1), 'DisplayName', txt) 
    xlabel("Time (ms)")
    ylabel("Membrane Potential (mV)")
    legend('location', 'best')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%% BURSTING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_vals = [111.6, 112, 112.3];
t_startinj = 100;
t_stopinj = 260;
t_run = 300;
fig3 = figure();
tiledlayout(length(i_vals),1)
for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
    [t,y] = ode15s(@granulecell, tspan, y0);% options);
    nexttile
    txt = ['I_{ext} = ', num2str(i_vals(i))];
    plot(t,y(:,1), 'DisplayName', txt) 
    xlim([50,300])
    xlabel("Time (ms)")
    ylabel("Membrane Potential (mV)")
    legend show
end

%%%%%%%%%%%%%%%%% Emergence of periodic firing %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i_vals = [120, 130, 140];
t_startinj = 100;
t_stopinj = 300;
t_run = 400;
fig4 = figure();
tiledlayout(length(i_vals),1)
for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
    [t,y] = ode15s(@granulecell, tspan, y0);% options);
    nexttile
    txt = ['I_{ext} = ', num2str(i_vals(i))];
    plot(t,y(:,1), 'DisplayName', txt) 
    xlim([50,300])
    xlabel("Time (ms)")
    ylabel("Membrane Potential (mV)")
    legend show
end

%%%%%%%%%%%%%%%%% higher external current %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i_vals = [182, 185, 280, 320, 400];
t_startinj = 100;
t_stopinj = 300;
t_run = 400;
fig5 = figure();
tiledlayout(length(i_vals),1)
for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
    [t,y] = ode15s(@granulecell, tspan, y0);% options);
    nexttile
    txt = ['I_{ext} = ', num2str(i_vals(i))];
    plot(t,y(:,1), 'DisplayName', txt) 
    xlim([50,400])
    xlabel("Time (ms)")
    ylabel("MP (mV)")
    legend('location', 'best')
end


%%%%%%%%%%%%%%%%% CALCIUM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all 
initparams
t_startinj = 100;
t_stopinj = 300;
t_run = 600;
I_ext = 130;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);% options);

for i=1:length(y(:,15))
    eca_store(i) = eca(y(i,13), y(i,14), y(i,15));
    cai_store(i) = y(i,13)+ y(i,14)+ y(i,15);
end

fig6 = figure();
tiledlayout(3,1)
nexttile
plot(t, y(:,1))
xlabel("Time (ms)")
ylabel("MP (mV)")
nexttile
plot(t, eca_store)
xlabel("Time (ms)")
ylabel("Ca^{2+} Rev. P.(mV)")
nexttile
plot(t, cai_store)
xlabel("Time (ms)")
ylabel("[Ca^{2+}]_{in} (mM)")

%%%%%%%%%%%%%%%%%%%%%%%%%
%zoom in on intracellular calcium while bursting%
tiledlayout(2,1)
nexttile
plot(t, y(:,1))
xlim([212 257])
xlabel("Time (ms)")
ylabel("MP (mV)")
nexttile
plot(t, cai_store)
xlim([212 257])
xlabel("Time (ms)")
ylabel("[Ca^{2+}]_{in} (mM)")




