%% Creando puntos random
x = zeros(1, 5);
x(1) = -1;
y = zeros(1, 5);
A0 = 1;
A1 = 0.5;
media = 0;
devEst = 0.1;
for i = 2:5
    x(i) = x(i - 1) + 0.4*rand;
    y(i) = A0 + x(i).*A1 + devEst * sqrt(-2 * log(rand)) * cos(2 * pi * rand) + media;
end

close all;
hold on;
plot(x, y, '*');
for i = 1:5
    poly = regresion(x, y, i);
    plot(x, poly(x))
end
hold off;

legend('Puntos','Grado 1','Grado 2','Grado 3','Grado 4','Grado 5');