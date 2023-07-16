
close all
clear


rho = 0.3;
pd = 0.15;
cutoff = norminv(0.15);

N = 10000;
K = 10000;
pdr = [];


aggreg = randn(1, K);
idiosync = randn(N, K);

indiv = sqrt(rho)*aggreg + sqrt(1-rho)*idiosync;
def = indiv < cutoff;
loss = 1*sum(def, 1);

assets0 = 1*N;
exp_loss = pd * assets0;
capital0 = exp_loss;
fund0 = assets0 - capital0;

fund = fund0;
assets = assets0 - loss;
capital = assets - fund;
pdr = loss / assets0;

figure();
histogram(pdr, binEdges=0:0.025:1);

figure();
histogram(capital);

assets0 = 1*N;
exp_loss = pd * assets0;
capital0 = exp_loss + 0.10*assets0;
fund0 = assets0 - capital0;

fund = fund0;
assets = assets0 - loss;
capital = assets - fund;
pdr = loss / assets0;

hold on;
histogram(capital);

