%%% "FI", complete granule cell model %%%
%%% weird results %%%

%%%%%%%%%%%%%%%%%%% HEALTHY CONTROL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
initparams
gkir = gkir * 0 ;

% sodium conductances : unchanged
% gkfbar: unchanged 
% gksbar: unchanged
% ka: unchanged
% kir: removed [abe is removing this]
warning('off')
t_startinj = 0;
t_stopinj = 500;
t_run = 500;
i_ext = [35:0.25:60, 60:1:125];


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


%%%%%%%%%%%%%%%%%%% BD - LR  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sodium conductances : 1.03
% kdr: 1.15 (applies to fast and slow potassium)
% ka: 0.0096/0.008
% kir: removed 
initparams
gna = gna * 1.03; 
gfkdr = 16 * 1.15 ; % mS/cm^2 Santhakumar
gskdr = 6 * 1.15; % mS/cm^2 Santhakumar
gka = 12 * 0.0096/0.008; % mS/cm^2 Santhakumar
gkir = 0.0144 * 0; % mS/cm^2 Yim

t_startinj = 0;
t_stopinj = 500;
t_run = 500;

clear freq2 i_store2
for i=1:length(i_ext)
    I_ext = i_ext(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
    [t,y] = ode15s(@granulecell, tspan, y0);% options);
    if max(t) == t_run
        freq2(i) = length(findpeaks(y(:,1), 'MinPeakHeight', -10));
        i_store2(i) = i_ext(i);
    end
    comb2 = [i_store2; freq2];
    comb2( :, all(~comb2,1) ) = []; %remove 0s. 
end


%%%%%%%%%%%%%%%%%%% BD - LNR  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sodium conductances : 0.026/0.033
% kdr: 1.3 (applies to fast and slow potassium)
% ka: 0.0104/0.008
% kir: removed [abe is removing this]
initparams
gna = gna * 0.026/0.033; 
gfkdr = 16 * 1.3 ; % mS/cm^2 Santhakumar
gskdr = 6 * 1.3; % mS/cm^2 Santhakumar
gka = 12 * 0.0104/0.008; % mS/cm^2 Santhakumar
gkir = 0.0144 * 0; % mS/cm^2 Yim

t_startinj = 0;
t_stopinj = 500;
t_run = 500;


clear freq3 i_store3
for i=1:length(i_ext)
    I_ext = i_ext(i);
    [g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
    declareglobal(g, e, elecparam, calciump);
    tspan = [0; t_run];
    y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
    [t,y] = ode15s(@granulecell, tspan, y0);% options);
    if max(t) == t_run
        freq3(i) = length(findpeaks(y(:,1), 'MinPeakHeight', -10));
        i_store3(i) = i_ext(i);
    end
    comb3 = [i_store3; freq3];
    comb3( :, all(~comb3,1) ) = []; %remove 0s. 
end


fig1 = figure();
hold on 


scatter(i_store, freq)
scatter(i_store2, freq2)
scatter(i_store3, freq3)

hold off

xlim([35, 125])
legend({'Healthy', 'BD-LR', 'BD-LNR'})
xlabel('I_{ext}')
ylabel('Number of Spikes')


fig3 = figure(); 
nexttile
hold on
plot(comb(1,:), comb(2,:), '-o')
plot(comb2(1,:), comb2(2,:), '-o')
plot(comb3(1,:), comb3(2,:), '-o')
hold off
legend({'Healthy', 'BD-LR', 'BD-LNR'}, 'location', 'best')
xlabel('I_{ext} (pA)')
ylabel('Number of Spikes')

nexttile
xlim([40,60])
hold on
plot(comb(1,:), comb(2,:), '-o')
plot(comb2(1,:), comb2(2,:), '-o')
plot(comb3(1,:), comb3(2,:), '-o')
hold off
legend({'Healthy', 'BD-LR', 'BD-LNR'}, 'location', 'best')
xlabel('I_{ext} (pA)')
ylabel('Number of Spikes')

saveas(fig3, 'plot_BD_IF.jpeg')

fig2 = figure();
hold on

Fit = polyfit(i_store,freq,1); 
new_is2 = linspace(min(i_store), max(i_store), 1000);
plot(polyval(Fit,new_is2))

Fit2 = polyfit(i_store2,freq2,1); 
new_is2 = linspace(min(i_store2), max(i_store2), 1000);
plot(polyval(Fit2,new_is2))

Fit3 = polyfit(i_store3,freq3,1); 
new_is2 = linspace(min(i_store3), max(i_store3), 1000);
plot(polyval(Fit3,new_is2))

hold off

xlim([35,200])
legend({'Healthy', 'BD-LR', 'BD-LNR'})
xlabel('I_{ext}')
ylabel('Number of Spikes')

