%% Obtener puntos en forma de matrix
x0 = 1;
y0 = 0.25;
x1 = 2;
y1 = 1;
x2 = 3;
y2 = -0.5;

m1 = (y1 - y0) / (x1 - x0);
m2 = (y1 - y2) / (x1 - x2);

%% Crear condiciones y solución
% conditions = {
%     matlabFunction(polynomial, x, x0), y0;...
%     matlabFunction(polynomial, x, x2), y2;...
%     matlabFunction(diff(polynomial), x, x0), m1;...
%     matlabFunction(diff(polynomial), x, x2), m2
% };
M = [
    1, x0, x0^2, x0^3;
    1, x2, x2^2, x2^3;
    0, 1, 2*x0, 3*x0^2;
    0, 1, 2*x2, 3*x2^2
];
b = [y0; y2; m1; m2];
% a = inv(M) * b;
a = M \ b; % Más eficiente que inv(M) * b

%% Crear polinomio apoximado
syms x
polynomial = a(1);
for i = 2:numel(a)
    polynomial = polynomial + a(i) * x ^ (i - 1);
end
polynomial = matlabFunction(polynomial);

%% Graficar
% Puntos de las condiciones
close all;
hold on;
plot(x0, y0, 'r*');
plot(x1, y1, 'r*');
plot(x2, y2, 'r*');
minPoint = min([x0, x1, x2]); maxPoint = max([x0, x1, x2]);
pointsToGraph = linspace(minPoint * 0.50, maxPoint * 1.50);
plot(pointsToGraph, polynomial(pointsToGraph));