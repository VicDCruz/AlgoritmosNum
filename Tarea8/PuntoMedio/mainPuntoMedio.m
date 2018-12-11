function [xP, yP] = mainPuntoMedio(dy, edo, cond, xi, xf, dx, xout)
    %% Asignación de valores
    y = matlabFunction(dsolve(edo, cond));

    %% Iniciando proceso
    xP = zeros(1, xf - xi + 1);
    yP = zeros(1, xf - xi + 1);
    x = xi;
    m = 1;
    xP(m) = x;
    yP(m) = y(x);
    while xP(m) < xf
        xEnd = xP(m) + xout;
        if xEnd > xf
            xEnd = xf;
        end
        h = dx;
        [xP, yP, m] = integrator(m, xP, yP, h, xEnd, dy);
    end
    
    %% Mostrando el resultado
    figure;
    plot(xP, yP)
end