

close all
clear

load mat/createRwanda.mat m

endHist = qq(2022,3);
startScen = endHist + 1;
endScen = endHist + 5*4;

h = databank.fromSheet("data/model-data.csv");
b = databank.fromSheet("data/macro-baseline.csv");

ss = access(m, "steady-level");

h.ivy_tnd_hh = Series(endHist, ss.ivy_tnd_hh);
h.l_to_4ny_tnd_hh = h.l_to_4ny_tnd;
h.rona = h.r;
h.rl_hh = h.new_rl; %Series(endHist, 20/400);
h.rl_apm_hh = Series(endHist, ss.rl_apm_hh);
h.rd_lcy = h.r;
h.rd_fcy = h.rw;
h.l_hh = h.l;
h.lp_hh = h.lp;
h.lnc_hh = h.ln * (ss.lnc_hh/ss.ln_hh);
h.lnw_hh = h.ln - h.lnc_hh;
h.sigma_hh = Series(endHist, ss.sigma_hh);
h.ap_hh = h.a;
h.d = h.tna - h.bk;
h.d_fcy_to_d = Series(endHist, 0);
h.ap = h.a;
h.ap_to_ln = h.ap / h.ln;
h.q_hh = Series(endHist-10:endHist, ss.q_hh);
h.new_rl_hh = h.new_rl;



h.tune_rw = b.tune_rw;
h.tune_prem_gap = b.tune_prem_gap;



checkInitials(m, h, startScen);

s0 = simulate( ...
    m, h, startScen:endScen ...
    , "prependInput", true ...
    , "method", "stacked" ...
);



h1 = h;
h1.shock_y_gap = Series();
h1.shock_q_hh = Series();
h1.shock_y_gap(startScen+(0:1)) = -0.10;
h1.shock_q_hh(startScen+(0:1)) = 0.02;

s1 = simulate( ...
    m, h1, startScen:endScen ...
    , "prependInput", true ...
    , "method", "stacked" ...
);





%% Report results

ch = Chartpack();
ch.Range = startScen-4*4 : endScen;
ch.Highlight = startScen : endScen;
ch.Transform = @(x) 100*(x-1);

ch + ["Output gap: y_gap", "Potential growth, PA: roc_y_tnd^4", "CPI inflation, PA: roc_cpi^4", "Real exchange rate gap: re_gap"];
ch + ["Policy rate: ^ 400*r", "USD exchange rate: ^ 1000*e", "Foreign short rate: ^ 400*rw"];
ch + ["Credit to GDP: ^ l_to_4ny", "Return on bank capital: ^ 400*rbk"];
ch + ["Allowances: ^ ap ", "Allowances to gross loans: ^ 100*ap_to_l"];
ch + ["Performing loans: ^ lp", "Nonperforming loans to gross loans: ^ 100*ln/l"];
ch + ["CAR: ^ 100*car", "Portfolio default rates: ^ 100*q_hh"];
ch + ["Lending rates: ^ 400*new_rl_hh"];

draw(ch, databank.merge("horzcat", s0, s1));
visual.hlegend("bottom", "Baseline", "Stress");

%% Components of return on bank capital

figure();
tiledlayout("flow");

names = access(m, "transition-variables");
for n = ["rbk", names(startsWith(names, "rbk_"))]
    nexttile();
    plot(startScen-4*4:endScen, [round([s0.(n),s1.(n)], 8), ss.(n)], "marker", "s");
    title(n, "interpreter", "none");
    xline(endHist);
end
visual.hlegend("bottom", "Baseline", "Stress", "Steady state");
visual.heading("Components of return on bank capital")

