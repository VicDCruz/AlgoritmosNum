G = 6.67408E-11; %%  m3 kg-1 s-2

m=[1.9891E+30,5.9736E+24,7.349E+22];
%
% cada m�vil en una columna
%
% r0=[[0;0;0],[6378000.0+108000.0;0;0]];

% dm = 6.442580581092797e+07;   % Posterior a la Luna ( dL + dm )
% dm = - 5.790539998830593e+07; % Anterior a la Luna  ( dL - abs(dm) )
% dm = - 7.668119951105596e+08;   % Opuesto a la Luna
theta = 0;

wT  = 2.0 * pi /(365.25*86400); %% rad/seg
dT = (G*m(1)/w^2)^(1/3);

dL = 3.832097031205720e+08;
wL  = 2.0 * pi /(27.321661*86400);

wS = 2.0 * pi /(24.47*86400);
dS = 1;

r0 = [[dS;0;0],[dT;0;0],[dT+dL;0;0]];
vLx = - wT * dT * sin(theta) + wL * dL;
vLy =   wT * dT * cos(theta) - wL * dL;

vSx = 1;
vSy = 220;

vTy = wT * dT + wL * dL;
v0 = [[vSx;vSy;0],[0;vTy;0],[vLx;vLy;0]];

deltaT=60*60;
%Nk=1+2*60*60/deltaT; 
Nk = 2*365.25*24*60*60/deltaT; % dos ciclo de la tierra
% Nk = Nk / 2;
pos=zeros(Nk+1,9);
pos(1,:)=[r0(:,1)',r0(:,2)',r0(:,3)'];
%
%  para crear el espacio para el vector unitario en la direcci�n de la
%  fuerza, la fuerza y la aceleraci�n (vectoriales)
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
  % Vector de diferencias de posiciones entre m�viles,
  % el vector drAB va de la posici�n del m�vil
  % A a la posici�n del m�vil B.
  %
  drTL = r(:,2) - r(:,1);
  drTm = r(:,3) - r(:,1);
  drLm = r(:,3) - r(:,2);
  %
  % distancia al cuadrado
  %
  drTL2 = drTL' * drTL;
  drTm2 = drTm' * drTm;
  drLm2 = drLm' * drLm;
  %
  % Vectores unitarios de los vectores entre los m�viles
  %
  uTL = drTL / sqrt(drTL2);
  uTm = drTm / sqrt(drTm2); 
  uLm = drLm / sqrt(drLm2);
  %
  % Fuerza de gravedad
  %
  FTL = G * m(1) * m(2) / drTL2 * uTL;
  FTm = G * m(1) * m(3) / drTm2 * uTm;
  FLm = G * m(2) * m(3) / drLm2 * uLm;
  %
  % Fuerzas para cada m�vil
  %
  FT =   FTL + FTm; % [0;0;0]; % FTL + FTm; %
  FL = - FTL + FLm;
  Fm = - FTm - FLm;
  %
  % Aceleraci�n de cada m�vil
  %
  a = [FT / m(1),  FL / m(2), Fm / m(3)]; 
  %
  % Velocidad
  %
  v = v + a * deltaT;
  %
  % Posici�n
  %
  r = r + v * deltaT;
  %
  % Guardo la posici�n
  %
  pos(t+1,:) = [r(:,1)',r(:,2)',r(:,3)'];
  %
  %
  %
  %S = sprintf('pos: %12.2f,%12.2f  vel: %12.2f,%12.2f Fza: %12.2f,%12.2f Acel: %12.2f,%12.2f', ...
  %            r(1,2),r(2,2),v(1,2),v(2,2),-F(1,1),-F(2,1),a(1,2),a(2,2));
  %disp(S);
                
end

plot3(pos(:,1),pos(:,2),pos(:,3),'+',pos(:,4),pos(:,5),pos(:,6)'.',pos(:,7),pos(:,8),pos(:,9)'.')
