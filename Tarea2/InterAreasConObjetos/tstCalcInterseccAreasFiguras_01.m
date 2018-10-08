%tstCalcInterseccAreasFiguras_01
%
N = 10000;
figs = {};
figs(1) = {Circulo([-2.0;3.0],1.0)};
figs(2) = {Circulo([-1.0;3.0],1.0)};
figs(3) = {ElipseCanonica([1.0;0.0],2.0,1.0)};
figs(4) = {RectanguloCanonico([2.0;1.0],2.0,3.0)};
figs(5) = {RomboCanonico([-1.0;-1.0],2.0,3.0)};
figs(6) = {RectanguloCirculo([-1,-1], 3, [-1,3], 7, 5)}; % Ejemplo agregado
figs(7) = {Diamante([-2,3], 5,2)}; % Ejemplo agregado
veces = 500;
area1 = zeros(veces,1);
tic
parfor vez = 1:veces
    [a,tamRectGral] = calcInterseccAreasFiguras_01(figs,N);
    area1(vez) = a(1);
    if mod(vez,10) == 0
      fprintf('vez: %4d, area(1): %12.6f\n', vez,area1(vez))  
    end
end    
toc
prom_area3s    = mean(area1);
desvStd_area3s = std(area1);
fprintf('promedio(area3): %12.6f,    desvStd(area3s): %12.6f\n', ...
         prom_area3s, desvStd_area3s)
%
% ================= Fin de tst ====================
%
