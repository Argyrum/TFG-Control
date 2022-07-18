
%% Sesi�n 3. Ejercicio 11
clc, close all
%% Definici�n de los par�metros de la planta
K0    = 61;  % Ganancia can�nica motor
tau0  = 0.28; % Constante de tiempo del motor
Kpot = 1.69; % Constante del potenci�metro
red  = 1/9;  % reductor de velocidad

% Definici�n del periodo de muestreo (s)
Ts = 0.01; 

% Especificaciones para el sistema de control deseado
Sp = 80;    % Sobrepico en tiempo continuo (Porcentual)
fd = 1;   % Frequencia propia (Hz)

%% Determinaci�n de los polos de un sistema de segundo orden que cumpla con
% las especificaciones del sistema de control deseado

% coeficiente de amortiguamiento
xi = sqrt(log(Sp/100)^2/(pi^2+log(Sp/100)^2));
% Frecuencia de oscilaci�n
wd = 2*pi*fd;
wn = wd/sqrt(1-xi^2);

% Polos del sistema
s1 = -xi*wn+1j*wd;
s2 = -xi*wn-1j*wd;

% Determinaci�n de los polos en tiempo discreto
p1 = exp(Ts*s1);
p2 = exp(Ts*s2);

%% Fijamos el tercer polo >> valor dado por el enunciado
p3 = 0.01; 

%% C�lculo de la funcion de transferencia de la planta
Ptas = tf(K0*red*Kpot,[tau0 1 0]);
Ptaz = c2d(Ptas,Ts,'zoh');

%% Coeficientes del numerador y del denominador de la planta en z
[Nz,Dz] = tfdata(Ptaz,'v');
a1 = Nz(2);
a0 = Nz(3);
b1 = Dz(2);
b0 = Dz(3);

%% Soluci�n del sistema de ecuaciones del enunciado
A = [-1 -a1 -a1 -a1; p2+p3+p1 a1-a0 -a1-a0 -a0+2*a1;...
    -p1*p2-p3*p1-p3*p2 a0 -a0 2*a0-a1; p1*p2*p3 0 0 -a0];
b = [p1+p2+p3-1+b1; -p1*p2-p3*p1-p3*p2+b0-b1; p1*p2*p3-b0; 0];

% Determinaci�n del vector x de par�metros del controlador:
x = A\b;% x = inv(A)*b;

% C�lculo de los valores de las constantes
p4 = x(1);
Kp = x(2);
Ki = x(3)*2/Ts;
Kd = x(4)*Ts;

% C�lculo de dominancia de los arreglos
dominancia = log(abs(p4))/log(abs(p1));

%% print resultados
fprintf('\n======================\n')
fprintf('Par�metros del sistema\n')
fprintf('======================\n')
fprintf('\nPolos\n')
fprintf('----------------------\n')
fprintf('p1 = %.2f + j%.2f\n',real(p1), imag(p1))
fprintf('p2 = %.2f - j%.2f\n',real(p2), abs(imag(p2)))
fprintf('p3 = %.2f\n',p3)
fprintf('p4 = %.2f\n',p4)
fprintf('\nConstantes controlador\n')
fprintf('----------------------\n')
fprintf('Kp = %.2f\n',Kp)
fprintf('Ki = %.2f\n',Ki)
fprintf('Kd = %.2f\n',Kd)

fprintf('\n=================================\n')
fprintf('Dominancia (log(|p4|)/log(|p1|)) => %.3f',dominancia)
fprintf('\n=================================\n')

%% Sistema final
P = tf(Kp,1,Ts); % Acci�n proporcional
I = (Ki*Ts/2)*tf([1 1],[1 -1],Ts); % Acci�n integral
D = (Kd/Ts)*tf([1 -1],[1 0],Ts); % Acci�n derivativa
PID = P+I+D; % Controlador PID
 
PIDGz = series(PID,Ptaz); % FT lazo abierto
W = feedback(PIDGz,1);    % FT lazo cerrado
 
figure(), pzmap(W) % mapa de polos y ceros
figure(), step (W) % Respuesta escal�n
