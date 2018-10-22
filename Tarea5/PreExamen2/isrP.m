percepcion = [1.00, 578.53, 4910.19, 8629.21, 10031.08, 12009.95, ...
    24222.32, 38177.70, 72887.51, 97183.34 , 291550.01];
limInf = percepcion;
limSup = [578.52, 4910.18, 8629.20, 10031.07, 12009.94, 24222.31, ...
    38177.69, 72887.50, 97183.33, 291550.00, Inf];
cuotaFija = [0, 11.11, 238.33, 692.96, 917.26, 1271.87, 3880.44, ...
    7162.74, 17575.69, 25350.35, 91435.02];
porcentajeExcedente = [1.92, 6.40, 10.88, 16.00, 17.92, 21.36, 23.52, ...
    30.00, 32.00, 34.00, 35.00];
find = 15000;
%% Forma 1
% isr = lagrange(percepcion, cuotaFija);
% isr = chebyshev(max(size(cuotaFija)), cuotaFija);
% isrM = matlabFunction(isr);
% perc = rootBiseccion(percepcion - find, isrM);
% plot(percepcion, isrM(percepcion), '-*')
% hold on
% plot(linspace(0,291550.01), isrM(linspace(0,291550.01)))

%% Forma 2
cont = 1;
while cont < max(size(percepcion)) && find > percepcion(cont)
    cont = cont + 1;
end
cont = cont - 1;
isr = cuotaFija(cont) + porcentajeExcedente(cont) / 100 * (find - limInf(cont));
neto = find - isr;

%% Forma 3
perc = rootBiseccionDiscreto(1:max(size(percepcion)), percepcion - find);
limInf(perc)
isr = cuotaFija(cont) + porcentajeExcedente(cont) / 100 * (find - limInf(cont))
neto = find - isr