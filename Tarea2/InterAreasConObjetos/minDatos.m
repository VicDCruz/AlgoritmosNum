function k = minDatos(N, mA, r, coef, dx, dy)
%MINDATOS Obtener la minima cantidad de puntos para una estimación
%   Checar cuantos puntos hay por muestra y cuantas veces se repite para
%   analizar si es valido tener una cantidad de puntos suficientemente
%   buenos para que los cálculos sean correctos.
w = norminv(coef + (1-coef)/2);
m = mean(mA);
diff = dx * dy;
prob = m / diff * (1 - (m / diff));
k = (4 * w ^ 2 * diff ^ 2 * prob) / (N * m^2 * r^2);
end

