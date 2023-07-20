
function x = connectInterestRates(x)

    x.ss_cap_hh = 2;
    x.c1_new_rl_full_hh = 0;
    x.c1_new_rl_cap_hh = 20;

    x.psi_rl_hh = 1;

    x.ss_rd_apm_lcy = 0/400;
    x.ss_rd_apm_fcy = 0/400;

    x.psi_rd_lcy = 1;
    x.psi_rd_fcy = 1;

    x.ss_rl_apm_hh = 0/400;

    x.c1_new_rl_hh = 0.750;

    x.c1_rl_base_hh = 1;

    x.c0_rl_apm_hh = 0.9;

    x.ss_rona_spread = 0/400;

end%

