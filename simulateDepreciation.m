%% Exchange rate depreciation

close all
clear

load mat/createModel.mat m

m20 = m;
m20.sigma_hh = 0.20;
m20 = steady(m20);
m20 = solve(m20);



d = steadydb(m, 1:40);
d.shock_e(1) = 0.15;

s = simulate( ...
    m, d, 1:40 ...
    , "prependInput", true ...
    , "method", "stacked" ...
);

d20 = steadydb(m20, 1:40);
d20.shock_e(1) = 0.15;

s20 = simulate( ...
    m20, d20, 1:40 ...
    , "prependInput", true ...
    , "method", "stacked" ...
);


%%

ch = Chartpack();
ch.Range = 0:20;

ch + [ 
    "Nominal exchange rate: e", ...
    "Output gap: 100*(y_gap-1)", ...
    "Gross loans: l", ...
    "Performing loans: lp", ...
    "Nonperforming loans: ln" ...
    "CAR: 100*car" ...
];

draw(ch, databank.merge("horzcat", d, s, s20));


