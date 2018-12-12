function [xP, yP] = mainRungeKutta(yi, n, dy, xi, xf, dx, xout)

    %% Iniciando proceso
    xP = zeros(1, xf - xi + 1);
    yP = zeros(n, xf - xi + 1);
    m = 1;
    xP(m) = xi;
    yP(:, m) = yi;
    while xP(m) < xf
        xEnd = xP(m) + xout;
        if xEnd > xf
            xEnd = xf;
        end
        h = dx;
        [xP, yP, m] = integrator(n, m, xP, yP, h, xEnd, dy);
    end
    
    %% Mostrando el resultado
    figure;
    plot(xP, yP)
end