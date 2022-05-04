%%% current injection, just sodium, fast/slow potassium, a-type
%%% potassium  %%%

initparams

%%%%%%%%%%%%%%% SUBTHRESHOLD TO SPIKE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_vals = [-0.05:0.01:-0.01 0:0.1:0.4 0.8];

t_startinj = 10;
t_stopinj = 15;
t_run = 25;


nexttile([3 1]);
hold on
for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0];
    [t,y] = ode15s(@membraneODE, tspan, y0);% options);
    plot(t,y(:,1)) 
end

hold off

xlabel("Time (ms)")
ylabel("Membrane Potential (mV)")
xlim([9,25])
legend({'I_{ext} = -0.05','I_{ext} = -0.04','I_{ext} = -0.03','I_{ext} = -0.02','I_{ext} = -0.01','I_{ext} = 0','I_{ext} = 0.1','I_{ext} = 0.2', 'I_{ext} = 0.3','I_{ext} = 0.4','I_{ext} = 0.8',})

%%%%%%%%%%%%%%%%%%%%%%%%%%%% SPIKING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_vals = 0.4:0.01:0.8;

t_startinj = 0;
t_stopinj = 500;
t_run = 800;

for i=1:length(i_vals)
    I_ext = i_vals(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0];
    [t,y] = ode15s(@membraneODE, tspan, y0);% options);
    if max(t) == t_run
        nexttile
        txt = ['I_{ext} = ' ,num2str(i_vals(i))];
        plot(t,y(:,1),'DisplayName',txt) 
        legend('location','best')
        xlabel("Time (ms)")
        ylabel("Membrane Potential (mV)")
    end
end


