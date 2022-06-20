% Increment de t de l'entrada
t=8;
% Límits del motor
Vminmot=-5;
Vmaxmot=5;
% Nivell alt de tensió
Vmax=2;
% Nivell baix de tensió
Vmin=-2;
% Número de repeticions
N=2;
% Període de mostratge
Tg=0.005;
Ts=0.01;
% dades del sistema
Kt=0.013;
Kpot=1.62;
% constant de proporcionalitat
Kp=1;
chars=['b.';'r.';'c.';'m.';'y.';'k.'];
Acum_P1_Ex5=[];
% temps total d'execució
Total_time=2*N*t;