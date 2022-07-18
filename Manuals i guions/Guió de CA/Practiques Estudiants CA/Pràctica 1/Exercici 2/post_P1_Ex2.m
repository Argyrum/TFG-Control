clc;
close all;
   
temps=Dades_P1_Ex2(:,1);
consigna=Dades_P1_Ex2(:,2);
tacometre=Dades_P1_Ex2(:,3);
potenciometre=Dades_P1_Ex2(:,4);
error=Dades_P1_Ex2(:,5);

[fils_dades cols_dades]=size(Dades_P1_Ex2);

% Treiem un gràfic amb l'última execució (senyal tacometre)
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

% Treiem un gràfic amb l'última execució (error)
figure(2);
grid on;
hold on;
axis([temps(1,1)-0.5 temps(end,end)+0.5 min(min(error))-0.5 max(max(error))+0.5]);
plot(temps,error);
legend('error velocitat (V)','Location','SouthEast','Orientation','Horizontal');
%legend(AX,'temps (s)','Voltatge (V)');
xlabel('temps (s)');
ylabel('Voltatge (V)');
title('Error de velocitat en LLAÇ TANCAT (Cont Prop)');

clear temps;
clear consigna;
clear tacometre;
clear error;

% Acumulem les dades: si la Kp actual és diferent de la Kp emprada a
% l'execució anterior, emmagatzemem les noves dades. En cas contrari
% substituim les dades per les noves.
if Kp~=Kpant
    Acum_P1_Ex2=[Acum_P1_Ex2 Dades_P1_Ex2];
    Kpant=Kp;
    Ks=[Ks Kp];
else
    Acum_P1_Ex2=[Acum_P1_Ex2(:,1:end-5) Dades_P1_Ex2];
end

% Fem un plot amb les diferents execucions amb diferenst Kp's
[fils cols]=size(Acum_P1_Ex2);
if (and((mod(cols,cols_dades)==0),cols>cols_dades))
    error=[];
    div=cols/cols_dades;
    i=1;
    temps=Acum_P1_Ex2(:,1);
    figure(3);
    hold on;
    grid on;
    xlabel('temps (s)');
    ylabel('Voltatge (V)');
    Title('Error de velocitat en LLAÇ TANCAT per diferents guanys del sistema');
    LEGEND=[];
    while (i<=div)
        plot(temps,Acum_P1_Ex2(:,i*cols_dades-2),chars(i,:));
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
        


