

%close all
clear

load mat/createRwanda.mat m

m.c2_rx = 0.013;
m.c3_rx = 0;
m.c1_rx = m.c1_rx + 0.3/400;
m.c4_rx = m.c4_rx + 0/400;
m.c5_rx = m.c5_rx + 0.3/400;
m = steady(m);

figure();
drawCapitalAdequacyRiskFunc(gca(), m);

x = access(m, "steady-level");

hold on;
xline(gca(), 100*x.car, "-", "", "lineWidth", 6, "color", 0.6*[1,1,1]);

print -dpng ../docs/capital-adequacy-stress-func.png

