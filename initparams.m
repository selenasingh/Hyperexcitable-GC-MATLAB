%%%% init params %%%%
t_run = 400; %msec
t_startinj = 0;
t_stopinj = 300;

%conductances 
gna = 120; % mS/cm^2 Santhakumar 
gfkdr = 16 ; % mS/cm^2 Santhakumar
gskdr = 6; % mS/cm^2 Santhakumar
gka = 12; % mS/cm^2 Santhakumar
gtca = 0.037; % mS/cm^2 Santhakumar
gnca = 2; % mS/cm^2 Santhakumar
glca = 5; % mS/cm^2 Santhakumar
gbk = 0.6; % mS/cm^2 Santhakumar
gsk = 1; % mS/cm^2 Santhakumar
ggaba = 0.00722; % mS/cm^2 Yim
gkir = 0.0144; % mS/cm^2 Yim
gleak = 0.0144; % mS/cm^2 Yim 


%reversal potentials
ena = 45; % mV Aradi and Holmes
ek = -85; % mV Aradi and Holmes
ecl = -70; % mV from Yim
ekir = -105; % mV from Yim 

%Calcium related things 
reCa = 7e-5; %resting intracellular calcium, mM (70nM), Aradi + Holmes
exCa = 2; %extracellular calcium, mM 
B = 5.2 * 10^-6;%/Ad ; mol/(C*m^3) [unused]
tau = 9; % msec, calcium removal rate

%electrical properties
I_ext = 0.8; %external current, nA
C = 0.01; % uF/cm^2 capacitance for Soma, Aradi + Holmes
depth = 200; %nm 
F = 96520; %faraday constant

%initial conditions for ODE
V_m = -70; % mV resting potential--Santhakumar, Aradi + Holmes 
m_0 = a_m(V_m)/(a_m(V_m)+b_m(V_m));
h_0 = a_h(V_m)/(a_h(V_m)+b_h(V_m));
nf_0 = a_nf(V_m);
ns_0 = a_ns(V_m);
k_0 = a_k(V_m)/(a_k(V_m)+b_k(V_m));
l_0 = a_l(V_m)/(a_l(V_m)+b_l(V_m));
a_0 = a_a(V_m)/(a_a(V_m)+b_a(V_m));
b_0 = a_b(V_m)/(a_b(V_m)+b_b(V_m));
c_0 = a_c(V_m)/(a_c(V_m)+b_c(V_m));
d_0 = a_d(V_m)/(a_d(V_m)+b_d(V_m));
e_0 = a_e(V_m)/(a_e(V_m)+b_e(V_m));
tcai_0 = reCa/3;
ncai_0 = reCa/3;
lcai_0 = reCa/3;
r_0 = 7.5/(7.5+b_r(V_m)); 
s_0 = s_inf(ncai_0,lcai_0, tcai_0); 
q_0 = a_q(ncai_0, lcai_0, tcai_0)/(a_q(ncai_0, lcai_0, tcai_0)+b_q(ncai_0, lcai_0, tcai_0)); 
p_0 = p_inf(V_m)/p_tau(V_m);
