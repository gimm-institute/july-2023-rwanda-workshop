%% Simulate boom with debt to income caps


%% Clear the workspace

close all
clear
load mat/createModel.mat m


%% Prepare the model

m.c1_y_gap = 0.02;
m.c3_y_gap = 0.16;
m.c1_roc_y_tnd = 0.001;
m.c1_fwy = 0.01;
m.c1_bk = 0.5;

m.c2_q_hh = 0.019;
m.c5_q_hh = 4/100;

m.c1_z_hh = 0.50;
m.c2_q_hh = 0.019;

m.c1_new_rl_cap_hh = 50;
m.c2_ivy_hh = 2;

m = steady(m);
checkSteady(m);
m = solve(m);
d = steadydb(m, -10:40);


%% Boom (asset prices, credit demand) with no DTI caps

T = 12;
d1 = d;
d1.shock_fwy_bubble(1:T) = log(1.03);
d1.shock_ivy_tnd_hh(1:T) = log(1.03);

s1 = simulate( ...
    m, d1, 1:40 ...
    , prependInput=true ...
    , method="stacked" ...
);


%% Boom with DTI-like caps

d2 = d1;
d2.cap_hh(:) = 0.65;
d2.shock_cap_hh(:) = d2.cap_hh - m.ss_cap_hh;

m.c1_new_rl_full_hh = 0.3;

s2 = simulate( ...
    m, d2, 1:40 ...
    , prependInput=true ...
    , method="stacked" ...
);


%% Merge databanks

s = databank.merge("horzcat", s1, s2);
smc = databank.minusControl(m, s, d);


%% Chartpack

ch = defineChartpack();
ch.Range = 0:40;
ch.Highlight = 0:T;
ch.FigureTitle = "Asset price boom-bust with DTI caps: " + ch.FigureTitle;
ch.FigureExtras = { @(h) visual.hlegend("bottom", "Boom-bust with no DTI caps", "Boom-bust with DTI caps") };

draw(ch, smc);

