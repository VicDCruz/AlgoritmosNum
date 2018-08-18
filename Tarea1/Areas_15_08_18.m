% close all; clear; clc;
M = 100;
N = 50;
K = 200;
mediaTeorica = pi/4;
sdTeorica = sqrt((pi/4) * (1-pi/4));
A = zeros(M,N);
for n = 1:N %% cantidad de columnas
    k = K * n; %% datos de cada muestreo por ensayo en la columna
    for m= 1:M
        x = rand(k,1);
        y = rand(k,1);
        A(m,n) = sum(x.*x + y.*y <= 1) / k;
    end
end
mA = mean(A);
sdA = std(A);

plot(A', '.')
hold on;
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