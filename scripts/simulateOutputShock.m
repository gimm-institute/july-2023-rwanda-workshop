
%{

* Create two versions of the model:
  (i) the baseline model
  (ii) a model with no feedback: set c3_y_gap=0 and c1_prem=0

* With both models, run a simulation on the range 1:40 starting
  from steady state, adding

  d0.shock_y_gap(1:4) = -0.02;

* Plot 100*(y_gap-1)

y = y_tnd * y_gap

y_gap = 1 means y = y_tnd
y_gap = 0.95 means -5%
y_gap = 1.04 means +4%

%}

close all
clear
load mat/createModel.mat m

m1 = m;
m1.c3_y_gap = 0;
m1.c1_prem = 0;

m1 = steady(m1);
checkSteady(m1);
m1 = solve(m1);

d0 = databank.forModel(m, 1:40);
d0.shock_y_gap(1:4) = -0.02;

s = simulate( ...
    m, d0, 1:40 ...
    , prependInput=true ...
    , method="stacked" ...
);

s1 = simulate( ...
    m1, d0, 1:40 ...
    , prependInput=true ...
    , method="stacked" ...
);


n1 = simulate( ...
    m1, d0, 1:40 ...
    , prependInput=true ...
    , method="stacked" ...
    , anticipate=false ...
);


plot(100*([s.y_gap, s1.y_gap]-1));



smc = databank.minusControl(m, databank.merge("horzcat", s1, n1));

ch = defineChartpack();
ch.FigureTitle = "Output shock: " + ch.FigureTitle;
ch.Range = 0:40;
ch.FigureExtras = { @(h) visual.hlegend("bottom", "Feedback", "No feedback") };
draw(ch, smc);
