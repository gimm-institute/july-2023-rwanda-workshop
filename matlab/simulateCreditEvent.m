
close all
clear

load mat/createModel.mat m


range = 1 : 40;

d = steadydb(m, range);

d.shock_q_hh(1) = 0.05;

s = simulate( ...
    m, d, range ...
    , "prependInput", true ...
    , "method", "stacked" ...
);

ch = Chartpack();
ch.Range = 0:20;

ch + ["l_hh", "lp_hh", "ln_hh", "lnc_hh", "lnw_hh", "new_ln_hh", "new_l_hh"];

draw(ch, databank.merge("horzcat", d, s));

legend("Steady state", "Credit risk shock");





