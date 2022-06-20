[fils2,cols2]=size(Dades_P1_Ex6);

Dades_P1_Ex6 = Dades_P1_Ex6(1:4800,:); %!!!LS!!!

% if (fils2==Total_time/Tg+1) %!!!LS!!!
clc;
close all;

temps=Dades_P1_Ex6(:,1);
consigna=Dades_P1_Ex6(:,2);
posicio=Dades_P1_Ex6(:,3);
comandament=Dades_P1_Ex6(:,4);

[fils_dades, cols_dades]=size(Dades_P1_Ex6);

figure(1);
%subplot(2,1,1);
grid on;
hold on;
axis([temps(1,1)-0.5 temps(end,end)+0.5 min(min(consigna,posicio))-0.5 max(max(consigna,posicio))+0.5]);
plot(temps,consigna);
plot(temps,posicio,'.');
legend('consigna (V)','potenciòmetre (V)','Location','SouthEast','Orientation','Horizontal');
%legend(AX,'temps (s)','Voltatge (V)');
xlabel('temps (s)');
title('Consigna i resposta de posicio en LLAÇ TANCAT');
[fils1,cols1]=size(Acum_P1_Ex6);
if (fils1==0)
    periodes_emprats=[Ts];
    Acum_P1_Ex6=[Dades_P1_Ex6];
else
    i=1;
    trobat=false;
    
    while and((i<=cols_periodes),~trobat)
        trobat=periodes_emprats(1,i)==Ts;
        i=i+1;
    end
    if (~trobat)
        periodes_emprats=[periodes_emprats Ts];
        Acum_P1_Ex6=[Acum_P1_Ex6 Dades_P1_Ex6];
    else
        i=i-1;
        Acum_P1_Ex6(:,(i-1)*cols_dades+1:i*cols_dades)=Dades_P1_Ex6;
    end
end
[fils_periodes, cols_periodes]=size(periodes_emprats);
if (cols_periodes>1)
    i=1;
    figure(2);
    grid on;
    hold on;
    temps=Acum_P1_Ex6(:,1);
    %        consigna=Acum_P1_Ex6(:,2);
    %        plot(temps,consigna,'-');
    llegenda=[];
    title('Llaç tancat amb realimentació de POSICIÓ');
    while (i<=cols_periodes)
        plot(temps,Acum_P1_Ex6(:,(i-1)*cols_dades+3),chars(i,:));
        if (i==1)
            llegenda={strcat('Ts=',num2str(periodes_emprats(1,i)))};
        else
            llegenda={char(llegenda);strcat('Ts=',num2str(periodes_emprats(1,i)))};
        end
        i=i+1;
    end
    llegenda=char(llegenda);
    legend(llegenda);
else
end
% else %!!!LS!!!
%     display('No executat post_P1_Ex6 degut a que no ha finalitzat
%     correctament la execució'); %!!!LS!!!
% end %!!!LS!!!