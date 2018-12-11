function [xP, yP] = mainRungeKutta(edos, cond, n, dy, xi, xf, dx, xout)
    y = cell(n, 1);
    %% Asignación de valores
    ySolve = struct2cell(dsolve(edos, cond));
    for i = 1:n
        y{i} = matlabFunction(ySolve{n - i + 1});
    end

    %% Iniciando proceso
    xP = zeros(1, xf - xi + 1);
    yP = zeros(n, xf - xi + 1);
    x = xi;
    m = 1;
    xP(m) = x;
    for i = 1:n
        yFun = y{i};
        yP(i, m) = yFun(x);
    end
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