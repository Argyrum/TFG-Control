%

%
clc
clear all
close all
%
% ... Parameters
km=40.0;
taum=0.3;
N=9.0;
DZmax=0.34;
DZmin=-DZmax;
%
%kpot=1.62;
kpot=1.0;
%
% ... Control
kc=1.0; % La DZ crea problemas de ess.
%kc=1.5; % La DZ no crea problemas de ess pero cambia la dinámica respecto al regimen lineal.

% ... Dithering
%Dmax=0.4;
%Dmax=0.8; % Valores más grandes de amplitud del dithering hacen que el
%            comportamiento se parezca más al del regimen lineal (sin DZ).
Dmax=1.2;
Dmin=-Dmax;
Fd=1.0e3;
Td=1/Fd;
%
%
% ... PWM (2 levels)
Fsw=15.0e3;
%Fsw=20.0e3;
Tsw=1/Fsw;
%
umax=5.0;
umin=-umax;
%Vm=12.0;
Vm=5.0;
%
kuadj=umax/(umax-DZmax); % cte. para clavar las ganancias en el modulador.



disp('Ini_Sim: OK.');
