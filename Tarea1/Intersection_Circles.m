%% Encontrar el área de intersección entre 2 círculos.
clc; clear all; close all;
r1 = 2; r2 = 2;
c1 = [-1 0]; c2 = [1 0];
K = 1000;
%% Teoric Area
d = sqrt((c2(1) - c1(1))^2 + (c2(2) - c1(2))^2);
d1 = (r1^2 - r2^2 + d^2) / (2*d);
d2 = d - d1;
ATeoric = r1^2 * acos(d1 / r1) - d1 * sqrt(r1^2 - d1^2) + r2^2 * acos(d2 / r2) - d2 * sqrt(r2^2 - d2^2)
%% Points of circles' intersection
x1I = c2(1) - r2; x2I = c1(1) + r1;
y1I = c1(2) - sqrt(r1^2 - (c1(1) + (x2I - x1I) / 2 - c1(1))^2);
y2I = c1(2) + sqrt(r1^2 - (c1(1) + (x2I - x1I) / 2 - c1(1))^2);
%% Random points of Xs & Ys [a, b]
a = x1I; b = x2I; x = (b-a).*rand(K,1) + a;
a = y1I; b = y2I; y = (b-a).*rand(K,1) + a;
%% Rectangle that encapsule area circles' intersection
ARectangle = (x2I - x1I) * (y2I - y1I);
%% Get intersection's area
A = sum((x - c1(1)).^2 + (y - c1(2)).^2 <= r1^2 & (x - c2(1)).^2 + (y - c2(2)).^2 <= r2^2) / K * ARectangle
%% Display results
hold on;
plot(x, y, '.')
viscircles(c1, r1);
viscircles(c2, r2);
hold off;