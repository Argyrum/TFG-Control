% Valor del semiper�ode de l'ona de consigna
    t=4;
% Valor de la consigna gra� [Vmax, Vmin]
    Vmax=1;
    Vmin=-1;
% L�mits del motor
    Vminmot=-5;
    Vmaxmot=5;
% N�mero de repeticions
    N=4;
% Per�odes de mostratge
    Tg=0.005;
    Ts=0.01;
% Constants del sistema
% Constant del tac�metre
    Kt=0.017;
% Constant del potenci�metre
    Kpot=1.62;
% Constant del controlador proporcional
    Kp=1;
% Contador del n�mero d'experiments
    i=1;
    chars=['b.';'r.';'c.';'m.';'y.';'k.'];
    Acum_P1_Ex6=[];
% Temps total de l'experiment
    Total_time=24;