
function x = bankProvisioning(x)

    x.switch_a = 1;

    %
    % Forward looking provisions
    %

    x.c1_af_hh = 1;
    x.af_to_l_hh = 0.2;



    %
    % Backward looking provisions
    %

    % PD for performing loans
    x.pd_lp_hh = 0.01; 
    % x.pd_lp_nfc = 0.05; 

    % Downturn PD for non-performing loans
    x.pd_ln_hh = 0.65;
    % x.pd_ln_nfc = 1; 

    % Downturn LGD for performing loans
    x.lgd_lp_hh = 0.40; 
    % x.lgd_lp_nfc = 0.45;

    % Downturn LGD for non-performing loans
    x.lgd_ln_hh = 0.40; 
    % x.lgd_ln_nfc = 0.45;

    x.lambda_hh =  x.lgd_ln_hh;
    %x.lambda_nfc = x.lgd_ln_nfc;

    % Fixed effect
    %x.c0_ap_fe_hh = 0.94;
    %x.c0_ap_fe_nfc = 0.94;

end%

