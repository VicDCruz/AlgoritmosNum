%% Encontrar el área de intersección entre 2 círculos.
clc; clear all; close all;
%% Initial values of the cirles
r1 = 2; r2 = 2;
c1 = [1, 0]; c2 = [-1, 0];
%% Teoric Area
d = sqrt((c2(1) - c1(1))^2 + (c2(2) - c1(2))^2);
d1 = (r1^2 - r2^2 + d^2) / (2*d);
d2 = d - d1;
ATeorica = real(r1^2 * acos(d1 / r1) - d1 * sqrt(r1^2 - d1^2) + r2^2 * acos(d2 / r2) - d2 * sqrt(r2^2 - d2^2));
%% Repeat Monte Carlo M times with differents N
M = 100;
N = 50;
K = 200;
mediaTeorica = ATeorica;
sdTeorica = real(sqrt(mediaTeorica * (1-mediaTeorica)));
A = zeros(M,N);
for n = 1:N %% cantidad de columnas
    k = K * n; %% datos de cada muestreo por ensayo en la columna
    for m= 1:M
        A(m,n) = areaIntersection(r1, c1, r2, c2, k);
    end
end
mA = mean(A);
sdA = std(A);

hold on;
plot(A', '.')
plot((1:N), mediaTeorica * ones(1, N))
plot((1:N), mA, 'o')
plot((1:N), mediaTeorica + sdA, 'o') %% Desviación experimental
plot((1:N), mediaTeorica - sdA, 'o')
plot((1:N), mA - sdA) %% Tendencia experimental
plot((1:N), mA + sdA)

sdTA = sdTeorica./sqrt(K*(1:N));
plot((1:N), mediaTeorica + sdTA)
plot((1:N), mediaTeorica - sdTA)
hold off;