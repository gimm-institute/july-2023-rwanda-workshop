
close all
clear

load +rwanda/mat/createModel.mat m
load +rwanda/mat/prepareAllData.mat d startHist endHist

startReport = qq(getYear(startHist), 1);
endReport = qq(getYear(endHist), 4);
fileName = "+rwanda/html/steady-calibration";


ms = access(m, "steady-level");

d.rl = [d.rl, d.rl_alt];

r = rephrase.Report( ...
    "Rwanda steady state calibration report" ...
    , "logo", false ...
    , "tableOfContents", false ...
);


addChart = @(caption, name) ...
    rephrase.SeriesChart.fromSeries( ...
        {caption, startReport, endReport, "dateFormat", "Y:Q"} ...
        , {"Model S/S", Series(startReport:endReport, local_eval(ms, name)), "lineWidth", 0} ...
        , {"Data", local_eval(d, name)} ...
    );

p = rephrase.Pager("");
r + p;

g = rephrase.Grid("Macro", Inf, 2, "displayTitle", true);
p + g;



g + addChart("Real GDP growth", "100*(roc_y^4-1)");
g + addChart("Output gap", "100*(y_gap - 1)");
g + addChart("CPI inflation", "100*(roc_cpi^4-1)");
g + addChart("Short term rate", "400*r");
g + addChart("Real exchange rate apprec/deprec", "100*(roc_re^4-1)");
g + addChart("Real exchange rate gap", "100*(re_gap - 1)");
g + addChart("Foreign output gap", "100*(yw_gap - 1)");
g + addChart("Foreign CPI inflation", "100*(roc_cpiw^4-1)");
g + addChart("Foreign short term rate", "400*rw");

g = rephrase.Grid("Bank credit", Inf, 2, "displayTitle", true);
p + g;

g + addChart("Bank loans to GDP, annualized", "l_to_4ny");
g + addChart("New bank loans to GDP", "new_l_to_ny");



g = rephrase.Grid("Bank loan performance", Inf, 2, "displayTitle", true);
p + g;

g + addChart("Nonperforming loans to gross loans", "ln_to_l");
g + addChart("Allowances to gross loans", "a_to_l");



g = rephrase.Grid("Bank interest rates", Inf, 2, "displayTitle", true);
p + g;

g + addChart("Lending rate", "400*rl");
g + addChart("Funding liability rate", "400*rd_lcy");



g = rephrase.Grid("Bank profitability and capital", Inf, 2, "displayTitle", true);
p + g;

g + addChart("Before-tax return on capital", "400*rbk");
g + addChart("Capital adequacy ratio", "100*car");
g + addChart("Regulatory to balance sheet capital", "100*bg_to_bk");
g + addChart("Effective risk weight", "100*riskw");



build( ...
    r, fileName ...
    , "source", "web" ...
);


function out = local_eval(db, expression)
    if isfield(db, expression)
        out = db.(expression);
    else
        out = databank.eval(db, expression);
    end
end%

