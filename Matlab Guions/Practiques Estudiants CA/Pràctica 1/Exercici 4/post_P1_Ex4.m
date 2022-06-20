clc
close all,

temps=Dades_P1_Ex4(:,1);
Vin=Dades_P1_Ex4(:,2);
Vout=Dades_P1_Ex4(:,3)*Kt;

figure(1);
grid on;
hold on;
plot(temps,[Vin Vout])
xlabel('temps (s)');
ylabel('Voltatge (V)');
title('Consigna i resposta de velocitat en LLAÇ OBERT - Identificació del sistema');
legend('consigna (V)','tacòmetre (V)','Location','SouthEast','Orientation','Horizontal');
