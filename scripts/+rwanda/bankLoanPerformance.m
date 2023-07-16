% Calibrate loan portfolio and performance

function x = bankLoanPerformance(x)

    % Write-off process
    x.omega_hh = 0.15;
    
    % Paydown factor
    x.theta_lp_hh = 0.22;
    
    % Recovery factor
    x.theta_ln_hh = 0.22;
    
    % A/R Exchange rate exposure
    x.c0_sigma_hh = 0.9;
    
    % Exchange rate exposure switch for new loans
    x.new_sigma_hh = 0;
    
    % S/s Exchange rate exposure switch
    x.ss_sigma_hh = 0;

end%

