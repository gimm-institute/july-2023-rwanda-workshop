
close all
clear

load +rwanda/mat/createMacroModel.mat n
load +rwanda/mat/prepareMacroData.mat a endHist
load +rwanda/rw_fcast.mat mean

startScenario = endHist + 1;
endScenario = endHist + 20;

a.shock_roc_cpi = Series();
a.shock_roc_cpi(startScenario) = -0.01;

s = simulate( ...
    n, a, startScenario:endScenario ...
    , "prependInput", true ...
    , "method", "stacked" ...
    , "solver", "quickNewton" ...
);


tiledlayout("flow", "tileSpacing", "tight");

nexttile();
plot([400*difflog(s.cpi), mean.dl_cpi]);

nexttile();
plot([400*s.r, mean.ip]);

nexttile();
plot([100*log(s.y_gap), mean.l_y_gap]);

nexttile();
plot([100*log(s.e), mean.l_rwf_usd]);

