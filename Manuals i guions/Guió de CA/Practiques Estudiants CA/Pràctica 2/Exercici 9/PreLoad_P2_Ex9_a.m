% Valor de l'amplada de cada graó de la consigna
t=5;
% Exstrems del voltatge de la consigna
Vmax=5;
Vmin=-5;
% Temps total d'execució
Total_time=20.0;
% model del sistema (obrim fitxer creat a la pràctica 1: exercici 4)
    K0=0.82/0.017;
    tau0=0.26;
% Períodes de mostratge
Tg=0.005;
Ts=0.01;
Kt=0.017;
Kpot=1.62;
% Cridem l'arxiu *.m de la part teorica de l'exercici 9
% P2_Ex9;
close all;
Kp=70;
chars=['b.';'r.';'c.';'m.';'y.';'k.'];