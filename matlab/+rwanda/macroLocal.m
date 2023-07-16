
function x = macroLocal(x)

    % Directly calibrated steady state values

    x.ss_roc_y = (1 + 3/100)^(1/4); 
    x.ss_roc_cpi = (1 + 3/100)^(1/4);
    x.ss_roc_re = (1 - 0/100)^(1/4);
    x.ss_rr = 2/400;


    % Dynamic parameters

    % Aggregate demand
    x.c0_y_gap = 0.75; % Autoregression
    x.c1_y_gap = 0.10; % Future income
    x.c2_y_gap = 0.05; % Real short-term rate
    x.c3_y_gap = 0.15; % Lending conditions
    x.c4_y_gap = 0.02; % Real exchange rate
    x.c5_y_gap = 0.30; % Foreign demand

    % Potential output
    x.c0_roc_y_tnd = 0.95; % Autoregression
    x.c1_roc_y_tnd = 0.001; % Hysteresis from output gap

    % Phillips curve
    x.c0_roc_cpi = 0.6 % Lag
    x.c1_roc_cpi = 0.10; % Output gap
    x.c2_roc_cpi = 0.04; % Real exchange rate gap
    x.c3_roc_cpi = 0; % Real exchange rate gap change

    % Inflation expectations
    x.c1_roc_cpi_exp = 1;

    % Monetary policy reaction function
    x.c0_r = 0.8;
    x.c1_r = 2.5;
    x.c2_r = 0.2;
    x.c3_r = 0.1;

    x.r_floor = 0;
    x.floor_slope = 0.1;

    % Real short-term cash rate trend, LCY
    x.c0_rr_tnd = 0.95;

    % Weight on model-consistent exchange rate expectations
    x.c1_e_exp = 0.9; % Weight on model-consistent expectations

    % Interest premium gap
    x.c0_prem_gap = 0.6; 0.85; % Autoregression

    % Exchange rate markets
    x.c1_prem = 0; 0.5; % Response in interest premium to lending conditions

    % Real exchange rate trend
    x.c0_roc_re_tnd = 0.95; % Autoregression
    x.c1_roc_re_tnd = 0.001; % Error correction response to real exchange rate gap

    x.c0_x = 0.8;

    %=================================================

    x.c0_y_gap = 0.7; % Autoregression
    x.c1_y_gap = 0.10; % Future income
    x.c2_y_gap = 0.05; % Real short-term rate
    x.c3_y_gap = 0.15; % Lending conditions
    x.c4_y_gap = 0.02; % Real exchange rate
    x.c5_y_gap = 0.30; % Foreign demand

    x.c1_prem = 0.1;

end%

