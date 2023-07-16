
function ch = defineChartpack()

    ch = databank.Chartpack();
    ch.Round = 8;
    ch.Tiles = [3, 3];
    ch.PlotSettings = {"marker", "s", "markerSize", 6};
    ch.AxesExtras = { @(h) xlabel(h, "Quarters") };
    ch.FigureTitle = ["Macro", "Credit, interest, and performance", "Bank profits and capital"];
    ch.Transform = @(x) 100*(x-1);

    ch + "GDP // Pct level deviations: y";
    ch + "GDP gap // Pct level deviations: ^100*(y_gap-1)";
    ch + "Short-term policy rate // Pp deviations: ^400*r";
    ch + "CPI inflation Q/Q PA // Pp deviations: roc_cpi^4"; 
    ch + "Nominal exchange rate // Pct level deviations: e";
    ch + "Proxy for asset prices // Pct level deviations: fwy";

    ch + "//";

    ch + "Credit to GDP ratio // Pp deviations: ^100*l_to_4ny_hh";
    ch + "New credit to GDP ratio // Pp deviations: ^100*new_l_to_ny_hh";
    ch + "New real credit // Pct level deviations: new_l_hh/cpi";
    ch + "Credit conditions // Pp deviations PA: ^400*new_rl_full_spread_gap";
    ch + "Stock lending rates // PP deviations PA: ^400*rl_hh";
    ch + "Portfolio defaults // Pp deviations: ^100*q_hh";
    ch + "Nonperforming loans to gross loans // Pp deviations: ^100*ln_to_l_hh";
    ch + "Bwl allowances to gross loans // Pp deviations: ^100*ap_to_l";
    ch + "Fwl allowances to gross loans // Pp deviations: ^100*af_to_l";

    ch + "//";

    ch + "Return on bank capital // Pp deviations PA: ^400*rbk";
    ch + "Cost of bank capital // Pp deviations PA: ^400*rx";
    ch + "External capital flows to capital // Pp deviations: ^100*xcf_to_bk";
    ch + "CAR // Ratio: ^100*(ss_car_min + ss_car_exc + car)";
    ch + "Min CAR // Pp deviations: ^100*(ss_car_min + car_min)";

end%

