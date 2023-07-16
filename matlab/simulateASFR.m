%% Asymptotic single-factor risk model

close all;

rho = 0.3;
pd = 0.15;

N = 10000;
K = 15000;

rng(0);

y_cutoff = norminv(0.15);

loan_value = 1;


% Period 0 (origination)
assets0 = N * loan_value;
capital0 = (pd + 0.20) * assets0;
debt0 = assets0 - capital0;


a = randn(1, K);
i = randn(N, K);

y = sqrt(rho)*a + sqrt(1-rho)*i;

def = y < y_cutoff;

loss = sum(def, 1) * loan_value;

% Period 1 (repayment)
assets = assets0 - loss;
debt = debt0;
capital = assets - debt;

pdr = loss / assets0;

figure();
histogram(pdr, "binEdges", 0:0.025:1);

figure();
histogram(capital);
xline(0, "lineWidth", 3);




