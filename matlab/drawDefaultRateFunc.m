
function curveH = drawDefaultRateFunc(axesH, model)

    x = access(model, "steady-level");

    z = linspace(-0.10, 0.10, 500);

    z = reshape(z, [], 1);
    q = glogc(-z, x.ss_q_hh, x.c2_q_hh, x.c3_q_hh, x.c4_q_hh, x.c5_q_hh);

    curveH = plot(axesH, 100*z, 100*q);
    set(axesH, "yLim", [0.5, 5.5], "xLim", 100*z([1,end]), "fontSize", 20);

    title(axesH, "Portofolio default rate function");
    xlabel(axesH, "Macroeconomic conditions index [%]");
    ylabel(axesH, "Portfolio default rate [%]");

end%

