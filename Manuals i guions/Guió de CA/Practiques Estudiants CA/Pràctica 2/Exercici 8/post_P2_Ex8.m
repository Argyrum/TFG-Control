clc;
close all;
temps=Dades_P2_Ex8(:,1);
consigna=Dades_P2_Ex8(:,2);
resposta=Dades_P2_Ex8(:,3);
figure
plot(temps,[consigna,resposta])
legend('consigna', 'resposta')
    
