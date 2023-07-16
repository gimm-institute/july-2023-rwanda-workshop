
function x = macroAssets(x)

    % Directly calibrated steady state values

    x.ss_disc_fwy = 0.05;


    % Dynamic parameters

    % Forward output
    x.c1_fwy = 0; 0.5; % Response in discount factor to lending conditions

    % Asset price bubble
    x.c0_fwy_bubble = 0.9;

end%

