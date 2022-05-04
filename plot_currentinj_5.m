%%% current injection, with calcium-dep channel (BK and SK) and var [Ca], ECa %%%

%{
clear all 
close all
initparams
%}

%%%%%%%%%%%%%%% SUBTHRESHOLD TO SPIKE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_vals = [-0.04:0.01:-0.01 0:0.1:0.5 0.56];
t_startinj = 50;
t_stopinj = 60;
t_run = 70;

nexttile([3 1])
hold on
for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0];
    [t,y] = ode15s(@membraneODE_withcon_bksk, tspan, y0);% options);

    plot(t,y(:,1)) 
end

hold off

xlim([40,70])
xlabel("Time (ms)")
ylabel("Membrane Potential (mV)")
legend({'I_{ext} = -0.04','I_{ext} = -0.03','I_{ext} = -0.02','I_{ext} = -0.01','I_{ext} = 0','I_{ext} = 0.1','I_{ext} = 0.2', 'I_{ext} = 0.3','I_{ext} = 0.4','I_{ext} = 0.5', 'I_{ext}=0.56'}, Location = 'northeast')

%%%%%%%%%%%%%%%%%%%%%%%%%%%% SPIKING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_vals = [43, 48, 72];
t_startinj = 100;
t_stopinj = 400;
t_run = 500;

for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0];
    [t,y] = ode15s(@membraneODE_withcon_bksk, tspan, y0);% options);
    nexttile
    txt = ['I_{ext} = ', num2str(i_vals(i))];
    plot(t,y(:,1), 'DisplayName', txt) 
    xlabel("Time (ms)")
    ylabel("Membrane Potential (mV)")
    legend show
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%% BURSTING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_vals = [67.5, 67.8, 72];
t_startinj = 100;
t_stopinj = 260;
t_run = 300;

fig2 = tiledlayout(length(i_vals),1);
for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0];
    [t,y] = ode15s(@membraneODE_withcon_bksk, tspan, y0);% options);
    nexttile
    txt = ['I_{ext} = ', num2str(i_vals(i))];
    plot(t,y(:,1), 'DisplayName', txt) 
    xlim([50,300])
    xlabel("Time (ms)")
    ylabel("Membrane Potential (mV)")
    legend('location', 'northeast')
end

saveas(fig2, 'plot_bursting_withconbksk.jpeg')

%%%%%%%%%%%%%%%%% PERIODIC FIRING (?) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t_startinj = 100;
t_stopinj = 440;
t_run = 500;
I_ext = 67.5;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0];
[t,y] = ode15s(@membraneODE_withcon_bksk, tspan, y0);% options);

fig3 = figure();
plot(t,y(:,1))

saveas(fig3, 'plot_periodic_withconbksk.jpeg')

%%%%%%%%%%%%%%%%% CALCIUM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all 
initparams
t_startinj = 0;
t_stopinj = 440;
t_run = 600;
I_ext = 89;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0];
[t,y] = ode15s(@membraneODE_withcon_bksk, tspan, y0);% options);

for i=1:length(y(:,15))
    eca_store(i) = eca(y(i,13), y(i,14), y(i,15));
    cai_store(i) = y(i,13)+ y(i,14)+ y(i,15);
end

fig5 = figure();
tiledlayout(5,1)
nexttile
plot(t, y(:,1))
xlabel("Time (ms)")
ylabel("MP (mV)")
nexttile
plot(t, eca_store)
xlabel("Time (ms)")
ylabel("Ca^{2+} Rev.P (mV)")
nexttile
plot(t, cai_store)
xlabel("Time (ms)")
ylabel("[Ca^{2+}]_{in} (mM)")
nexttile
plot(t, y(:,17))
xlabel("Time (ms)")
ylabel ("s([Ca^{2+}])")
nexttile
plot(t, y(:,18))
xlabel("Time (ms)")
ylabel ("q([Ca^{2+}])")

saveas(fig5, 'plot_calcdyn_withconbksk.jpeg')



