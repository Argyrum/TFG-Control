% clear all, 
% close all,

s = tf('s');
K0 = [];
tau0 = [];
 
% Defining the system's components
motor = K0/(tau0*s+1); % motor
int   = 1/s; % integrator
red   = 1/9; % reductor
Kpot  = 1.62; % potentiometer

% Continuous-time open-loop transfer function
aoc = motor*red*int*Kpot;

for Ts = [0.01 0.05 0.2 0.35]
    
% Discrete-time open-loop transfer function
aod = c2d(aoc,Ts,'zoh');

% Discrete-time closed-loop transfer function
atd = feedback(aod,1);

% Pole-zero map of the dynamic system
figure(3)
hold on
pzmap(atd);

% Poles
fprintf('Poles of the system for Ts = %.3f:\n',Ts)
disp(pole(atd))

end

legend('Ts=0.01','Ts=0.05','Ts=0.2','Ts=0.3')



