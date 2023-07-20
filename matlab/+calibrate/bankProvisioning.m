
function x = bankProvisioning(x)

    x.switch_a = 0;

    %
    % Forward looking provisions
    %

    x.c1_af_hh = 1;
    x.c1_af_nfc = 1;

    x.af_to_l_hh = 0.2;
    x.af_to_l_nfc = 0.35;



    %
    % Backward looking provisions
    %

    % ap_ln = 0.45 * ln
    % ap_lp = 0.04 * lp


    % PD for performing loans
    x.pd_lp_hh = 0.06; 
    x.pd_lp_nfc = 0.05; 

    % Downturn PD for non-performing loans
    x.pd_ln_hh = 1;
    x.pd_ln_nfc = 1; 

    % Downturn LGD for performing loans
    x.lgd_lp_hh = 0.85; 
    x.lgd_lp_nfc = 0.45;

    % Downturn LGD for non-performing loans
    x.lgd_ln_hh = 0.95; 
    x.lgd_ln_nfc = 0.85;

    x.lambda_hh =  x.lgd_ln_hh;
    x.lambda_nfc = x.lgd_ln_nfc;

    % Fixed effect
    x.c0_ap_fe_hh = 0.94;
    x.c0_ap_fe_nfc = 0.94;

end%

