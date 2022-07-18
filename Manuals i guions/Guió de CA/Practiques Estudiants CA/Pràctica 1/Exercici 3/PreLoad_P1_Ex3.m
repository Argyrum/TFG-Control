% Arxiu PreLoad de P1_Ex1
% Increment de t de l'entrada
t=2.0;
% constant de proporcionalitat
Kp=2;
Kpant=1;
%Vmax=3;
Vmax=2;
% Número de repeticions de cicle
N=2;
Tg=0.005;
Ts=0.01;
Kt=0.017;
Kpot=1.62;
% Variables acumulatives
Acum_P1_Ex3=[];
Ks=[Kp];
chars=['b.';'r.';'c.';'m.';'y.';'k.'];
% Construcció del vector de consigna amb condicions inicials nul·les
i=1;
Vmin=-Vmax;
%Vmin=0.0;
input_vector=[0 0];
while (i<=N)
    input_vector=[input_vector [Vmin 0 Vmax 0]];
    i=i+1;
end
[fils_input cols_input]=size(input_vector);
Total_time=t*cols_input;
