% Valor del semiperíode de l'ona de consigna
    t=4;
% Valor de la consigna graó [Vmax, Vmin]
    Vmax=1;
    Vmin=-1;
% Límits del motor
    Vminmot=-5;
    Vmaxmot=5;
% Número de repeticions
    N=4;
% Períodes de mostratge
    Tg=0.005;
    Ts=0.01;
% Constants del sistema
% Constant del tacòmetre
    Kt=0.017;
% Constant del potenciòmetre
    Kpot=1.62;
% Constant del controlador proporcional
    Kp=1;
% Contador del número d'experiments
    i=1;
    chars=['b.';'r.';'c.';'m.';'y.';'k.'];
    Acum_P1_Ex6=[];
% Temps total de l'experiment
    Total_time=24;