% Gràfic del bode empíric del filtre
% TestFiltre com a matriu numèrica
%%
% Setup
format compact
clearvars
clc

%%
% Variables
TestFiltre = load('./Data/TestFiltre.mat');
TestFiltre = TestFiltre.TestFiltre;

%%
% Gràfic
figure();
semilogx(TestFiltre(:,1), 20*log(TestFiltre(:,4)./TestFiltre(:,2)));
ylabel('Guany [dB]');
title('Bode empíric del filtre passabaixos de 34Hz');
axis([0 10000 -100 40]);
hold on;
line([34 34], [-100 40]);
yyaxis right;
plot(TestFiltre(:,1), TestFiltre(:,6));
axis([0 10000 -100 40]);
ylabel('Desfasament [º]');
hold off;

%%
% Guardem el resultat
set(gcf,'units','pixels','position',[0,0,1920,963]);
exportgraphics(gcf, 'BodeFiltre34.png');