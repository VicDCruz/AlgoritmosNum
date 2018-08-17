%% Circle's area
close all; clear; clc;
r = .5; d = 2*r;
c = [-1 0];
ASquare = d^2;
ATeorica = pi * r^2
K = 10000;
aX = c(1) - r; bX = c(1) + r;
aY = c(2) - r; bY = c(2) + r;
x = (bX-aX).*rand(K,1) + aX;
y = (bY-aY).*rand(K,1) + aY;
A = sum((x-c(1)).^2 + (y-c(2)).^2 <= r^2) / K * ASquare
plot(x, y, '.')
hold on;
viscircles(c, r);
hold off