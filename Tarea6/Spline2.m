%% Obtener puntos en forma de matrix
x0 = 1;
y0 = 0.25;
x1 = 2;
y1 = 1;
x2 = 3;
y2 = -0.5;

m1 = (y1 - y0) / (x1 - x0);
m2 = (y1 - y2) / (x1 - x2);

polynomial = splineF([x0, x1, x2], [x0; x2; x0; x2], [y0; y2; m1; m2], [0, 0, 1, 1])

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