% Arxiu PreLoad de P1_Ex4
% Increment de t de l'entrada
t=5.0;
% L�mits del motor
Vminmot=-5;
Vmaxmot=5;
% Nivell alt de tensi�
Vmax=5;
% Nivell baix de tensi�
Vmin=0;
% N�mero de repeticions de cicle
N=2;
% Temps total d'execuci�
Total_time=2*N*t;
% Per�odes de mostratge
Tg=0.005;
Ts=0.01;
% dades del sistema
Kt=0.017;
Kpot=1.62;
chars=['b.';'r.';'c.';'m.';'y.';'k.'];
% construcci� dle vector d'entrada
i=1;
input_vector=[];
while (i<=N)
    input_vector=[input_vector [Vmin Vmax]];
    i=i+1;
end
