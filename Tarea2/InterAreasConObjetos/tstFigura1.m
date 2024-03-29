% tstFigura2
figs    = {};
figs{1} = Triangulo([-2.5*sqrt(3)/2; -2.5], [2.5*sqrt(3)/2; -2.5], [0; 5]);
figs{2} = Circulo([0;0], 1+1/2);
inter_cta = [1,0,0,0];
fc = FiguraCompuesta(figs,inter_cta);
vxtrms = fc.valoresExtremos();
dx = vxtrms(1,2) - vxtrms(1,1);
dy = vxtrms(2,2) - vxtrms(2,1);
dxdy = dx * dy;
M = 50;
N = 80;
K = 100;
A = zeros(M,N);
tic
parfor n = 1:N  % para cada columna
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
AreaTeorica = 2.5 * sqrt(3) * 7.5 / 2 - pi * 1.5^2;
p = AreaTeorica / dxdy;
stdAteorica=dxdy*sqrt(p*(1-p))./sqrt(K*(1:N));
mA = mean(A);
sA = std(A);
hold off
hold on
plot(A','.')
plot((1:N),ones(1,N)*AreaTeorica)
plot((1:N),mA,'o')
plot((1:N),mA + sA,'+')
plot((1:N),mA - sA,'+')
plot((1:N),AreaTeorica + stdAteorica)
plot((1:N),AreaTeorica - stdAteorica)

D=zeros(1,N);
for n=1:N
    D(n)=sum((AreaTeorica-stdAteorica(n)<=A(:,n)).*(A(:,n)<=AreaTeorica+stdAteorica(n)));
end
porcEnsayos = D/M;