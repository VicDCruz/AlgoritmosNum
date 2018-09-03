% tstFigura2
figs    = {};
figs{1} = Triangulo([-2.5*sqrt(3)/2; -2.5], [2.5*sqrt(3)/2; -2.5], [0; 5]);
figs{2} = Circulo([-2.5*sqrt(3)/2; -2.5], 1/2);
figs{3} = Circulo([2.5*sqrt(3)/2; -2.5], 1/2);
figs{4} = Circulo([0; 5], 1/2);
figs{5} = RectanguloCanonico([0;0], 1/2, 1/2);
inter_cta = [0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
fc = FiguraCompuesta(figs,inter_cta);
vxtrms = fc.valoresExtremos();
dx = vxtrms(1,2) - vxtrms(1,1);
dy = vxtrms(2,2) - vxtrms(2,1);
dxdy = dx * dy;
M = 50;
N = 40;
K = 100;
A = zeros(M,N);
tic
for n = 1:N  % para cada columna
    k = K * n;
    for m = 1:M
      puntos = [vxtrms(1,1) + dx * rand(1,k); vxtrms(2,1) + dy * rand(1,k)];
      cuenta = 0;
      for w = 1:k
       cuenta = cuenta + fc.contiene(puntos(:,w));
      end
      proporcion = cuenta / k;
      A(m,n) = dxdy * proporcion;
    end 
end
toc
% ===Lo queremos saber===
AreaTeorica = 1 + 5*pi/8;
p = AreaTeorica / dxdy;
stdAteorica=dxdy*sqrt(p*(1-p))./sqrt(K*(1:N));
% =======================
mA = mean(A);
sA = std(A);

% ===¿Qué tal si hacemos una distribución con las medias?===
% muEstimador = mean(mA);
% varEstimador = sum((mA - muEstimador).^2)/max(size(mA));
% x = [2.6:.01:3.4];
% norm = normpdf(x,muEstimador,varEstimador);
% plot(x, norm);
% hold on
% plot([muEstimador - sqrt(varEstimador), muEstimador - sqrt(varEstimador)], [0, max(norm)])
% plot([muEstimador + sqrt(varEstimador), muEstimador + sqrt(varEstimador)], [0, max(norm)])
% ==========================================================

% ===Estimando el porcentaje que es menor al ER===

% sum(sA ./ mA < .10)/max(size(mA))
% 
% check = zeros(1, N);
% er = .10;
% for i = 1:N
%     sumXi = sum(A(:,i))/dxdy;
%     Xi = A(:,i)/dxdy;
%     sumXi2 = Xi' * Xi;
%     check(i)=(er^2+1)*sumXi/sumXi2;
% end
% mean(check)/K

res1 = zeros(1, N);
res2 = zeros(1, N);
for i = 1:N
    a = A(:,i)'*A(:,i);
    b = sum(A(:,i))^2;
    c = .10 * norminv(1-.10/2);
    res1(i) = (a + sqrt(a^2-4*c*b))/(2*c);
    res2(i) = (a - sqrt(a^2-4*c*b))/(2*c);
end
hold on
plot(res1)
plot(res2)
% ================================================

% ===Checar la distribución de todas las M===
% hold on
% for i = 1:max(size(mA))
%     muEstimador = mA(i);
%     varEstimador = sA(i);
%     x = [muEstimador*(.10):.01:muEstimador*(1.9)];
%     norm = normpdf(x,muEstimador,varEstimador);
%     plot(x, norm);
% %     plot([muEstimador - sqrt(varEstimador), muEstimador - sqrt(varEstimador)], [0, max(norm)])
% %     plot([muEstimador + sqrt(varEstimador), muEstimador + sqrt(varEstimador)], [0, max(norm)])
% end
% hold off
% =====================================

% ===Obtener los intervalos de confianza===
hold on
er = 0.10;
n =zeros(1, max(size(mA)));
lA =zeros(1, max(size(mA)));
zValue = norminv(1-er/2);
for i = 1:max(size(mA))
%     low = mA(i) - tinv(1-er/2, M-1)*sA(i) / M;
%     high = mA(i) + tinv(1-er/2, M-1)*sA(i) / M;
    low = mA(i) - zValue*sA(i) / sqrt(M);
    high = mA(i) + zValue*sA(i) / sqrt(M);
%     plot([low, low], [0,1])
%     plot([high, high], [0,1])
%     L = high.low;
    L = .1;
    lA(i) = abs(high-low);
    n(i) = (zValue*sA(i)/L)^2;
end
hold off
% =========================================

hold off
hold on
plot(A','.')
plot((1:N),ones(1,N)*AreaTeorica)
plot((1:N),mA,'o')
plot((1:N),mA + sA,'+')
plot((1:N),mA - sA,'+')
plot((1:N),AreaTeorica + stdAteorica)
plot((1:N),AreaTeorica - stdAteorica)

% ===VC===
plot((1:N), ones(1,N)*AreaTeorica*1.10)
plot((1:N), ones(1,N)*AreaTeorica*.90)
% ========

D=zeros(1,N);
for n=1:N
    D(n)=sum((AreaTeorica-stdAteorica(n)<=A(:,n)).*(A(:,n)<=AreaTeorica+stdAteorica(n)));
end
porcEnsayos = D/M;