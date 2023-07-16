
close all
clear

load mat/createMacro.mat n

n.c1_r = 0.7;
n.c1_r = 2.2;
n.c2_r = 0;
n.c0_prem_gap = 0.8;
n.c3_roc_cpi = 0.01;
n.c0_roc_cpi = 0.55;

n = solve(n);

endHist = qq(2022,3);
startScen = endHist + 1;
endScen = endHist + 5*4;

h = databank.fromSheet("data/model-data.csv");



p = Plan.forModel(n, startScen:endScen);

p = swap(p, startScen:qq(2024,4), ["rw", "tune_rw"]);
h.rw(qq(2023,1):qq(2024,4)) = [4.5;4.75;4.75;4.75;4.75;4.75;4.75;4.3]/400;

p = swap(p, startScen, ["e", "tune_prem_gap"]);
h.e(qq(2023,1)) = 4700;

b = simulate( ...
    n, h, startScen:endScen ...
    , "prependInput", true ...
    , "method", "stacked" ...
    , "plan", p ...
);


ch = Chartpack();
ch.Range = startScen-4*4 : endScen;
ch.Highlight = startScen : endScen;
ch.Transform = @(x) 100*(x-1);

ch + ["Output gap: y_gap", "Potential growth, PA: roc_y_tnd^4", "CPI inflation, PA: roc_cpi^4", "Real exchange rate gap: re_gap"];
ch + ["Policy rate: ^ 400*r", "USD exchange rate: ^ 1000*e", "Foreign short rate: ^ 400*rw"];

draw(ch, b);

databank.toSheet(b, "data/macro-baseline.csv");


