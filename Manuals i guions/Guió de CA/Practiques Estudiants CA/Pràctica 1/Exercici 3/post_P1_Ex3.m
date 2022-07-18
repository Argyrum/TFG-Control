clc;
close all;
   
temps=Dades_P1_Ex3(:,1);
consigna=Dades_P1_Ex3(:,2);
tacometre=Dades_P1_Ex3(:,3);
potenciometre=Dades_P1_Ex3(:,4);
error=Dades_P1_Ex3(:,5);

[fils_dades cols_dades]=size(Dades_P1_Ex3);

% gràfica de l'execució actual (senyal tacómetre)
figure(1);
grid on;
hold on;
axis([temps(1,1)-0.5 temps(end,end)+0.5 min(min(consigna,tacometre))-0.5 max(max(consigna,tacometre))+0.5]);
plot(temps,consigna);
plot(temps,tacometre,'.');
legend('consigna (V)','tacòmetre (V)','Location','SouthEast','Orientation','Horizontal');
xlabel('temps (s)');
ylabel('Voltatge (V)');
title('Consigna i resposta de velocitat en LLAÇ TANCAT (Cont Prop)');

% gràfica de l'execució actual (senyal potenciometre)
figure(2);
grid on;
hold on;
axis([temps(1,1)-0.5 temps(end,end)+0.5 min(min(consigna,potenciometre))-0.5 max(max(consigna,potenciometre))+0.5]);
plot(temps,consigna);
plot(temps,potenciometre,'r.');
legend('consigna (V)','potenciòmetre (V)','Location','SouthEast','Orientation','Horizontal');
xlabel('temps (s)');
ylabel('Voltatge (V)');
title('Consigna i resposta de posicio en LLAÇ TANCAT (Cont Prop)');

% gràfica de l'execució actual (senyal error)
figure(3);
grid on;
hold on;
axis([temps(1,1)-0.5 temps(end,end)+0.5 min(min(error))-0.5 max(max(error))+0.5]);
plot(temps,error);
legend('error posicio (V)','Location','SouthEast','Orientation','Horizontal');
%legend(AX,'temps (s)','Voltatge (V)');
xlabel('temps (s)');
ylabel('Voltatge (V)');
title('Error de posicio en LLAÇ TANCAT (Cont Prop)');

clear temps;
clear consigna;
clear potenciometre;
clear tacometre;
clear error;

% Acumulem les diferents respostes per diferents Kp's
if Kp~=Kpant
    Acum_P1_Ex3=[Acum_P1_Ex3 Dades_P1_Ex3];
    Kpant=Kp;
    Ks=[Ks Kp];
else
    Acum_P1_Ex3=[Acum_P1_Ex3(:,1:end-5) Dades_P1_Ex3];
end

% gràfica comparativa amb totes les Kp's
[fils cols]=size(Acum_P1_Ex3);
if (and((mod(cols,cols_dades)==0),cols>cols_dades))
    error=[];
    div=cols/cols_dades;
    i=1;
    temps=Acum_P1_Ex3(:,1);
    figure(4);
    hold on;
    grid on;
    xlabel('temps (s)');
    ylabel('Voltatge (V)');
    title('Error de posicio en LLAÇ TANCAT per diferents guanys del sistema');
    LEGEND=[];
    while (i<=div)
        %prop=;
        plot(temps,Acum_P1_Ex3(:,i*cols_dades-1),chars(i,:));
        if (i==1)
            LEGEND=strcat('Kp=',num2str(Ks(1,i)));
        elseif (i>1)
            LEGEND=char({LEGEND;strcat('Kp=',num2str(Ks(1,i)))});
        else
        end
        i=i+1;
    end
    legend(LEGEND,'Location','East','Orientation','Vertical');
end
        


