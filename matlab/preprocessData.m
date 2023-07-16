
%% Preprocess macro and banking data for model

close all
clear

endHist = qq(2022,3);

%% Load raw data file

h = databank.fromSheet("data/input-data.csv");


%% Macro data transformations and filtering

% Foreign real short rate, backward looking inflation
h.rrw_bkw = (1 + h.rw) / roc(h.cpiw) - 1;

% Foreign output trend and gap
[h.yw_tnd, h.yw_gap] = hpf(h.yw, "log", true);


% Foreign real short rate trend and gap
h.rrw_tnd = hpf(h.rrw_bkw, "lambda", 3000, "change", Series(endHist, 0), "level", Series(endHist, 0.5/400));

figure();
plot(400*[h.rrw_bkw, h.rrw_tnd]); title("Foreign real short rate");


% GDP deflator
h.py = h.ny / h.y;

% CPI based real exchange rate
h.re = h.e * h.cpiw / h.cpi;

% Real short rate, backward looking inflation
h.rr_bkw = (1 + h.r) / roc(h.cpi) - 1;

% Real output trend and gap
[h.y_tnd, h.y_gap] = hpf(h.y, "log", true, "level", h.y{qq(2022,3)}/1.01);

figure();
plot(100*log([h.y, h.y_tnd])); title("Output");

figure();
plot(400*difflog(h.y_tnd)); title("Potential growth");


% Real short rate trend and gap
h.rr_tnd = hpf(h.rr_bkw, "lambda", 3000, "change", Series(endHist, 0), "level", Series(endHist, 2/400));

figure();
plot(400*[h.rr_bkw, h.rr_tnd]); title("Real short rate");


% Real exchange rate trend and gap
[h.re_tnd, h.re_gap] = hpf( ...
    h.re, "log", true ...
    , "change", Series(endHist, 1) ...
    , "level", h.re{endHist}/1.03 ...
);

figure();
plot(100*log([h.re, h.re_tnd])); title("Real exchange rate");

figure();
plot(400*difflog([h.re, h.re_tnd])); title("Real exchange rate depreciation");


%% Banking data transformations and filtering

% Effective risk weights
h.riskw = h.rwa / h.tna;

% Allowances
h.a = h.l - h.le;

% Other net assets
h.ona = h.tna - h.le;

% Performing loans
h.lp = h.l - h.ln;

% Gross loans to GDP ratio
h.l_to_4ny = h.l / (4 * h.ny);

% Gross loans to GDP ratio trend and gap
h.l_to_4ny_tnd = hpf( ...
    h.l_to_4ny ...
    , "lambda", 3000 ...
    , "change", Series(endHist+5*4, 0) ...
    , "level", Series(endHist+5*4, 0.55) ...
);

figure();
plot([h.l_to_4ny, h.l_to_4ny_tnd]); title("Loans to GDP ratio");


h.ln_to_l = h.ln / h.l;

h.ln_to_l_tnd = hpf( ...
    h.ln_to_l ...
    , "lambda", 3000 ...
    , "change", Series(endHist+5*4, 0) ...
    , "level", Series(endHist+5*4, 4.5/100) ... 
);

figure();
plot([h.ln_to_l, h.ln_to_l_tnd]); title("NPL to gross loans ratio");

h.a_to_ln = h.a / h.ln;

h.a_to_ln_tnd = hpf( ...
    h.a_to_ln ...
    , "lambda", 3000 ...
    , "change", Series(endHist+5*4, 0) ...
    ... , "level", Series(endHist+5*4, 4.5/100) ... 
);


%%

figure();
plot([h.a_to_ln, h.a_to_ln_tnd]); title("Provisions to NPL ratio");

h.aa = 0.45*h.ln + 0.04*h.lp;
figure();
plot([h.a, h.aa]);


h.bg_to_bk = h.bg / h.bk;
h.bg_to_bk_tnd = hpf( ...
    h.bg_to_bk ...
    , "lambda", 3000 ...
    , "change", Series(endHist, 0) ...
    , "level", Series(endHist, 0.9) ... 
);

figure();
plot([h.bg_to_bk, h.bg_to_bk_tnd]); title("T1+T2 to balance sheet capital");


figure();
plot(400*(h.new_rl - h.r)); title("Lending spread");

% Policy rate 9% in 2024, 5% in the long run


%% Rates of change

names = ["y", "y_tnd", "ny", "l", "cpi", "py", "re", "re_tnd", "cpiw"];

h = databank.apply(h, @roc, "sourceNames", names, "targetNames", "roc_"+names);
h = databank.apply(h, @apct, "sourceNames", names, "targetNames", "apct_"+names);

load mat/createMacro.mat n

startScen = endHist + 1;
endScen = endHist + 5*4;

h.x = Series(endHist, 0);
h.prem_gap = Series(endHist, 0);
h.fwy_bubble = Series(endHist, 1);

checkInitials(n, h, startScen:endScen);

databank.toSheet(h, "data/model-data.csv");


