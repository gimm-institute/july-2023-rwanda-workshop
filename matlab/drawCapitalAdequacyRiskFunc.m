function [curveH, minH] = drawCapitalAdequacyRiskFunc(axesH, model, car_min)

    x = access(model, "steady-level");

    if nargin<3
        car_min = x.car_min;
    end

    car = linspace(car_min-0.02, car_min+0.10, 500);
    car = reshape(car, [], 1);
    rx = glogc(-(car - car_min), x.c1_rx, x.c2_rx, x.c3_rx, x.c4_rx, x.c5_rx);

    curveH = plot(axesH, 100*car, 400*rx, "color", [0, 0.4470, 0.7410]);
    minH = xline(axesH, 100*car_min, "-", "", "lineWidth", 6, "fontSize", 20, "color", [0.6, 0.1, 0.1]);
    set(axesH, "xLim", 100*car([1, end]), "xLimMode", "manual", "yLim", 400*[0, max(rx)], "fontSize", 20, "plotBoxAspectRatio", [1, 0.7, 1]);

    % title(axesH, "Capital adequacy stress function");
    xlabel(axesH, "Standard CAR [%]");
    ylabel(axesH, "Credit conditions [% PA]");

end%

