% Increment de t de l'entrada
t=8;
% L�mits del motor
Vminmot=-5;
Vmaxmot=5;
% Nivell alt de tensi�
Vmax=2;
% Nivell baix de tensi�
Vmin=-2;
% N�mero de repeticions
N=2;
% Per�ode de mostratge
Tg=0.005;
Ts=0.01;
% dades del sistema
Kt=0.013;
Kpot=1.62;
% constant de proporcionalitat
Kp=1;
chars=['b.';'r.';'c.';'m.';'y.';'k.'];
Acum_P1_Ex5=[];
% temps total d'execuci�
Total_time=2*N*t;