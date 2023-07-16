
close all
clear

load mat/createModel.mat m

shocks = access(m, "transition-shocks");
macro = byAttributes(m, [":macro", ":world"]);

m = assign(m, "std_"+setdiff(shocks, macro), 0);
m = assign(m, "std_"+shocks(startsWith(shocks, "tune")), 0);

m = rescaleStd(m, 0);

m.std_shock_rrw_tnd = 0.001;

m.std_shock_yw_gap = 0.01;
m.std_shock_roc_cpiw = 0.02;
m.std_shock_rw = 0.001;

m.std_shock_roc_y_tnd = 0.001;
m.std_shock_y_tnd = 0.001;
m.std_shock_roc_re_tnd = 0.001;
m.std_shock_rr_tnd = 0.001;

m.std_shock_fwy_bubble = 0;
m.std_shock_y_gap = 0.01;
m.std_shock_roc_py = 0.01;
m.std_shock_roc_cpi = 0.005;
m.std_shock_r = 0.005;
m.std_shock_e = 0.01;
m.std_shock_prem_gap = 0.001;


%{
m.std_shock_ivy_tnd_hh = 0.001;
m.std_shock_l_to_4ny_tnd_hh = 0.001;
m.std_shock_rl_hh = 0;
m.std_shock_apm = 0.01;
m.std_shock_new_rl_hh = 0;
m.std_shock_new_rl_full_hh = 0;
m.std_shock_new_rl_full1_hh = 0;
m.std_shock_new_rl_full2_hh = 0;
m.std_shock_apm_hh = 0;

m.std_shock_rbk = 0;
m.std_shock_riskw = 0;
m.std_shock_onfx = 0.001;
m.std_shock_car_min = 0;
m.std_shock_ona = 0.001;
m.std_shock_bg_to_bk = 0;
m.std_shock_new_l = 0.01;
m.std_shock_ivy_hh = 0.01;
m.std_shock_new_l_hh = 0.01;
m.std_shock_q = 0;
m.std_shock_q_hh = 0.01;
m.std_shock_rona = 0.01;
m.std_shock_rona_spread = 0.01;
m.std_shock_rd_lcy = 0;
m.std_shock_new_rd_lcy = 0;
m.std_shock_rd_fcy = 0;
m.std_shock_new_rd_fcy = 0;
m.std_shock_sigma_hh = 0;
m.std_shock_woff_hh = 0.01;
m.std_shock_ap_fe_hh = 0;
%}

startHist = qq(2015,1);
endHist = qq(2022,3);
startProj = endHist + 1;
endNear = endHist + 3;
endProj = endHist + 16;

% d = databank.forModel(m, startHist:endNear, shockFunc=@randn);
d = databank.forModel(m, startHist:endNear);

rho = 0.5;
f = Armani([1, -rho], 1);
for n = access(m, "transition-shocks")
    std = m.("std_"+n);
    if std==0
        continue
    end
    std1 = std * (1 - rho^2) * 0.5;
    u = Series(startHist:endNear, @randn)*std1;
    d.(n) = reconstruct(f, u);
end



h = simulate( ...
    m, d, startHist:endProj ...
    , prependInput=true ...
    , method="stacked" ...
    , solver="quickNewton" ...
    , anticipate=false ...
);

s0 = simulate( ...
    m, databank.clip(h, -Inf, endHist), startProj:endProj ...
    , prependInput=true ...
    , method="stacked" ...
    , solver="quickNewton" ...
    , anticipate=false ...
);
s0 = databank.clip(s0, endHist, Inf);

ch = Chartpack();
ch.Range = startHist:endProj;
ch.Round = 8;
ch.Transform = @(x) 100*(x-1);
ch.Highlight = endHist+1:endNear;

ch + ["y_gap", "roc_y^4", "roc_cpi^4", "^400*r", "roc_e"];

draw(ch, databank.merge("horzcat", h, s0));

