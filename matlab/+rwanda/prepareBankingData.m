%% Read and preprocess banking data

close all
clear

load +rwanda/mat/prepareMacroData.mat startHist endHist


%% Load raw data from XLSX file

h = databank.fromSheet("+rwanda/banking-data.xlsx");

% Frequency conversion: Monthly to quarterly
h.QQ_NEW_L = convert(h.MM_NEW_L, Frequency.QUARTERLY, "method", "sum");
h.QQ_RL = convert(h.MM_RL, Frequency.QUARTERLY, "method", "mean");


%% Create model-consistent databank

b = struct();

rescale = 1e-6;

b.l = h.QQ_L * rescale;
b.tna = h.QQ_TNA * rescale;
b.a = h.QQ_A * rescale;
b.bk = h.QQ_BK * rescale;
b.l_fcy = h.QQ_L_FCY * rescale;
b.onfx = -h.QQ_ONFX * rescale;
b.new_l = h.QQ_NEW_L * rescale;
b.ln = h.QQ_LN * rescale;
b.rwa = h.QQ_RWA * rescale;
b.bg = h.QQ_BG * rescale;
b.woff = diff(h.QQ_WOFF) * rescale;
b.woff = clip(b.woff, qq(2012,1), Inf);

b.pnl_int_l = diff(h.QQ_PNL_INT_L, "tty") * rescale;
b.pnl_int_d = -diff(h.QQ_PNL_INT_D1 + h.QQ_PNL_INT_D2, "tty") * rescale;
b.pnl_prov = -diff(h.QQ_PNL_PROV, "tty") * rescale;
b.pnl = diff(h.QQ_PNL, "tty") * rescale;
b.pnl_at = diff(h.QQ_PNL_AT, "tty") * rescale;

b.rbk_at1 = h.QQ_RBK_AT / 4;
b.rl = h.QQ_RL / 400;
b.car = b.bg / b.rwa;

b.d = b.tna - b.bk;
b.le = b.l - b.a;
b.lp = b.l - b.ln;
b.car_min = Series(startHist:endHist, 0.15);
b.riskw = b.rwa / b.tna{-1};
b.bg_to_bk = b.bg / b.bk;
b.d_fcy_to_d = b.onfx / b.d;
b.a_to_l = b.a / b.l;
b.ln_to_l = b.ln / b.l;
b.lp_to_l = b.lp / b.l;
b.woff_to_l = b.woff / b.l;

b.ona = b.tna - b.le;
b.ona_to_tna = b.ona / b.tna;
b.onfx_to_bk = b.onfx / b.bk;
b.sigma = b.l_fcy / b.l;
b.d_fcy_to_d = (b.l_fcy + b.onfx) / b.d;

b.rbk_at2 = b.pnl_at / b.bk{-1};

b.rbk = x13.season(b.pnl / b.bk{-1}, "output", "tc");
b.rl_alt = x13.season(b.pnl_int_l / b.le{-1}, "output", "tc");

b.ap = b.a;
b.ap_to_l = b.ap / b.l;

b.rd_lcy = -b.pnl_int_d / b.d{-1};
b.rd_lcy = x13.season(b.rd_lcy, "output", "tc");


%% Create hypothetical HH segment

b = databank.copy( ...
    b ...
    , "sourceNames", ["l", "ln", "lp", "le", "rl", "sigma", "ap", "lp_to_l", "ln_to_l"] ...
    , "targetNames", @(n) n+"_hh" ...
    , "targetDb", b ...
);

% Equivalent to running
% b.l_hh = b.l;
% b.ln_hh = b.ln;
% etc.


%% Save databank to mat file

save +rwanda/mat/prepareBankingData.mat b

