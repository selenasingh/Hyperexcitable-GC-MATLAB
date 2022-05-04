%%% current injection, holding calcium revpot constant%%%

initparams

%%%%%%%%%%%%%%% SUBTHRESHOLD TO SPIKE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_vals = [-0.04:0.01:-0.01 0:0.05:0.3 0.315];
t_startinj = 100;
t_stopinj = 409.5;
t_run = 500;


nexttile([3 1])
hold on
for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0];
    [t,y] = ode15s(@membraneODE_ca, tspan, y0);% options);

    plot(t,y(:,1)) 
end

hold off

xlabel("Time (msec)")
ylabel("Membrane Potential (mV)")
legend({'I_{ext} = -0.04','I_{ext} = -0.03','I_{ext} = -0.02','I_{ext} = -0.01','I_{ext} = 0','I_{ext} = 0.05','I_{ext} = 0.1', 'I_{ext} = 0.15','I_{ext} = 0.2','I_{ext} = 0.25','I_{ext} = 0.3','I_{ext} = 0.315'}, Location = 'northwest')

%%%%%%%%%%%%%%%%%%%%%%%%%%%% SPIKING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_vals = [0.41, 0.44, 0.5];
t_startinj = 0;
t_stopinj = 250;
t_run = 400;

for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0];
    [t,y] = ode15s(@membraneODE_ca, tspan, y0);% options);
    nexttile
    txt = ['I_{ext} = ', num2str(i_vals(i))];
    plot(t,y(:,1), 'DisplayName', txt) 
    xlabel("Time (msec)")
    ylabel("Membrane Potential (mV)")
    legend show
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Periodic Spiking  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
t_startinj = 0;
t_stopinj = 720;
t_run = 1000;
I_ext = 0.34;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0];
[t,y] = ode15s(@membraneODE_ca, tspan, y0);% options);
fig3 = figure();
plot(t,y(:,1)) 
xlabel("Time (msec)")
ylabel("Membrane Potential (mV)")

%%%%%%%%%%%%%%%%%%%%%%%%%%%% BURSTING  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
t_startinj = 0;
t_stopinj = 200;
t_run = 250;
i_ext = [0.42, 0.43, 0.44, 0.45]; %vals that produce bursting

fig4 = figure();
tiledlayout(length(i_ext),1)
for i=1:length(i_ext)
    I_ext = i_ext(i); 
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0];
    [t,y] = ode15s(@membraneODE_ca, tspan, y0);% options);
    nexttile
    txt = ['I_{ext} = ', num2str(i_ext(i))];
    plot(t,y(:,1), 'DisplayName', txt) 
    xlim([170,210])
    xlabel("Time (msec)")
    ylabel("MP (mV)")
    legend show

end

saveas(fig3, 'plot_periodic_ca.jpeg')
saveas(fig4, 'plot_bursting_ca.jpeg')





