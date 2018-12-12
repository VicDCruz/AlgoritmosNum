G = 6.67408E-11; %%  m3 kg-1 s-2
m=[1.9891E+30, 5.9736E+24];

T = 365.25;
w = 2*pi/(T*24*60^2);
d = (G*m(1)/w^2)^(1/3);
%
% cada móvil en una columna
%
% r0=[[0;0;0],[6378000.0+108000.0;0;0]];
r0=[[0;0;0],[d;0;0]];
v0=[[0;0;0],[0;w*d;0]];
deltaT=4*60;  %% cada minuto
%Nk=1+2*60*60/deltaT; 
Nk = 365.25*24*60*60/deltaT; % un ciclo de la luna
pos=zeros(Nk+1,6);
pos(1,:)=[r0(:,1)',r0(:,2)'];
%
%  para crear el espacio para el vector unitario en la dirección de la
%  fuerza, la fuerza y la aceleración (vectoriales)
%
u = r0;
F = r0;
a = r0;
dr= r0;
%
% Variables para iterar
%
r = r0;
v = v0;
for t=1:Nk,
  %
  % vector de diferencias de posiciones entre el móvil 1 al móvil 2
  %
  dr = r(:,2) - r(:,1);
  %
  % distancia al cuadrado
  %
  dr2 = dr' * dr;
  %
  % Vector unitario de móvil 1 al móvil 2
  %
  u = dr / sqrt(dr2);
  %
  % Fuerza de gravedad
  %
   F = G * m(1)*m(2)/dr2 * u;
  %
  % Aceleración de cada móvil
  %
   a = [F / m(1), - F / m(2)];
  %
  % Velocidad
  %
   v = v + a * deltaT;
  %
  % RungeKutta
  %
  drT = r(:,2) - r(:,1);
  dr2T = drT' * drT;
  uT = drT / sqrt(dr2T);
  FT = G * m(1)*m(2)/dr2T * uT;
  aT = [FT / m(1), - FT / m(2)];
  vT = v + aT * deltaT;
  k1 = vT;
  rT = r + k1 / 2 * deltaT;
  
  drT = rT(:,2) - rT(:,1);
  dr2T = drT' * drT;
  uT = drT / sqrt(dr2T);
  FT = G * m(1)*m(2)/dr2T * uT;
  aT = [FT / m(1), - FT / m(2)];
  vT = v + aT * deltaT;
  k2 = vT;
  rT = r + k2 / 2 * deltaT;
  
  drT = rT(:,2) - rT(:,1);
  dr2T = drT' * drT;
  uT = drT / sqrt(dr2T);
  FT = G * m(1)*m(2)/dr2T * uT;
  aT = [FT / m(1), - FT / m(2)];
  vT = v + aT * deltaT;
  k3 = vT;
  rT = r + k3 / 2 * deltaT;
  
  drT = rT(:,2) - rT(:,1);
  dr2T = drT' * drT;
  uT = drT / sqrt(dr2T);
  FT = G * m(1)*m(2)/dr2T * uT;
  aT = [FT / m(1), - FT / m(2)];
  vT = v + aT * deltaT;
  k4 = vT;
  vRK = (k1 + 2*k2 + 2*k3 + k4) / 6;
  %
  % Posición
  %
  r = r + vRK * deltaT;
  %
  % Guardo la posición
  %
  pos(t+1,:) = [r(:,1)',r(:,2)'];
  %
  %
  %
  %S = sprintf('pos: %12.2f,%12.2f  vel: %12.2f,%12.2f Fza: %12.2f,%12.2f Acel: %12.2f,%12.2f', ...
  %            r(1,2),r(2,2),v(1,2),v(2,2),-F(1,1),-F(2,1),a(1,2),a(2,2));
  %disp(S);
                
end

plot3(pos(:,1),pos(:,2),pos(:,3),'o',pos(:,4),pos(:,5),pos(:,6)'.')
