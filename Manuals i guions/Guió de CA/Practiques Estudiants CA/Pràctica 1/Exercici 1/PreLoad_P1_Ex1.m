% Arxiu PreLoad de P1_Ex1
% Increment de t de l'entrada
t=2.5;
% N�mero de repeticions de cicle
N=3;
% Per�odes de mostratge
Tg=0.005;
Ts=0.01;
% l�mits del motor
Vmaxmot=5;
Vminmot=-5;
% Constants del sistema
Kt=0.017;
Kpot=1.62;
% Variables acumulatives
Acum_P1_Ex1=[];
Dades_P1_Ex1=[];
% Nombre de consignes diferents
num_consignes=4;
% Construcci� d'una ona quadrada d'amplitud progressiva
input_vector=[];
% nivell alt de tensi�
Vmax=1;
while (Vmax<=3)
    Vmin=-Vmax;
    i=1;
    while (i<=N)
        input_vector=[input_vector [Vmin Vmax]];
        i=i+1;
    end
    Vmax=Vmax+1;
end
% temps total d'execuci�
[input_fils input_cols]=size(input_vector);
%Total_time=(Vmax-1)*2*N*t;
Total_time=2*t*(input_cols/2);