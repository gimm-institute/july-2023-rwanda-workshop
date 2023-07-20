
close all
clear

% rwanda.prepareMacroData
rwanda.prepareBankingData

load +rwanda/mat/prepareMacroData.mat a startHist endHist
load +rwanda/mat/prepareBankingData.mat b
load +rwanda/mat/createModel.mat m

d = databank.merge("error", a, b);

d.l_to_4ny = d.l / (4*d.ny);
d.new_l_to_ny = d.new_l / d.ny;

% Create hypothetical HH segment
d = databank.copy( ...
    d ...
    , "sourceNames", ["l_to_4ny", "new_l_to_ny"] ...
    , "targetNames", @(n) n+"_hh" ...
    , "targetDb", d ...
);


save +rwanda/mat/prepareAllData.mat d startHist endHist

startScenario = endHist + 1;
checkInitials(m, d, startScenario);

