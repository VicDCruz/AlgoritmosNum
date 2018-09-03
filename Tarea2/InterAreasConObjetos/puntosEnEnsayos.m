function [intervaloConfianza, area, n] = puntosEnEnsayos(mA, sA, er, coef, M)
% PUNTOSENENSAYOS Resolviendo a la pregunta del error relativo
% ER - Error relativo
% CV - Coeficiente de variación
% SA - Desviación estandar
% MA - Media
% M - # de repeticiones
% COEF - Coeficiente de probabilidad
cv = sA./mA;
checkEr = find(cv < er); % Checar los puntos en que CV < ER
zValue = norminv(coef + (1-coef)/2); % El valor que arroja la prob o el er
i = checkEr(2);
intervaloConfianza = [mA(i) - zValue*sA(i) / sqrt(M), mA(i) + zValue*sA(i) / sqrt(M)];
area = mA(i); % Ultimo valor
n = i;
end

