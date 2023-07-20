
close all
clear

startHist = qq(2010,1);
endHist = qq(2022,3);
startScenario = endHist + 1;

h = databank.fromSheet("+rwanda/macro-data.xlsx");

h.QQ_Y = x13.season(h.QQ_Y_SU);
h.QQ_NY = x13.season(h.QQ_NY_SU);
h.QQ_PY = h.QQ_NY / h.QQ_Y;
h.MM_CPI = x13.season(h.MM_CPI_SU);
h.QQ_CPI = convert(h.MM_CPI, Frequency.QUARTERLY);
h.QQ_R = convert(h.MM_R, Frequency.QUARTERLY);

h.QQ_CPIW = convert(h.MM_CPIW, Frequency.QUARTERLY);
h.QQ_RW = convert(h.MM_RW, Frequency.QUARTERLY);

h.QQ_E = convert(h.DD_E, Frequency.QUARTERLY, "removeMissing", true);


a = struct();

a.y = h.QQ_Y;
a.ny = h.QQ_NY;
a.py = a.ny / a.y;
a.cpi = h.QQ_CPI;
a.r = h.QQ_R / 400;
a.e = h.QQ_E;

a.yw = h.QQ_YW;
a.rw = h.QQ_RW / 400;
a.cpiw = h.QQ_CPIW;

a.re = a.e * a.cpiw / a.cpi;
a.rr = (1 + a.r) / roc(a.cpi{+1}) - 1;
a.rrw = (1 + a.rw) / roc(a.cpiw{+1}) - 1;

[a.y_tnd, a.y_gap] = hpf(a.y, "log", true, "lambda", 5000);
[a.yw_tnd, a.yw_gap] = hpf(a.yw, "log", true, "lambda", 5000);

[a.re_tnd, a.re_gap] = hpf( ...
    a.re ...
    , "log", true ...
    , "lambda", 5000 ...
    , "change",  Series(getEnd(a.re), 1.01^(1/4)) ...
);

[a.rr_tnd, a.rr_gap] = hpf( ...
    a.rr ...
    , "lambda", 5000 ...
    , "change", Series(getEnd(a.rr), 0) ...
    , "level", Series(getEnd(a.rr), 2/400) ...
);

[a.rrw_tnd, a.rrw_gap] = hpf( ...
    a.rrw ...
    , "lambda", 5000 ...
    , "change", Series(getEnd(a.rrw), 0) ...
    , "level", Series(getEnd(a.rrw), 0.5/400) ...
);

a.roc_y = roc(a.y);
a.roc_ny = roc(a.ny);
a.roc_y_tnd = roc(a.y_tnd);
a.roc_py = roc(a.py);
a.roc_cpi = roc(a.cpi);

a.roc_cpiw = roc(a.cpiw);
a.roc_e = roc(a.e);
a.roc_re = roc(a.re);
a.roc_re_tnd = roc(a.re_tnd);

a.fwy_bubble = Series(endHist, 1);
a.prem_gap = Series(endHist, 0);
a.x = Series(endHist, 0);

load +rwanda/mat/createMacroModel.mat n
checkInitials(n, a, startScenario);

save +rwanda/mat/prepareMacroData.mat a startHist endHist

