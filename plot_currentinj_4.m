%%% current injection, updating calcium revpot each time step%%%
clear all 
close all
initparams

%%%%%%%%%%%%%%% SUBTHRESHOLD TO SPIKE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_vals = 0:0.05:0.3;
t_startinj = 100;
t_stopinj = 415;
t_run = 500;
fig1 = figure(); hold on
for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0];
    [t,y] = ode15s(@membraneODE_withcon, tspan, y0);% options);

    plot(t,y(:,1)) 
end

I_ext = 0.315;%singlespike!
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0];
[t,y] = ode15s(@membraneODE_withcon, tspan, y0);% options);
plot(t,y(:,1)) 

hold off

xlabel("Time (msec)")
ylabel("Membrane Potential (mV)")
legend({'I_{ext} = 0','I_{ext} = 0.05','I_{ext} = 0.1', 'I_{ext} = 0.15','I_{ext} = 0.2','I_{ext} = 0.25','I_{ext} = 0.3','I_{ext} = 0.315'}, Location = 'northwest')

%%%%%%%%%%%%%%%%%%%%%%%%%%%% SPIKING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_vals = [0.35, 0.37, 0.41];
t_startinj = 0;
t_stopinj = 250;
t_run = 400;
fig2 = figure();
tiledlayout(length(i_vals),1)
for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0];
    [t,y] = ode15s(@membraneODE_withcon, tspan, y0);% options);
    nexttile
    txt = ['I_{ext} = ', num2str(i_vals(i))];
    plot(t,y(:,1), 'DisplayName', txt) 
    xlabel("Time (msec)")
    ylabel("Membrane Potential (mV)")
    legend show
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Periodic Spiking  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
t_startinj = 0;
t_stopinj = 1700;
t_run = 2000;
I_ext = 0.25;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0];
[t,y] = ode15s(@membraneODE_withcon, tspan, y0);% options);
fig3 = figure();
plot(t,y(:,1)) 
xlabel("Time (msec)")
ylabel("Membrane Potential (mV)")

%%%%%%%%%%%%%%%%%%%%%%%%%%%% BURSTING  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
t_startinj = 0;
t_stopinj = 200;
t_run = 250;
i_ext = [0.42, 0.43, 0.44, 0.448]; %vals that produce bursting

fig4 = figure();
tiledlayout(length(i_ext),1)
for i=1:length(i_ext)
    I_ext = i_ext(i); 
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0];
    [t,y] = ode15s(@membraneODE_withcon, tspan, y0);% options);
    nexttile
    txt = ['I_{ext} = ', num2str(i_ext(i))];
    plot(t,y(:,1), 'DisplayName', txt) 
    xlim([150,210])
    xlabel("Time (msec)")
    ylabel("Membrane Potential (mV)")
    legend show

end

%%%%%%%%%%%%%%%%% CALCIUM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t_startinj = 0;
t_stopinj = 200;
t_run = 300;
I_ext = 0.448;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0];
[t,y] = ode15s(@membraneODE_withcon, tspan, y0);% options);

for i=1:length(y(:,15))
    eca_store(i) = eca(y(i,13), y(i,14), y(i,15));
    cai_store(i) = y(i,13)+ y(i,14)+ y(i,15);
end

fig5 = figure();
tiledlayout(3,1)
nexttile
plot(t, y(:,1))
xlabel("Time (msec)")
ylabel("MP (mV)")
nexttile
plot(t, eca_store)
xlabel("Time (msec)")
ylabel("Ca^{2+} Rev. P.(mV)")
nexttile
plot(t, cai_store)
xlabel("Time (msec)")
ylabel("[Ca^{2+}]_{in} (mM)")





