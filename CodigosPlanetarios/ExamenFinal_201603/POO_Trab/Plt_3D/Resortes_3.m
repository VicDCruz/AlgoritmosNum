%=========== Programa Resortes_3.m ===============
%
% Simula el desplazamiento de los centros X1,X2 y X3 (en [metros]) de tres
% tres masas M1,M2 y M3 (en [Kg]) unidas por resortes.
%
% Los resortes tienen constantes K1,K2,K3 y K4 en [Nw/metro].
%
% El sistema tiene una configuración en serie
%
%    Soporte Fijo Izquierdo-K1-M1-K2-M2-K3-M3-K4-M4-K5-Soporte Fijo Derecho.
%
% Las ecusciones diferenciales del sistema son:
%
% d2X1/dt2 = -((K1+K2)/M1) * X1 +      (K2/M1) * X2
% d2X2/dt2 =       (K2/M2) * X1 - ((K2+K3)/M2) * X2 +     (K3/M2)  * X3
% d2X3/dt2 =                           (K3/M3) * X2 - ((K3+K4)/M3) * X3 + (K4/M3) * X4
% d2X4/dt2 =                                        - ((K5 + K4) / M4) * X3 + (K4/M4) * X4
%
% Las condiciones iniciales son X1(0)= X10,X2(0) = X20, X3(0) = X30,
%                              (dX1/dt)(0) = (dX2/dt)(0) = (dX3/dt)(0) = 0
% T ... Tiempo que dura la simulación (en [seg]).
% N ... Cantidad de pasos.
% deltaT ... tamaño del paso (en[seg]).
%
% Valores de las constantes de los resortes:
%
  K = 0.01*ones(5,1);
%
% Masas:
%
  M = 0.05 * ones(4,1);
%
% La representación de las variables en el vector es 
%
%   D[X1;X2;X3;U1;U2;U3] = Md * [X1;X2:X3:U1:U2:U3]
%
% se configura Md de esta manera para poder escribir el modelo
% de manera más simple.
%
  Md = zeros(8,8);
  Md(1:4,5:8) = eye(4);
  Md(1,5) = 0.050;
  Md(2,6) = 0.375;
  Md(3,7) = 0.0125;
  Md(4,8) = 0.075;
  Md(5:8,1:4) = [-(K(1) + K(2))/M(1),    K(2)/M(1)      ,   0, 0;
                   K(2)/M(2)        , - (K(2)+K(3))/M(2),   K(3)/M(2), 0;
                   0                ,    K(3)/M(3)      , -(K(3)+K(4))/M(3), K(4) / M(3)
                   0                ,   0               , -(K(5)+K(4))/M(4), K(4) / M(4)  ];
  %
  T      = 40;
  N      = 1000;
  deltaT = T / N;
%
% Condiciones iniciales:
%  
  S0 =[-0.025;0.025;0;0;0;0;0;0];
%
% La solución se guarda en el vector S de 6xN
%  
  S = zeros(8,N);
%
% Guardando las condiciones iniciales en la solución
%
  S(:,1) = S0;
%
% Iterando para obtener las posiciones de las masas en deltaT, 2deltaT, 3deltaT, ...
%
  for k = 2:N, 
    S(:,k) = S(:,k-1) + Md * S(:,k-1) * deltaT; 
  end
%
% Graficando la solución obtenida 
%
  t = (0:N-1) * deltaT;
  plot(t,S(1,:),'r',t,S(2,:),'g',t,S(3,:),'b',t,S(4,:),'c')
%
% Fin del código
%  