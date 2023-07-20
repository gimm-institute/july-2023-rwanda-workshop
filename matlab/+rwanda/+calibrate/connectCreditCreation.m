
function x = connectCreditCreation(x)

    % Transactions parameters
    x.c1_trn_hh = 0.12;

    % Inverse velocity of credit parameters
    x.c1_ivy_hh = 0.05;

    x.c2_ivy_hh = 0;

    x.c0_ivy_tnd_hh = 0.9;


    % Gross loans to GDP ratio
    x.ss_l_to_4ny_hh = 0.22;


    % Autoregression in loans to GDP trend ratio
    x.c0_l_to_4ny_tnd_hh = 0.98;


    %=================================================


    x.c0_l_to_4ny_tnd_hh = 0.5;
    x.c1_l_to_4ny_tnd_hh = 0;

    x.c0_ivy_tnd_hh = 0.7;


%{
%% Credit risk


    % S/S Prortfolio default rate
    x.ss_q_hh = 6/400;


    % Households
    x.c2_q_hh = 0.015;
    x.c3_q_hh = 0.3;
    x.c4_q_hh = -0.5/100;
    x.c5_q_hh = 2.5/100;


    % Non-financial corporations


    % Composition of macro conditions index
    x.c1_z_hh = 0.90;


    % Reverse engineering -> c2_q_2
    x.ss_slope_q_hh = 0.20;

    %=================================================

    x.c1_z_hh = 0.70;

    x.ss_q_hh = 5/400;

    % x.ss_q_hh = 1.10/100;
    % x.c2_q_hh = 0.01;
    % x.c4_q_hh = 1/100 - x.ss_q_hh;
    % x.c5_q_hh = 4/100 - x.ss_q_hh;
    x.c4_q_hh = 1/100-x.ss_q_hh;
    x.c5_q_hh = 3.5/100;
%}

end%
