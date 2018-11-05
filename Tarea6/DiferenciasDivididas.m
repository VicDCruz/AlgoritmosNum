%% Initial variables
deltaT = 0.1;
ciclos = 2;
k = 20;
f = @(t) cos(t);
lengthCoefficients = k - 1;
r = 100;

t = zeros(1, k);
fEval = zeros(1, k);
fEval(1) = f(t(1));
for i = 2:k
    t(i) = t(i - 1) + deltaT * rand();
    fEval(i) = f(2*pi*ciclos*t(i));
end
close all;
plot(t, fEval, '*');
hold on;

%% Getting coefficients
coefficients = zeros(lengthCoefficients, lengthCoefficients);
for i = 1:lengthCoefficients
    for j = 1:lengthCoefficients - i + 1
        if i == 1
            coefficients(i, j) = (fEval(j + 1) - fEval(j)) / (t(j + 1) - t(j));
        else
            coefficients(i, j) = (coefficients(i - 1, j + 1) - coefficients(i - 1, j)) / (t(j + i) - t(j));
        end
    end
end
coefficients = coefficients';

%% Recreating f(t)
tMin = t(1);
tMax = t(lengthCoefficients);
h = (tMax - tMin) / 100;
newT = zeros(1, r);
for i = 1:r
    newT(i) = tMin + (i - 1) * h;
end
newCoefficients = zeros(lengthCoefficients, r);
for i = 1:r
    for j = 1:lengthCoefficients
        if j == 1
            newCoefficients(j, i) = newT(i) - t(j);
        else
            newCoefficients(j, i) = newCoefficients(j - 1, i) * (newT(i) - t(j));
        end
    end
end
newF = zeros(1, r);
for i = 1:r
    newF(i) = fEval(1) + (coefficients(1, :) * newCoefficients(:, i));
end
plot(newT, newF);