% Arxiu PreLoad de P1_Ex1
% Increment de t de l'entrada
t=2.0;
Kp=1;
Kpant=1;
Vmax=2;
% N�mero de repeticions de cicle
N=2;
% Per�odes de mostratge
Tg=0.005;
Ts=0.01;
% Par�metres del sistema
Kt=0.017;
Kpot=1.62;
Ks=[Kp];
% vector de modes de visualitzaci�
chars=['b.';'r.';'c.';'m.';'y.';'k.'];
% variables acumulatives
Acum_P1_Ex2=[];
% Construcci� de la consigna amb condicions inicials nul�les
i=1;
Vmin=-Vmax;
input_vector=[];
while (i<=N)
    input_vector=[input_vector [Vmin Vmax]];
    i=i+1;
end
[fils_input cols_input]=size(input_vector);
Total_time=t*N*cols_input;