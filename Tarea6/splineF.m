function polynomial = splineF(x, conditions, b, derivatesNum)
    %SPLINE Obtener una aproximación polonomial dado 
    % unos puntos y condiciones
    % Argumentos:
    % x -> Todas las Xs por las que debe pasar la curva (VECTOR)
    % conditions -> Condiciones que le imponemos a 
    %               la curva, sobre el eje x (VECTOR de los val. de X)
    % b -> Condiciones que le imponemos a 
    %      la curva, sobre el eje y (VECTOR de los val. de Y)
    % derivatesNum -> Dada las condiciones, qué derivada va a 
    %                 tener cada una (VECTOR de las derivadas de cada condición)
    length = max(size(x));
    lengthConditions = max(size(derivatesNum));
    %% Crear coeficientes
    coefficients = sym('a', [1, length + 1]);
    %% Crear polinomio
    polynomial = poly2sym(coefficients);
    %% Creando derivadas
    derivates = sym(zeros(1, max(derivatesNum)));
    syms x
    for i = 1:lengthConditions
        if derivatesNum(i) ~= 0
            derivates(derivatesNum(i)) = diff(polynomial, x, derivatesNum(i));
        end
    end
    %% Valores M
    M = zeros(lengthConditions, length + 1);
    for i = 1:lengthConditions
        if derivatesNum(i) == 0
            p = subs(polynomial, x, conditions(i));
        else
            p = subs(derivates(derivatesNum(i)), x, conditions(i));
        end
        c = coeffs(p, coefficients);
        if max(size(c)) ~= length + 1
            z = zeros(1, length + 1 - max(size(c)));
            c = [z, c];
        end
        M(i, :) = c;
    end
    %% Resolviendo los coeficientes
    if isrow(b)
        b = b';
    end
    a = M \ b;
    a = flipud(a);
    
    %% Nuevo polinomio con los valores de 'a'
    polynomial = poly2sym(a);
    polynomial = matlabFunction(polynomial);
end
