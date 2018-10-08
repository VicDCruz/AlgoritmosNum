% tstFiguraCompuesta
clear all; 
figs    = {};
figs{1} = Circulo([0;0],2);
tam_trian = 5;
figs{2} = Triangulo(tam_trian * [0;1], ...
                    tam_trian * [-0.5*sqrt(3);-0.5], ...
                    tam_trian * [0.5*sqrt(3);-0.5]);
figs{3} = Circulo( tam_trian * [0;1],1);
figs{4} = Circulo( tam_trian * [-0.5*sqrt(3);-0.5],1);
figs{5} = Circulo( tam_trian * [ 0.5*sqrt(3);-0.5],1);
figs{6}=RectanguloCanonico([0;0],4,2);
clf
hold on
figs{1}.dibuja();
figs{2}.dibuja();
figs{3}.dibuja();
figs{4}.dibuja();
figs{5}.dibuja();
figs{6}.dibuja();
pause;
close all;
%return
inter_cta = zeros(1,64);
% inter_cta(3) = 1;
% inter_cta(4) = 1;
% inter_cta(8) = 1;
inter_cta(34) = 1;
fc = FiguraCompuesta(figs,inter_cta);
vxtrms = fc.valoresExtremos();
dx = vxtrms(1,2) - vxtrms(1,1);
dy = vxtrms(2,2) - vxtrms(2,1);
dxdy = dx * dy;
M = 50;
N = 70;
K = 100;
A = zeros(M,N);
errRel=.05; %Error relativo 
alpha=10;%entre 0 y 100. Es el intervalo de confianza  ;
n=1;
j=1;
tic
quan=zeros(1,N);
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
    %quan = 2W (¿Ancho de banda?)
    quan(n)=abs(icdf('Normal',alpha/200,mean(A(:,n)),std(A(:,n))^2)-icdf('Normal',1-alpha/200,mean(A(:,n)),std(A(:,n))^2)); 
    if quan(n)*std(A(:,n))/mean(A(:,n))<errRel && j==1
        j=n;
        n=N;
    end
    n=n+1;
end
toc
if(j==1), j=N, end
AreaTeorica=mean(A(:,j));%3 * sqrt(3) / 4; % 36 - 4 * pi + 3 * sqrt(3) / 4;
p = mean(A) / dxdy;
stdAteorica=dxdy*sqrt(p.*(1-p))./sqrt(K*(1:N));
mA = mean(A);
sA = std(A);
err=quan.*(sA./mA)
figure(1)
plot([1:1:j],err(1:j)), xlabel('Número de ensayo'), ylabel('Error relativo (2*w*cv)');

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

fprintf('Con una confianza de %3.1f porciento \nel área está entre %4.2f y %4.2f \ncon %3d puntos mínimos\nuna estimación puntual de %3.6f\ny un error relativo en la iteración %2d igual a %1.4f'...
     ,(100-alpha),mA(j)-sA(j)*icdf('Normal',1-alpha/200,0,1)/sqrt(j*K),mA(j)+sA(j)*icdf('Normal',1-alpha/200,0,1)/sqrt(j*K)...
    ,j*K,mA(j),j,quan(j)*sA(j)/mA(j));

% mA = mean(A);
% sA = std(A);
% clf
% hold on
% plot(A','.')
% 
% plot((1:N),mA,'o')
% plot((1:N),mA + sA,'+')
% plot((1:N),mA - sA,'+')
% 
% D=zeros(1,N);
% for n=1:N
%     D(n)=sum((mA(n) - sA(n)<=A(:,n)).*(A(:,n)<=mA(n)+sA(n)));
% end
% porcEnsayos = D/M;