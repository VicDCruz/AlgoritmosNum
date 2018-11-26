function polynomial = regresion(xR, yR, grado)
    length = max(size(xR));
    %% Creando resY
    resY = zeros(grado + 1, 1);
    for i = 1:grado+1
        if iscolumn(xR)
            xR = xR';
        end
        if isrow(yR)
            yR = yR';
        end
        resY(i) = xR.^(i - 1)*yR;
    end
    %% Creando coeficientes
    M = zeros(grado + 1);
    for i = 1:grado+1
        for j = 1:grado+1
            if i == 1 && j == 1
                M(i, j) = length;
            else
                M(i, j) = sum(xR.^(i - 1 + j -1));
            end
        end
    end
    %% Obtener los coeficientes de cada ak
    a = M \ resY;
    a = flipud(a);
    %% Nuevo polinomio con los valores de 'a'
    polynomial = poly2sym(a);
    polynomial = matlabFunction(polynomial);
end

