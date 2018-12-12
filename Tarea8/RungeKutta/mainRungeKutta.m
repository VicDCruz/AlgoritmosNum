function [xP, yP] = mainRungeKutta(dy, yi, xi, xf, dx, xout, order)
    %% Iniciando proceso
    xP = zeros(1, xf - xi + 1);
    yP = zeros(1, xf - xi + 1);
    m = 1;
    xP(m) = xi;
    yP(m) = yi;
    while xP(m) < xf
        xEnd = xP(m) + xout;
        if xEnd > xf
            xEnd = xf;
        end
        h = dx;
        [xP, yP, m] = integrator(m, xP, yP, h, xEnd, dy, order);
    end
    
    %% Mostrando el resultado
    figure;
    plot(xP, yP)
end