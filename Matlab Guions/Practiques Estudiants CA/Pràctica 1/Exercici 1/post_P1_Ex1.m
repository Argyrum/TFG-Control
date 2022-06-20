clc;
close all;

% guardem les variables del sheet de simulink en variables més fàcils de
% manejar
fre=Aux(1,1);
tipus_consigna=Aux(1,2);
temps=Dades_P1_Ex1(:,1);
consigna=Dades_P1_Ex1(:,2);
tacometre=Dades_P1_Ex1(:,3);
potenciometre=Dades_P1_Ex1(:,4);


[fils_dades, cols_dades]=size(Dades_P1_Ex1);
% if (fils_dades==Total_time/Ts) %!!!LS!!!
figure(1);
grid on;
hold on;
axis([temps(1,1)-0.5 temps(end,end)+0.5 min(min(consigna,tacometre))-0.5 max(max(consigna,tacometre))+0.5]);
plot(temps,consigna);
plot(temps,tacometre,'.');
legend('consigna (V)','tacòmetre (V)','Location','SouthEast','Orientation','Horizontal');
xlabel('temps (s)');
ylabel('Voltatge (V)');
title('Consigna i resposta de velocitat en LLAÇ OBERT');

% figure(2);
% grid on;
% hold on;
% axis([temps(1,1)-0.5 temps(end,end)+0.5 min(min(consigna,potenciometre))-0.5 max(max(consigna,potenciometre))+0.5]);
% plot(temps,consigna);
% plot(temps,potenciometre,'r.');
% legend('consigna (V)','potenciòmetre (V)','Location','SouthEast','Orientation','Horizontal');
% %legend(AX,'temps (s)','Voltatge (V)');
% xlabel('temps (s)');
% ylabel('Voltatge (V)');
% Title('Consigna i resposta de posicio en LLAÇ OBERT');

clear temps;
clear consigna;
clear potenciometre;
clear tacometre;

% Observem el tamany de "Acum_P1_Ex1"
[fils cols]=size(Acum_P1_Ex1);
% Si el nº de columnes es =0 -> inicialitzem la variable "Acum_P1_Ex1" i la
% variable "consignes_visitades" l'inicialitzem a [0...0]
if (cols==0)
    i=1;
    while (i<=num_consignes)
        Acum_P1_Ex1=[Acum_P1_Ex1 0.0*Dades_P1_Ex1 0.0*Dades_P1_Ex1];
        i=i+1;
    end
    consignes_visitades=zeros(1,2*num_consignes);
else
end

% si l'execució s'ha fet amb fre o sense emmagatzemem el contigut de
% "Dades_P1_Ex1" a les columnes corresponents de "Acum_P1_Ex1"
if (~fre)
    consignes_visitades(1,2*tipus_consigna-1)=tipus_consigna;
    Acum_P1_Ex1(:,(tipus_consigna-1)*2*cols_dades+1:(tipus_consigna-1)*2*cols_dades+cols_dades)=Dades_P1_Ex1(:,:);
elseif (fre)
    consignes_visitades(1,2*tipus_consigna)=tipus_consigna;
    Acum_P1_Ex1(:,tipus_consigna*2*cols_dades-cols_dades+1:tipus_consigna*2*cols_dades)=Dades_P1_Ex1(:,:);
else
    
end
% Per cada tipus de consigna fem el gràfic acumulatiu (fre,!fre) en una
% finestra nova
i=1;
j=1;
while (i<=num_consignes)
    if (and(consignes_visitades(1,2*i-1)~=0,consignes_visitades(1,2*i)~=0))
        figure(1+j);
        temps=Acum_P1_Ex1(:,(i-1)*2*cols_dades+1);
        con=Acum_P1_Ex1(:,(i-1)*2*cols_dades+2);
        resp1=Acum_P1_Ex1(:,(i-1)*2*cols_dades+3);
        resp2=Acum_P1_Ex1(:,i*2*cols_dades-cols_dades+3);
        plot(temps,con,'g');
        hold on;
        plot(temps,resp1,'r.');
        plot(temps,resp2,'b.');
        legend('consigna (V)','tacòmetre (sense fre magnètic) (V)','tacòmetre (amb fre magnètic) (V)','Location','SouthWest','Orientation','Vertical');
        xlabel('temps (s)');
        ylabel('Voltatge (V)');
        grid on;
        title('Consigna i resposta de velocitat en LLAÇ OBERT');
        j=j+1;
    else
        
    end
    i=i+1;
end
% else %!!!LS!!!

% end %!!!LS!!!