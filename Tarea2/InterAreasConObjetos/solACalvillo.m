%tstPreExamen
clear all;
close all;
figs    = {};
figs{1}=Triangulo([-2.5*sqrt(3)/2; -2.5], [2.5*sqrt(3)/2; -2.5], [0; 5]);
figs{2}=Circulo([0;0], 1+1/2);
inter_cta = [1,0,0,0];
fc = FiguraCompuesta(figs,inter_cta);
vxtrms = fc.valoresExtremos();
dx = vxtrms(1,2) - vxtrms(1,1);
dy = vxtrms(2,2) - vxtrms(2,1);
dxdy = dx * dy;
j=1;
alpha=10;
M = 50;
N = 40;
K = 10;
A = zeros(M,N);
n=1;
tic
while n <= N  % para cada columna
    k = K * n;
    parfor m = 1:M
      puntos = [vxtrms(1,1) + dx * rand(1,k); vxtrms(2,1) + dy * rand(1,k)];
      cuenta = 0;
      for w = 1:k
       cuenta = cuenta + fc.contiene(puntos(:,w));   
      end
      proporcion = cuenta / k;
      A(m,n) = dxdy * proporcion;
    end
    if std(A(:,n))/mean(A(:,n))<.10 && j==1
        j=n;
        n=N;
    end
    n=n+1;
end
toc
AreaTeorica =mean(A(:,j)) %3 * sqrt(3) / 4; % 36 - 4 * pi + 3 * sqrt(3) / 4;
p = mean(A) / dxdy;
stdAteorica=dxdy*sqrt(p.*(1-p))./sqrt(K*(1:N));
mA = mean(A);
sA = std(A);
err=sA./mA
figure(1)
plot([1:1:40],err);
% hold off
figure(2)
hold on
A;
plot(A','.')
plot((1:N),ones(1,N)*AreaTeorica)
plot((1:N),mA,'o')
plot((1:N),mA + sA,'+')
plot((1:N),mA - sA,'+')
plot((1:N),AreaTeorica + stdAteorica)
plot((1:N),AreaTeorica - stdAteorica)

fprintf('Con una confianza de %3.1f porciento \nel área está entre %4.2f y %4.2f \ncon %3d ensayos mínimos\ny una estimación puntual de %3.2f'...
    ,(100-alpha),mA(j)-sA(j)*icdf('Normal',1-alpha/200,0,1),mA(j)+sA(j)*icdf('Normal',1-alpha/200,0,1)...
    ,j*K,mA(j));
% D=zeros(1,N);
% for n=1:N
%     D(n)=sum((AreaTeorica-stdAteorica(n)<=A(:,n)).*(A(:,n)<=AreaTeorica+stdAteorica(n)));
% end
% porcEnsayos = D/M;