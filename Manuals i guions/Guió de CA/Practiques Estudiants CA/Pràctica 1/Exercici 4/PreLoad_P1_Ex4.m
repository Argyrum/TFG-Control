% Arxiu PreLoad de P1_Ex4
% Increment de t de l'entrada
t=5.0;
% Límits del motor
Vminmot=-5;
Vmaxmot=5;
% Nivell alt de tensió
Vmax=5;
% Nivell baix de tensió
Vmin=0;
% Número de repeticions de cicle
N=2;
% Temps total d'execució
Total_time=2*N*t;
% Períodes de mostratge
Tg=0.005;
Ts=0.01;
% dades del sistema
Kt=0.017;
Kpot=1.62;
chars=['b.';'r.';'c.';'m.';'y.';'k.'];
% construcció dle vector d'entrada
i=1;
input_vector=[];
while (i<=N)
    input_vector=[input_vector [Vmin Vmax]];
    i=i+1;
end
