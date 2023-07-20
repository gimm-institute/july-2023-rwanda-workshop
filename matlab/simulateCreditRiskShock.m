%{

* Look up the name of a portfolio default rate shock

* Create a model with no macro feedback
  Switch off parameters on new_rl_full_spread_gap
  in macroLocal.model

* Simulate a future PDR shock (t+4) 0.01 twice:
  anticipated vs unanticipated

* Plot new_rl, rl

%}

close all
clear

load mat/createModel.mat m

m1 = m;
m1.c3_y_gap = 0;
m1.c1_prem = 0;
m1.c1_fwy = 0;
% m1.psi_rl_hh = 1;
% m1.c1_new_rl_hh = 1;
checkSteady(m1);
m1 = solve(m1);

d = databank.forModel(m1, 1:40);
d.shock_q_hh(5) = 0.02;

sa = simulate( ...
    m1, d, 1:40 ...
    , "prependInput", true ...
    , "method", "stacked" ...
    , "anticipate", true ...
);

su = simulate( ...
    m1, d, 1:40 ...
    , "prependInput", true ...
    , "method", "stacked" ...
    , "anticipate", false ...
);


%% 

tiledlayout("flow", "tileSpacing", "loose");

nexttile();
plot(0:40, 100*[sa.q_hh, su.q_hh]);
title("Portfolio default rates");

nexttile();
plot(0:40, 400*[sa.new_rl_hh, su.new_rl_hh]);
title("New lending rates");

nexttile();
plot(0:40, 400*[sa.rl_hh, su.rl_hh]);
title("Stock lending rates");

nexttile();
plot(0:40, 400*[sa.af, su.af]);
title("Forward looking provisions");

nexttile();
plot(0:40, 400*[sa.ap, su.ap]);
title("Backward looking provisions");
