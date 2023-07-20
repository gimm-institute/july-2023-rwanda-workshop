
close all
clear

load mat/createModel.mat m


range = 1 : 40;

%% Unexpected at the beginning of the simulation

d = steadydb(m, range);

d.shock_q_hh(1) = 0.05;

s = simulate( ...
    m, d, range ...
    , "prependInput", true ...
    , "method", "stacked" ...
);


%% Placed in period 5

d = steadydb(m, range);

d.shock_q_hh(5) = 0.05;

s1 = simulate( ...
    m, d, range ...
    , "prependInput", true ...
    , "method", "stacked" ...
    , "anticipate", true ...
);

s2 = simulate( ...
    m, d, range ...
    , "prependInput", true ...
    , "method", "stacked" ...
    , "anticipate", false ...
);


%%

ch = Chartpack();
ch.Range = 0:20;

ch + ["q_hh", "l_hh", "lp_hh", "ln_hh", "lnc_hh", "lnw_hh", "new_ln_hh", "new_l_hh"];
%ch + ["100*car", "400*new_rl_hh", "400*rl_hh", "100*(y_gap-1)"];
%ch + ["400*(roc_cpi-1)"];
ch + ["af_hh", "ap_hh", "100*af_to_l_hh", "100*ap_to_l_hh"];

draw(ch, databank.merge("horzcat", s1, s2));

legend("Expected", "Unexpected");





