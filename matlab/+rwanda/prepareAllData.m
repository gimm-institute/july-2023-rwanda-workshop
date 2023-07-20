
close all
clear

rwanda.prepareMacroData
rwanda.prepareBankingData

load +rwanda/mat/prepareMacroData.mat a startHist endHist
load +rwanda/mat/prepareBankingData.mat b
load +rwanda/mat/createModel.mat m

d = databank.merge("error", a, b);

d.l_to_4ny = d.l / (4*d.ny);
d.new_l_to_ny = d.new_l / d.ny;

[d.l_to_4ny_tnd, d.l_to_4ny_gap] = hpf( ...
    d.l_to_4ny{qq(2010,1):qq(2019,4)} ...
    , "lambda", 5000 ...
    , "range", qq(2010,1):qq(2028,4) ...
    , "change", Series(qq(2028,4), 0) ...
    , "level", Series(qq(2028,4), 0.30) ...
);

d.ap_min = ...
    + d.lp*m.pd_lp_hh*m.lgd_lp_hh ...
    + d.ln*m.pd_ln_hh*m.lgd_ln_hh ...
;

d.ap_min_to_l = d.ap_min / d.l;


% Create hypothetical HH segment

d = databank.copy( ...
    d ...
    , "sourceNames", ["l_to_4ny", "new_l_to_ny"] ...
    , "targetNames", @(n) n+"_hh" ...
    , "targetDb", d ...
);


save +rwanda/mat/prepareAllData.mat d startHist endHist

% startScenario = endHist + 1;
% checkInitials(m, d, startScenario);

