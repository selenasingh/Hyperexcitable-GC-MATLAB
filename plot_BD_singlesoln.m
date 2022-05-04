%%%%%%%%%%%%%%%%%%% HEALTHY CONTROL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig1 = figure();
tiledlayout(3,3)

initparams
gkir = gkir * 0 ;

t_startinj = 0;
t_stopinj = 500;
t_run = 500;

I_ext = 42;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);

txt = ['I_{ext} = ', num2str(I_ext)];
nexttile
plot(t, y(:,1), 'DisplayName', txt)
ylim([-100,50])
title('Healthy')
legend('location', 'southoutside') 
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

I_ext = 42;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);

txt = ['I_{ext} = ', num2str(I_ext)];
nexttile
plot(t, y(:,1), 'DisplayName', txt)
ylim([-100,50])
title('BD-LR')
legend('location', 'southoutside')

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

I_ext = 42;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);

txt = ['I_{ext} = ', num2str(I_ext)];
nexttile
plot(t, y(:,1), 'DisplayName', txt)
ylim([-100,50])
title('BD-LNR')
legend('location', 'southoutside')

%%%%%%%%%%%%%%%%%%% HEALTHY CONTROL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

initparams
gkir = gkir * 0 ;

t_startinj = 0;
t_stopinj = 500;
t_run = 500;

I_ext = 56.75;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);

txt = ['I_{ext} = ', num2str(I_ext)];
nexttile
plot(t, y(:,1), 'DisplayName', txt)
ylim([-100,50])
legend('location', 'southoutside')

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

I_ext = 56.75;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);

txt = ['I_{ext} = ', num2str(I_ext)];
nexttile
plot(t, y(:,1), 'DisplayName', txt)
ylim([-100,50])
legend('location', 'southoutside')

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

I_ext = 56.75;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);

txt = ['I_{ext} = ', num2str(I_ext)];
nexttile
plot(t, y(:,1), 'DisplayName', txt)
ylim([-100,50])
legend('location', 'southoutside')

%%%%%%%%%%%%%%%%%%% HEALTHY CONTROL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

initparams
gkir = gkir * 0 ;

t_startinj = 0;
t_stopinj = 400;
t_run = 500;

I_ext = 119;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);

txt = ['I_{ext} = ', num2str(I_ext)];
nexttile
plot(t, y(:,1), 'DisplayName', txt)
ylim([-100,50])
legend('location', 'southoutside') 

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
t_stopinj = 400;
t_run = 500;

I_ext = 118;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);

txt = ['I_{ext} = ', num2str(I_ext)];
nexttile
plot(t, y(:,1), 'DisplayName', txt)
ylim([-100,50])
legend('location', 'southoutside')

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

I_ext = 118;
[g,e,elecparam, calciump] = setparams(gna, gfkdr, gskdr, gka, gtca, gnca, glca, gbk, gsk, ggaba, gkir, gleak, ena, ek, ecl, ekir, C, I_ext, tau, reCa, B, depth, F, t_startinj, t_stopinj);
declareglobal(g, e, elecparam, calciump);
tspan = [0; t_run];
y0 = [V_m; m_0; h_0; nf_0; ns_0; k_0; l_0; a_0; b_0; c_0; d_0; e_0; tcai_0; ncai_0; lcai_0; r_0; s_0; q_0; p_0];
[t,y] = ode15s(@granulecell, tspan, y0);

txt = ['I_{ext} = ', num2str(I_ext)];
nexttile
plot(t, y(:,1), 'DisplayName', txt)
ylim([-100,50])
legend('location', 'southoutside')

